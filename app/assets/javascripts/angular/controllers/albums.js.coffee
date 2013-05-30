@AlbumsCtrl = ($scope, Album, $routeParams) ->
  console.log("in the albums controller")

  $scope.albums = Album.query({userId: $routeParams.userId})

  $scope.addAlbum = ->
    album = Album.save({name: $scope.name, userId: $routeParams.userId})
    $scope.albums.push(album)
    $scope.name = ""
