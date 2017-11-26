import dd from 'ddeyes'
import 'shelljs/make'
import redux_test from '../../src/testServices/redux'

target.all = ->
  dd 'Hello classTodoRedux ！'

target.static = ->
  redux_test.staticFuc()

target.reducers = ->
  redux_test.reducersFuc()

target.sagas = ->
  data = await redux_test.createFuc()
  data

  await redux_test.sellp 1000
  await redux_test.fetchFuc data

  await redux_test.sellp 1000
  data_patch = await redux_test.patchFuc data
  data_patch

  await redux_test.sellp 1000
  await redux_test.reloadFuc()

  await redux_test.sellp 1000
  await redux_test.removeFuc data_patch

  await redux_test.sellp 1000
  await redux_test.reloadFuc()