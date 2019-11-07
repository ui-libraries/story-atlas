import chai from 'chai'
import { expect } from 'chai'
import { endpoint } from '../src/config'
import * as F from '../src/index'
import * as Collection from '../src/collection'
import * as File from '../src/file'
import * as Item from '../src/item'
import { mockEmptyCollections, mockCollections, mockItems, mockEmptyItems } from './mock-data'
chai.use(require('chai-url'))

describe('Endpoint', () => {
    it('tests endpoint exists', () => {
        expect(endpoint).to.exist
    })
    it('tests endpoint for http', () => {
        chai.expect(endpoint).to.have.protocol('http')
    })
    it('tests endpoint for api path', () => {
        chai.expect(endpoint).to.contain.path('/api')
    })
})

describe('Site', () => {
    it('gets site information', () => {
        return F.getSiteInfo(endpoint).then((data) => {                
            expect(data).to.have.all.keys('omeka_url', 'author', 'copyright', 'description', 'omeka_version', 'title')
        })       
    })
})

describe('Collection', () => {
    it('gets site collections', () => {
        return Collection.getCollections(endpoint).then((data) => {
            expect(data).to.be.an('array')
        })
    })
    it('determined if there are items or not', () => {
        expect(Collection.hasCollections(mockEmptyCollections)).to.be.false
        expect(Collection.hasCollections(mockCollections)).to.be.true
        expect(mockCollections).to.be.an('array')
    })
    it('gets metadata for a collection', () => {
        return Collection.getCollectionMetadataById(endpoint, 7).then((data) => {
            expect(data).to.be.an('object')
        })
    })  
    it('gets items for collection', () => {
        return Collection.getItemsInCollection(endpoint, 7).then((data) => {
            expect(data).to.be.an('array')
        }) 
    })
})

describe('Item', () => {
    it('gets site items metadata', () => {
        return Item.getItems(endpoint).then((data) => {
            expect(data).to.be.an('array')
        })
    })
    it('determined if there are items or not', () => {
        expect(Item.hasItems(mockEmptyItems)).to.be.false
        expect(Item.hasItems(mockItems)).to.be.true
        expect(mockItems).to.be.an('array')
    })
    it('gets item metadata', () => {
        return Item.getItemMetadata(endpoint, 8).then((data) => {
            expect(data).to.be.an('object')
        })
    })
    it('gets item file metadata', () => {
        return Item.getFilesInItem(endpoint, 8).then((data) => {
            expect(data).to.be.an('array')
        })
    })
})

describe('File', () => {
    
})

