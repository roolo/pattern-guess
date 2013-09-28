# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

app = angular.module('pattern-guess', [])
  .controller 'PatternFieldController', ($scope) ->
    $scope.content = [
      [0,0,0,0,0,0,1,0,0],
      [0,0,0,0,0,0,0,0,0],
      [0,0,0,0,0,0,0,0,0],
      [0,0,0,0,0,0,0,0,0],
      [0,0,0,0,0,0,1,0,0],
      [0,0,0,0,0,0,0,0,0],
      [0,0,0,0,0,0,0,0,0],
      [0,0,0,0,0,0,0,0,0],
    ]

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
        console.log 'Persist change from '+oldValue+' to '+newValue
      ,
      true
