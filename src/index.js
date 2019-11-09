import Fetch from 'node-fetch'
import * as _ from 'lodash'
import {
    endpoint
} from '../src/config'
import * as Collection from '../src/collection'
import * as Item from '../src/item'
import {
    build
} from '../src/story'

const collectionId = 1

getInfo(endpoint, collectionId).then(config => {
    build(config)
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

    for (let i = 0; i < itemsData.length; i++) {
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
    let footer = `Copyright ©${getMetadata(collData.element_texts, "Date Copyrighted")}, ${getMetadata(collData.element_texts, "Creator")}`
    let style = getMetadata(collData.element_texts, "Format")
    let mapboxToken = getMetadata(collData.element_texts, "Access Rights")

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