import dd from 'ddeyes'
import config from '../../services/config'
import service from '../../services'

export default ({
  type 
  service
}) ->

  fetch: (
    {
      payload
    }
    { call, put }
  ) ->
    data = yield call service.lc.fetch, payload
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

  # patch: (
  #   {
  #     payload: values
  #   }
  #   { call, put }
  # ) ->
  #   data = yield call service.patch, values
  #   yield put
  #     type: type.save
  #     payload: {
  #       data
  #     }
  #   return

  # create: (
  #   {
  #     payload: values
  #   }
  #   { call, put }
  # ) ->
  #   data = yield call service.create, values
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