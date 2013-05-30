@PhotosCtrl = ($scope, Album, Photo, $routeParams) ->
  console.log("in the photos controller")
  $scope.album  = Album.get({userId: $routeParams.userId, id: $routeParams.albumId})
  $scope.photos = Photo.query({userId: $routeParams.userId, albumId: $routeParams.albumId})
