/**
 * Entrypoint for the HMS Library
 * @module Index
 */

import Fetch from 'node-fetch'
import { endpoint } from '../src/config'
import * as Collection from '../src/collection'
import * as File from '../src/file'
import * as Item from '../src/item'

/**
 * Gets site information for a specified Omeka API endpoint
 *
 * @param {string} endpoint - An Omeka API URL
 * @memberof Index
 * @return {promise} - Returns a valid JSON representaton of the site information
 */
export async function getSiteInfo() {
    let url = endpoint + 'site'
    try {
        const response = await Fetch(url)
        const json = await response.json()
        return json
      } catch (error) {
        console.log(error)
      }
}

getSiteInfo().then(data => {
  console.log(data)
})

Collection.getCollections(endpoint).then(data => {
  //console.log(data)
})

Collection.getItemsInCollection(endpoint, 1).then(data => {
  console.log(data)
})
