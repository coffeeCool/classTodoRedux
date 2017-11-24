import dd from 'ddeyes'
import { store } from '../../dist/bundle'
import config from '../config'

{
  actions
  reducers
  sagas
  getStore
} = store

myStore = getStore {
  appName: 'classTodoApp'
  reducers
  sagas
}

sellp = (time) ->
  return new Promise (resolve, ms)->
    setTimeout ->
      resolve()
    , time

# create class  
createFuc = (resolve, reject)->
  myStore.dispatch actions.classCreate 
    data:
      company: '湖北和风和乐有限公司'
      main: '旅游、租房'
      location: '武汉'
    callback:
      success: (data) ->
        resolve data
      fail: (data) ->
        reject data

  await sellp 1000
  dd myStore.getState()

# fetch class
fetchFuc = (data) ->
  myStore.dispatch actions.classFetch
    objectId: data.objectId
  await sellp 1000
  dd myStore.getState()

# patch class
patchFuc = (data) ->
  myStore.dispatch actions.classPatch
    objectId: data.objectId
    company: '阿里巴巴有限公司'
    main: '租房大佬'
    location: '武汉'
  await sellp 1000
  dd myStore.getState()

# # reload class
# reload = ->
#   myStore.dispatch actions.classReload
#     headers: config.master_headers
#     uri: "#{config.uri}/#{config.className}"
#   await sellp 1000
#   dd myStore.getState()

# # remove class
# remove = (objectId) ->
#   myStore.dispatch actions.classRemove
#     headers: config.headers
#     uri: "#{config.uri}/#{config.className}/#{objectId}"
#   await sellp 1000
#   dd myStore.getState()

getIds = (data) ->
  data.reduce (r, c) ->
    [
      r...
      c.objectId
    ]
  , []

export {
  createFuc
  fetchFuc
  patchFuc
  # reload
  # remove
  getIds
}