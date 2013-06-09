app.factory "AlbumList", (Album, $routeParams) ->
  albumList = {}

  albumList.get = ->
    @albumList ||= Album.query({userId: $routeParams.userId})

  albumList.clearCache =->
    @albumList = undefined

  albumList