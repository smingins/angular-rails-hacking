@AlbumsCtrl = ($scope, AlbumList, Album, $routeParams, $route) ->
  console.log("in the albums controller")

  $scope.albums = AlbumList

  $scope.addAlbum = ->
    if $scope.name
      album = Album.save({name: $scope.name, userId: $routeParams.userId})
      $scope.albums.push(album)
      $scope.name = ""

  $scope.albumIdSelected = $routeParams.albumId


  $scope.markers = [1,2,3,4]

  $scope.dataUrl = "/users/" + $routeParams.userId + "/albums/" + $routeParams.albumId + "/photos"

  $scope.uploadFinished = (e, data) ->
    $route.reload()