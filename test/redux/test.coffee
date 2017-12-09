import dd from 'ddeyes'
import 'shelljs/make'
import classRedux from '../../src/testServices/redux'

target.all = ->
  dd 'Hello classTodoRedux ！'

target.static = ->
  classRedux.staticFuc()

target.reducers = ->
  classRedux.reducersFuc()

target.sagas = ->
  data = await classRedux.createFuc()

  await classRedux.fetchFuc data

  data_patch = await classRedux.patchFuc data

  data_reload = await classRedux.reloadFuc()

  await classRedux.removeFuc data.objectId

  # ids = await classRedux.getIds(data_reload.results)
  # for id in ids
  #   await classRedux.removeFuc id