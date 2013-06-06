app.factory "AlbumList", (Album, $routeParams) ->
  @album_list ||= Album.query({userId: $routeParams.userId})