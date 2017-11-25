import dd from 'ddeyes'
import 'shelljs/make'
import {
  createFuc
  fetchFuc
  patchFuc
  reloadFuc
  removeFuc
  getIds
  sellp
  reducersFuc
  staticFuc
} from '../../src/testServices/redux'

target.all = ->
  dd 'Hello classTodoRedux ！'

target.static = ->
  staticFuc()

target.reducers = ->
  reducersFuc()

target.sagas = ->
  promiseFuc = ->
    new Promise (resolve, reject) ->
      createFuc(resolve, reject)
    .then (data) ->
      await sellp 1000
      fetchFuc data

      await sellp 1000
      patchFuc data

      await sellp 1000
      reloadFuc()

      await sellp 1000
      removeFuc data
      
  promiseFuc()