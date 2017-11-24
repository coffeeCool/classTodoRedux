import dd from 'ddeyes'
import 'shelljs/make'
import { store } from '../../dist/bundle'
import {
  createFuc
  fetchFuc
  patchFuc
  # reload
  # remove
  getIds
} from './tasks'

{
  constants
  actions
  reducers
  sagas
  getStore
} = store

target.all = ->

  dd 'Hello classTodoRedux ！'

  target.static()
  target.reducers()
  target.sagas()

target.static = ->

  dd {
    constants
    actions
  }

target.reducers = ->

  myStore = getStore {
    appName: 'classTodoApp'
    reducers
    subscriber:
      sync: ->
        dd myStore.getState()
  }

  myStore.dispatch actions.classSave
    data: [
     company: '武汉和风和乐有限公司'
      main: '旅游、租房'
      location: '武汉'
    ]

  myStore.onsubscribe()

target.sagas = ->
  # createFuc()

  promiseFuc = ->
    new Promise (resolve, reject) ->
      createFuc(resolve, reject)
    .then (data) ->
      # dd data
      fetchFuc data
      patchFuc data
      # reload()
      # remove data.objectId
  promiseFuc()
  
  