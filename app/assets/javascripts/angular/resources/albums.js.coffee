app.factory "Album", ($resource) ->
  $resource("/users/:userId/albums/:id", {userId: "@userId", id: "@id"}, {update: {method: "PUT"}})
