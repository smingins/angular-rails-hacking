app.factory "Photo", ($resource) ->
  $resource("/users/:userId/albums/:albumId/photos/:id", {userId: "@userId", albumId: "@albumId", id: "@id"}, {update: {method: "PUT"}})