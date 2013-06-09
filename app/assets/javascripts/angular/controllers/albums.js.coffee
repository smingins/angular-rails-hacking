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

  $scope.albumIdSelected = $routeParams.albumId

  $scope.dataUrl = "/users/" + $routeParams.userId + "/albums/" + $routeParams.albumId + "/photos"

  $scope.uploadFinished = (e, data) ->
    $route.reload()

  $scope.updateProgress = (e, data) ->
    progress = parseInt(data.loaded / data.total * 100, 10)
    console.log(progress)