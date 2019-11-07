/**
 * Collection functions
 * @module Collection
 */

import Fetch from 'node-fetch'
import { endpoint } from '../src/config'

/**
 * Gets a list of site collections
 *
 * @param {string} endpoint - An Omeka API URL
 * @memberof Collection
 * @return {promise} - Returns an array of collections belonging to individual sites
 */
export async function getCollections(endpoint) {
    let url = endpoint + 'collections'
    try {
      const response = await Fetch(url)
      const json = await response.json()
      return json
    } catch (error) {
      console.log(error)
    }
  }

/**
 * Checks if a collection array is empty
 *
 * @param {array} collectionList - An array of collection objects
 * @memberof Collection
 * @return {boolean} - Returns false if the array is empty, true if it has an collection objects
 */
export function hasCollections(collectionList) {
    if (collectionList.length == 0) {
      return false
    } else {
      return true
    }
  }

/**
 * Gets the collection's metadata
 *
 * @param {string} endpoint - An omeka API URL
 * @param {number} id - A collection id
 * @memberof Collection
 * @return {promise} - Returns collection metadata
 */
export async function getCollectionMetadataById(endpoint, id) {
    if (typeof id == 'number') {  
      let url = endpoint + 'collections/' + id
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
 * Gets items from the collection
 *
 * @param {string} endpoint - An omeka API URL
 * @param {number} id - A collection id
 * @memberof Collection
 * @return {promise} - An array of item objects
 */
export async function getItemsInCollection(endpoint, id) {
    let collection = getCollectionMetadataById(endpoint, id)
    let data = await Promise.resolve(collection)
    let path = data.items.url
    let response = await Fetch(path)
    let json = await response.json()
    let items = await Promise.resolve(json)
    return items
  }

