app.directive "fileupload", ->
  restrict: "A"
  scope:
    start: "&"
    done: "&"
    progress: "&"
    url: "=url"
    disabled: "=disableButton"

  link: (scope, element, attrs) ->
    attrs.$set('data-url', scope.url);
    attrs.$set('disabled', scope.disabled);

    optionsObj = dataType: "json"
    if scope.done
      optionsObj.stop = (e) ->
        $.unblockUI()
        scope.$apply ->
          scope.done
            e: e

    if scope.start
      optionsObj.start = (e) ->
        $.blockUI()
        scope.$apply ->
          scope.start
            e: e

    if scope.progress
      optionsObj.progressall = (e, data) ->
        scope.$apply ->
          scope.progress
            e: e
            data: data


    
    # the above could easily be done in a loop, to cover
    # all APIs that Fileupload provides
    element.fileupload optionsObj