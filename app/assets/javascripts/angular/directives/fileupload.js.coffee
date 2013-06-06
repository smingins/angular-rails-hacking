app.directive "fileupload", ->
  restrict: "A"
  scope:
    done: "&"
    progress: "&"
    url: "=url"
    disabled: "=disableButton"

  link: (scope, element, attrs) ->
    attrs.$set('data-url', scope.url);
    attrs.$set('disabled', scope.disabled);

    optionsObj = dataType: "json"
    if scope.done
      optionsObj.done = ->
        scope.$apply ->
          scope.done
            e: element
            data: attrs


    if scope.progress
      optionsObj.progress = (e, data) ->
        scope.$apply ->
          scope.progress
            e: e
            data: data


    
    # the above could easily be done in a loop, to cover
    # all APIs that Fileupload provides
    element.fileupload optionsObj