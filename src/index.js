import Fetch from 'node-fetch'
import * as _ from 'lodash'
import {
    endpoint
} from '../src/config'
import * as Collection from '../src/collection'
import * as Item from '../src/item'

getInfo(endpoint, 1).then(config => {
  buildMap(config)
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

async function getInfo(endpoint, collectionID) {
    let chapters = []
    let collection = Collection.getCollectionMetadataById(endpoint, collectionID)
    let collData = await Promise.resolve(collection)
    let items = Collection.getItemsInCollection(endpoint, collectionID)
    let itemsData = await Promise.resolve(items)

    for (let i=0; i<itemsData.length; i++) {
      let chapter = {}
        let files = Item.getFilesInItem(endpoint, itemsData[i].id)
        let filesData = await Promise.resolve(files)
        chapter.title = getMetadata(itemsData[i].element_texts, "Title")
        chapter.description = getMetadata(itemsData[i].element_texts, "Description")
        let location = getMetadata(itemsData[i].element_texts, "Spatial Coverage")
        chapter.location = JSON.parse(location)
        chapter.onChapterEnter = []
        chapter.onChapterExit = []
        chapter.image = filesData[0].file_urls.original
        chapter.id = _.kebabCase(chapter.title)
        chapters.push(chapter)
    }

    let title = getMetadata(collData.element_texts, "Title")
    let subtitle = getMetadata(collData.element_texts, "Description")
    let byline = getMetadata(collData.element_texts, "Creator")
    let footer = getMetadata(collData.element_texts, "Rights")
    let style = getMetadata(collData.element_texts, "Format")
    let mapboxToken = getMetadata(collData.element_texts, "Rights")

    let config = {
        style: style,
        accessToken: mapboxToken,
        showMarkers: true,
        theme: 'light',
        alignment: 'left',
        title: title,
        subtitle: subtitle,
        byline: byline,
        footer: footer,
        chapters: chapters
    }

    return config
}

function buildMap(config) {
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
        console.log(record)
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
            console.log(image)
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
}