/**
 * Exhibit functions
 * @module Exhibit
 */
import Fetch from 'node-fetch'
import {
    endpoint
} from '../endpoint'

/**
 * Gets a list of site exhibits
 *
 * @param {string} endpoint - An Omeka API URL
 * @memberof Exhibit
 * @return {promise} - Returns an array of exhibits belonging to individual sites
 */
export async function getExhibits(endpoint) {
    let url = endpoint + 'exhibits'
    try {
        const response = await Fetch(url)
        const json = await response.json()
        return json
    } catch (error) {
        console.log(error)
    }
}

/**
 * Gets the exhibits's metadata
 *
 * @param {string} endpoint - An omeka API URL
 * @param {number} id - An exhibit id
 * @memberof Exhibit
 * @return {promise} - Returns exhibit metadata
 */
export async function getExhibitMetadataById(endpoint, id) {
    if (typeof id == 'number') {  
      let url = endpoint + 'exhibits/' + id
      try {
        const response = await Fetch(url)
        const json = await response.json()
        return json
      } catch(error) {
        console.log(error)
      }
    } else {
      throw "The value provided must be a an id."
    }
}

/**
 * Gets pages from the exhibit
 *
 * @param {string} endpoint - An omeka API URL
 * @param {number} id - An exhibit id
 * @memberof Exhibit
 * @return {promise} - An array of pages objects
 */
export async function getPagesInExhibit(endpoint, id) {
    let exhibit = getExhibitMetadataById(endpoint, id)
    let data = await Promise.resolve(exhibit)
    let path = data.pages.url
    let response = await Fetch(path)
    let json = await response.json()
    let pages = await Promise.resolve(json)
    return pages
}