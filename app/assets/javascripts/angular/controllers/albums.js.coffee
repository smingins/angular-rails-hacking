@AlbumsCtrl = ($scope, AlbumList, Album, $routeParams, $route, $location) ->
  console.log("in the albums controller")

  $scope.albums = AlbumList.get()

  $scope.addAlbum = ->
    if $scope.name
      album = Album.save
        name: $scope.name, userId: $routeParams.userId
      , ->
        $scope.albums.push(album)
        $scope.name = ""

  $scope.deleteAlbum = (album) ->
    album.$delete
      userId: album.user_id, id: album.id
    , ->
      AlbumList.clearCache()
      $location.path("/users/" + $routeParams.userId + "/albums/")

  $scope.editAlbum = (album) ->
    album.previous_name = album.name
    album.editing = true

  $scope.cancelEditAlbum = (album) ->
    album.name = album.previous_name
    album.editing = false

  $scope.updateAlbum = (album) ->
    if album.name
      if album.name isnt album.previous_name
        album.$update
          userId: album.user_id, id: album.id
      album.editing = false

  $scope.albumIdSelected = $routeParams.albumId

  $scope.dataUrl = "/users/" + $routeParams.userId + "/albums/" + $routeParams.albumId + "/photos"

  $scope.uploadFinished = (e, data) ->
    $route.reload()

  $scope.updateProgress = (e, data) ->
    progress = parseInt(data.loaded / data.total * 100, 10)
    console.log(progress)