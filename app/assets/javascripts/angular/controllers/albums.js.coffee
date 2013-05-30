@AlbumsCtrl = ($scope, AlbumList, Album, $routeParams) ->
  console.log("in the albums controller")

  $scope.albums = AlbumList

  $scope.addAlbum = ->
    album = Album.save({name: $scope.name, userId: $routeParams.userId})
    $scope.albums.push(album)
    $scope.name = ""

  $scope.albumIdSelected = $routeParams.albumId