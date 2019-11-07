import Fetch from 'node-fetch'
import * as _ from 'lodash'
import {
    endpoint
} from '../src/config'
import * as Collection from '../src/collection'
import * as File from '../src/file'
import * as Item from '../src/item'
const collectionID = 1
const mapboxToken = 'pk.eyJ1IjoibXRidXRsZXIiLCJhIjoiY2pjdzFxaHhiNGt0MjJybnh6OTJnZ3h4dyJ9.KlVoNBd74vYAs16sOxN87w'

Collection.getCollectionMetadataById(endpoint, collectionID).then(data => {
    let title = getMetadata(data.element_texts, "Title")
    let subtitle = getMetadata(data.element_texts, "Description")
    let byline = getMetadata(data.element_texts, "Creator")

    Collection.getItemsInCollection(endpoint, collectionID).then(data => {
      let chapters = []
        _.forEach(data, element => {
          let chapter = {}
          chapter.title = getMetadata(element.element_texts, "Title")
          chapter.description = getMetadata(element.element_texts, "Description")
          chapter.location = getMetadata(element.element_texts, "Spatial Coverage")
          chapter.onChapterEnter = []
          chapter.onChapterExit = []
          chapter.image = ''
          chapter.id = _.kebabCase(chapter.title)

          Item.getFilesInItem(endpoint, element.id).then(file => {
            let originalFile = file[0].file_urls.original
            let thumbnailFile = file[0].file_urls.thumbnail
            chapter.image = thumbnailFile              
          }) 

          chapters.push(chapter)
        })
        console.log(chapters)        
    })



    function buildChapters() {
        let chapters = []

        [{
                id: 'slug-style-id',
                title: 'Display Title',
                image: './path/to/image/source.png',
                description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                location: {
                    center: [-122.418398, 37.759483],
                    zoom: 13.5,
                    pitch: 60,
                    bearing: 0
                },
                onChapterEnter: [
                    // {
                    //     layer: 'layer-name',
                    //     opacity: 1
                    // }
                ],
                onChapterExit: [
                    // {
                    //     layer: 'layer-name',
                    //     opacity: 0
                    // }
                ]
            },
            {
                id: 'other-identifier',
                title: 'Second Title',
                image: './path/to/image/source.png',
                description: 'Copy these sections to add to your story.',
                location: {
                    center: [-77.020636, 38.886900],
                    zoom: 13.5,
                    pitch: 60,
                    bearing: -43.2
                },
                onChapterEnter: [],
                onChapterExit: []
            }
        ]
    }

    let layerTypes = {
        'fill': ['fill-opacity'],
        'line': ['line-opacity'],
        'circle': ['circle-opacity', 'circle-stroke-opacity'],
        'symbol': ['icon-opacity', 'text-opacity'],
        'raster': ['raster-opacity'],
        'fill-extrusion': ['fill-extrusion-opacity']
    }

    let alignments = {
        'left': 'lefty',
        'center': 'centered',
        'right': 'righty'
    }

    function getLayerPaintType(layer) {
        let layerType = map.getLayer(layer).type;
        return layerTypes[layerType];
    }

    function setLayerOpacity(layer) {
        let paintProps = getLayerPaintType(layer.layer);
        paintProps.forEach(function(prop) {
            map.setPaintProperty(layer.layer, prop, layer.opacity);
        });
    }

    let story = document.getElementById('story');
    let features = document.createElement('div');
    features.classList.add(alignments[config.alignment]);
    features.setAttribute('id', 'features');

    let header = document.createElement('div');

    if (config.title) {
        let titleText = document.createElement('h1');
        titleText.innerText = config.title;
        header.appendChild(titleText);
    }

    if (config.subtitle) {
        let subtitleText = document.createElement('h2');
        subtitleText.innerText = config.subtitle;
        header.appendChild(subtitleText);
    }

    if (config.byline) {
        let bylineText = document.createElement('p');
        bylineText.innerText = config.byline;
        header.appendChild(bylineText);
    }

    if (header.innerText.length > 0) {
        header.classList.add(config.theme);
        header.setAttribute('id', 'header');
        story.appendChild(header);
    }

    config.chapters.forEach((record, idx) => {
        let container = document.createElement('div');
        let chapter = document.createElement('div');

        if (record.title) {
            let title = document.createElement('h3');
            title.innerText = record.title;
            chapter.appendChild(title);
        }

        if (record.image) {
            let image = new Image();
            image.src = record.image;
            chapter.appendChild(image);
        }

        if (record.description) {
            let story = document.createElement('p');
            story.innerHTML = record.description;
            chapter.appendChild(story);
        }

        container.setAttribute('id', record.id);
        container.classList.add('step');
        if (idx === 0) {
            container.classList.add('active');
        }

        chapter.classList.add(config.theme);
        container.appendChild(chapter);
        features.appendChild(container);
    });

    story.appendChild(features);

    let footer = document.createElement('div');

    if (config.footer) {
        let footerText = document.createElement('p');
        footerText.innerHTML = config.footer;
        footer.appendChild(footerText);
    }

    if (footer.innerText.length > 0) {
        footer.classList.add(config.theme);
        footer.setAttribute('id', 'footer');
        story.appendChild(footer);
    }

    mapboxgl.accessToken = config.accessToken;

    const transformRequest = (url) => {
        const hasQuery = url.indexOf("?") !== -1;
        const suffix = hasQuery ? "&pluginName=journalismScrollytelling" : "?pluginName=journalismScrollytelling";
        return {
            url: url + suffix
        }
    }

    let map = new mapboxgl.Map({
        container: 'map',
        style: config.style,
        center: config.chapters[0].location.center,
        zoom: config.chapters[0].location.zoom,
        bearing: config.chapters[0].location.bearing,
        pitch: config.chapters[0].location.pitch,
        scrollZoom: false,
        transformRequest: transformRequest
    });

    let marker = new mapboxgl.Marker();
    if (config.showMarkers) {
        marker.setLngLat(config.chapters[0].location.center).addTo(map);
    }

    // instantiate the scrollama
    let scroller = scrollama();

    map.on("load", function() {
        // setup the instance, pass callback functions
        scroller
            .setup({
                step: '.step',
                offset: 0.5,
                progress: true
            })
            .onStepEnter(response => {
                let chapter = config.chapters.find(chap => chap.id === response.element.id);
                response.element.classList.add('active');
                map.flyTo(chapter.location);
                if (config.showMarkers) {
                    marker.setLngLat(chapter.location.center);
                }
                if (chapter.onChapterEnter.length > 0) {
                    chapter.onChapterEnter.forEach(setLayerOpacity);
                }
            })
            .onStepExit(response => {
                let chapter = config.chapters.find(chap => chap.id === response.element.id);
                response.element.classList.remove('active');
                if (chapter.onChapterExit.length > 0) {
                    chapter.onChapterExit.forEach(setLayerOpacity);
                }
            });
    });

    // setup resize event
    window.addEventListener('resize', scroller.resize);


})

function getMetadata(elementTexts, metadataFieldName) {
    let result = ''
    _.forEach(elementTexts, item => {
        if (item.element.name === metadataFieldName) {
            result = item.text
        }
    })
    return result
}

/*
Collection.getItemsInCollection(endpoint, 1).then(data => {
  
    const config = {
        style: 'mapbox://styles/mapbox/streets-v11',
        accessToken: 'pk.eyJ1IjoibXRidXRsZXIiLCJhIjoiY2pjdzFxaHhiNGt0MjJybnh6OTJnZ3h4dyJ9.KlVoNBd74vYAs16sOxN87w',
        showMarkers: true,
        theme: 'light',
        alignment: 'left',
        title: 'The Title Text of this Story',
        subtitle: 'A descriptive and interesting subtitle to draw in the reader',
        byline: 'By a Digital Storyteller',
        footer: 'Source: source citations, etc.',
        chapters: [{
                id: 'slug-style-id',
                title: 'Display Title',
                image: './path/to/image/source.png',
                description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                location: {
                    center: [-122.418398, 37.759483],
                    zoom: 13.5,
                    pitch: 60,
                    bearing: 0
                },
                onChapterEnter: [
                    // {
                    //     layer: 'layer-name',
                    //     opacity: 1
                    // }
                ],
                onChapterExit: [
                    // {
                    //     layer: 'layer-name',
                    //     opacity: 0
                    // }
                ]
            },
            {
                id: 'other-identifier',
                title: 'Second Title',
                image: './path/to/image/source.png',
                description: 'Copy these sections to add to your story.',
                location: {
                    center: [-77.020636, 38.886900],
                    zoom: 13.5,
                    pitch: 60,
                    bearing: -43.2
                },
                onChapterEnter: [],
                onChapterExit: []
            }
        ]
    };

    let layerTypes = {
        'fill': ['fill-opacity'],
        'line': ['line-opacity'],
        'circle': ['circle-opacity', 'circle-stroke-opacity'],
        'symbol': ['icon-opacity', 'text-opacity'],
        'raster': ['raster-opacity'],
        'fill-extrusion': ['fill-extrusion-opacity']
    }

    let alignments = {
        'left': 'lefty',
        'center': 'centered',
        'right': 'righty'
    }

    function getLayerPaintType(layer) {
        let layerType = map.getLayer(layer).type;
        return layerTypes[layerType];
    }

    function setLayerOpacity(layer) {
        let paintProps = getLayerPaintType(layer.layer);
        paintProps.forEach(function(prop) {
            map.setPaintProperty(layer.layer, prop, layer.opacity);
        });
    }

    let story = document.getElementById('story');
    let features = document.createElement('div');
    features.classList.add(alignments[config.alignment]);
    features.setAttribute('id', 'features');

    let header = document.createElement('div');

    if (config.title) {
        let titleText = document.createElement('h1');
        titleText.innerText = config.title;
        header.appendChild(titleText);
    }

    if (config.subtitle) {
        let subtitleText = document.createElement('h2');
        subtitleText.innerText = config.subtitle;
        header.appendChild(subtitleText);
    }

    if (config.byline) {
        let bylineText = document.createElement('p');
        bylineText.innerText = config.byline;
        header.appendChild(bylineText);
    }

    if (header.innerText.length > 0) {
        header.classList.add(config.theme);
        header.setAttribute('id', 'header');
        story.appendChild(header);
    }

    config.chapters.forEach((record, idx) => {
        let container = document.createElement('div');
        let chapter = document.createElement('div');

        if (record.title) {
            let title = document.createElement('h3');
            title.innerText = record.title;
            chapter.appendChild(title);
        }

        if (record.image) {
            let image = new Image();
            image.src = record.image;
            chapter.appendChild(image);
        }

        if (record.description) {
            let story = document.createElement('p');
            story.innerHTML = record.description;
            chapter.appendChild(story);
        }

        container.setAttribute('id', record.id);
        container.classList.add('step');
        if (idx === 0) {
            container.classList.add('active');
        }

        chapter.classList.add(config.theme);
        container.appendChild(chapter);
        features.appendChild(container);
    });

    story.appendChild(features);

    let footer = document.createElement('div');

    if (config.footer) {
        let footerText = document.createElement('p');
        footerText.innerHTML = config.footer;
        footer.appendChild(footerText);
    }

    if (footer.innerText.length > 0) {
        footer.classList.add(config.theme);
        footer.setAttribute('id', 'footer');
        story.appendChild(footer);
    }

    mapboxgl.accessToken = config.accessToken;

    const transformRequest = (url) => {
        const hasQuery = url.indexOf("?") !== -1;
        const suffix = hasQuery ? "&pluginName=journalismScrollytelling" : "?pluginName=journalismScrollytelling";
        return {
            url: url + suffix
        }
    }

    let map = new mapboxgl.Map({
        container: 'map',
        style: config.style,
        center: config.chapters[0].location.center,
        zoom: config.chapters[0].location.zoom,
        bearing: config.chapters[0].location.bearing,
        pitch: config.chapters[0].location.pitch,
        scrollZoom: false,
        transformRequest: transformRequest
    });

    let marker = new mapboxgl.Marker();
    if (config.showMarkers) {
        marker.setLngLat(config.chapters[0].location.center).addTo(map);
    }

    // instantiate the scrollama
    let scroller = scrollama();

    map.on("load", function() {
        // setup the instance, pass callback functions
        scroller
            .setup({
                step: '.step',
                offset: 0.5,
                progress: true
            })
            .onStepEnter(response => {
                let chapter = config.chapters.find(chap => chap.id === response.element.id);
                response.element.classList.add('active');
                map.flyTo(chapter.location);
                if (config.showMarkers) {
                    marker.setLngLat(chapter.location.center);
                }
                if (chapter.onChapterEnter.length > 0) {
                    chapter.onChapterEnter.forEach(setLayerOpacity);
                }
            })
            .onStepExit(response => {
                let chapter = config.chapters.find(chap => chap.id === response.element.id);
                response.element.classList.remove('active');
                if (chapter.onChapterExit.length > 0) {
                    chapter.onChapterExit.forEach(setLayerOpacity);
                }
            });
    });

    // setup resize event
    window.addEventListener('resize', scroller.resize);
})

*/