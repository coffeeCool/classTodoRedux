import dd from 'ddeyes'
import * as store from '../store'

{
  constants
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

# static 
staticFuc = ->
  dd {
    constants
    actions
  }

# reducers 
reducersFuc = ->
  myStore = getStore {
    appName: 'classTodoApp'
    reducers
    subscriber:
      sync: ->
        dd myStore.getState()
  }
  myStore.dispatch actions.classSave
    data: [
      company: '武汉举手帮租有限公司'
      main: '旅游、租房'
      location: '武汉'
    ]
  myStore.onsubscribe()

# sellp function
sellp = (time) ->
  return new Promise (resolve, ms)->
    setTimeout ->
      resolve()
    , time

# create class  
createFuc = ->
  new Promise (resolve, reject) ->
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
  new Promise (resolve, reject) ->
    myStore.dispatch actions.classFetch
      data:
        objectId: data.objectId
      callback:
        success: (data) ->
          resolve data
        fail: (data) ->
          reject data

    await sellp 1000
    dd myStore.getState()

# patch class
patchFuc = (data) ->
  new Promise (resolve, reject) ->
    myStore.dispatch actions.classPatch
      data:
        objectId: data.objectId
        company: '阿里巴巴有限公司'
        main: '租房大佬'
        location: '武汉'
      callback:
        success: (data) ->
          resolve data
        fail: (data) ->
          reject data

    await sellp 1000
    dd myStore.getState()

# reload class
reloadFuc = ->
  new Promise (resolve, reject) ->
    myStore.dispatch actions.classReload
      data: ''
      callback:
        success: (data) ->
          resolve data
        fail: (data) ->
          reject data
    
    await sellp 1000
    dd myStore.getState()

# remove class
removeFuc = (data) ->
  myStore.dispatch actions.classRemove
    objectId: data

  await sellp 1000
  dd myStore.getState()

# get ids
getIds = (data) ->
  data.reduce (r, c) ->
    [
      r...
      c.objectId
    ]
  , []

export default redux_test = {
  createFuc
  fetchFuc
  patchFuc
  reloadFuc
  removeFuc
  getIds
  sellp
  reducersFuc
  staticFuc
}