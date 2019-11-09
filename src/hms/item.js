/**
 * Item functions
 * @module Item
 */

import Fetch from 'node-fetch'
import { endpoint } from '../endpoint'

/**
 * Gets a list of ALL site items
 *
 * @param {string} endpoint - An Omeka API URL
 * @memberof Item
 * @return {promise} - Returns a list of item objects
 */
export async function getItems(endpoint) {
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
 * Gets a list of collection items
 *
 * @param {string} collectionEndpoint - An Omeka API URL
 * @memberof Item
 * @return {promise} - Returns a list of item objects
 */
export async function getItemsInCollection(collectionEndpoint) {
  let url = collectionEndpoint
  try {
    const response = await Fetch(url)
    const json = await response.json()
    return json
  } catch (error) {
    console.log(error)
  }
}

/**
 * Checks if the list has items
 *
 * @param {array} itemList - An array of item objects
 * @memberof Item
 * @return {boolean} - Returns false if the array is empty, true if it has an item object(s)
 */
export function hasItems(itemList) {
    if (itemList.length == 0) {
      return false
    } else {
      return true
    }
  }

/**
 * Gets item metadata
 *
 * @param {string} endpoint - An omeka API URL
 * @param {number} id - An item id
 * @memberof Item
 * @return {promise} - An object of item metadata
 */
export async function getItemMetadata(endpoint, id) {
    if (typeof id == 'number') {  
      let url = endpoint + 'items/' + id
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
 * Gets the file metadata for an item
 *
 * @param {string} endpoint - An omeka API URL
 * @param {number} id - A item id
 * @memberof Item
 * @return {promise} - An array of file metadata objects
 */
export async function getFilesInItem(endpoint, id) {
    let item = getItemMetadata(endpoint, id)
    let data = await Promise.resolve(item)
    let path = data.files.url
    let response = await Fetch(path)
    let json = await response.json()
    let files = await Promise.resolve(json)
    return files
  }