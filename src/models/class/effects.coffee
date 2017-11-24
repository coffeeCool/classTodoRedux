import dd from 'ddeyes'
import config from '../../services/config'
import services from '../../services'
import toolFuc from '../../utils/helper'

export default ({
  type
}) ->
  create: (
    {
      payload
    }
    { put }
  ) ->
    data = yield services.lc.create toolFuc
    ,
      payload.data
    if data isnt ( null and undefined )
      yield payload.callback.success data
      yield put 
        type: type.save
        payload: {
          data
        }
    else
      yield payload.callback.fail 'error'
    return

  fetch: (
    {
      payload
    }
    { put }
  ) ->
    data = yield services.lc.fetch toolFuc
    ,
      payload
    yield put 
      type: type.save
      payload: {
        data
      }
    return
  
  patch: (
    {
      payload
    }
    { put }
  ) ->
    data = yield services.lc.patch toolFuc
    ,
      payload
    yield put
      type: type.save
      payload: {
        data
      }
    return

  # remove: (
  #   {
  #     payload: id
  #   }
  #   { call, put }
  # ) ->
  #   yield call service.remove, id
  #   yield put 
  #     type: type.reload
  #     payload: {
  #       headers: config.header.master
  #       uri: "#{config.baseUri.lc_uri}/#{config.className.name}"
  #     }
  #   return

  

  # create: (
  #   {
  #     payload: values
  #   }
  #   { call, put }
  # ) ->
  #   data = yield call service.lc.create, values
  #   if data isnt ( null and undifined )
  #     yield values.callback.success data
  #     yield put 
  #       type: type.save
  #       payload: {
  #         data
  #       }
  #   else
  #     yield values.callback.fail 'error'
  #   return

  # reload: (
  #   {
  #     payload
  #   }
  #   { call, put }
  # ) ->
  #   data = yield call service.reload, payload
  #   yield put
  #     type: type.save
  #     payload: {
  #       data
  #     }
  #   return