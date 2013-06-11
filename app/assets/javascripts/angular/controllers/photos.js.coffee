@PhotosCtrl = ($scope, Album, Photo, $routeParams, $route) ->
  console.log("in the photos controller")
  $scope.album  = Album.get({userId: $routeParams.userId, id: $routeParams.albumId})
  $scope.photos = Photo.query({userId: $routeParams.userId, albumId: $routeParams.albumId})

  $scope.editPhoto = (photo) ->
    photo.previous_title = photo.title
    photo.editing = true

  $scope.cancelEditPhoto = (photo) ->
    photo.title = photo.previous_title
    photo.editing = false

  $scope.updatePhoto = (photo) ->
    if photo.title
      if photo.title isnt photo.previous_title
        photo.$update
          userId: $routeParams.userId, albumId: $routeParams.albumId, id: photo.id
      photo.editing = false

  $scope.deletePhoto = (photo) ->
    photo.$delete
      userId: $routeParams.userId, albumId: $routeParams.albumId, id: photo.id
    , ->
      # AlbumList.clearCache()
      $route.reload()


