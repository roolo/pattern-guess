# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

app = angular.module('pattern-guess', [])
  .controller 'PatternFieldController', ($scope, $http) ->
    patternIdElement = angular.element '#pattern-id'

    if patternIdElement.val() > 0
      $http.get('/patterns/'+patternIdElement.val()+'.json')
        .success (data, status) ->
          $scope.content = data.content

    # Choose CSS class
    $scope.cellClassState = (cell) ->
      if cell == 1
        'active'
      else
        'inactive'

    $scope.toggleCell = (row, index) ->
      if $scope.content[row][index] == 1
        $scope.content[row][index] = 0
      else
        $scope.content[row][index] = 1

    $scope.$watch 'content',
      (newValue, oldValue, scope) ->
        $http.put(
          '/patterns/'+patternIdElement.val()+'.json',
          pattern: {
            content: newValue
          }
        )
          .success (data, status) ->
            console.log status
      ,
      true
  .controller 'PatternGuessController', ($scope, $http) ->
    patternIdElement = angular.element '#pattern-id'

    if patternIdElement.val() > 0
      $http.get('/patterns/'+patternIdElement.val()+'.json')
        .success (data, status) ->
          $scope.content = data.content
          $scope.guessState = data.guess_state

    # Choose CSS class
    $scope.cellClassState = (cell) ->
      if cell == 1
        'active'
      else
        'inactive'

    $scope.toggleCell = (row, index) ->
      if $scope.guessState[row][index] == 1
        $scope.guessState[row][index] = 0
      else
        $scope.guessState[row][index] = 1

    $scope.$watch 'guessState',
      (newValue, oldValue, scope) ->
        if $scope.editorInitialized
          $http.put(
            '/patterns/'+patternIdElement.val()+'.json',
            {pattern: { guess_state: newValue }}
          )
            .success (data, status) ->
              if angular.equals($scope.content, $scope.guessState)
                console.log 'WELL DONE!'
      ,
      true
