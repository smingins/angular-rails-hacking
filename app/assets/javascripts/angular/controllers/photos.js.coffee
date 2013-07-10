@PhotosCtrl = ["$scope", "Album", "Photo", "$routeParams", "$route", ($scope, Album, Photo, $routeParams, $route) ->
  console.log("in the photos controller")

  $scope.album  = Album.get({userId: $routeParams.userId, id: $routeParams.albumId})
  $scope.photos = []
  page = 1

  $scope.updatePhoto = (photo) ->
    if photo.title
      if photo.title isnt photo.previous_title
        photo.$update
          userId: $routeParams.userId, albumId: $routeParams.albumId, id: photo.id

  $scope.deletePhoto = (photo) ->
    photo.$delete
      userId: $routeParams.userId, albumId: $routeParams.albumId, id: photo.id
    , ->
      $route.reload()

  $scope.editModeOff = ->
    @updatePhoto(photo) for photo in $scope.photos
    $scope.editMode = false

  $scope.nextPage = ->
    return  if $scope.noscroll
    $scope.noscroll = true

    photos = Photo.query(
      {userId: $routeParams.userId, albumId: $routeParams.albumId, page: page}
    , ->
      $scope.photos = $scope.photos.concat(photos)
      page++
      $scope.noscroll = false unless photos.length == 0
    )
]
