'use strict'

###*
 # @ngdoc directive
 # @name ngHamburger.directive:hamburgerToggle
 # @param {object} state - State model with two way binding.
 # @description
 # Morphing hamburger toggle directive.
###
angular.module 'ngHamburger'
  .directive 'hamburgerToggle', ->
    restrict: 'E'
    replace: true
    scope:
      state: '='
    templateUrl: 'views/hamburger-toggle.html'
    link: ($scope, $element, $attrs) ->
      # sets iconClass on scope
      setClass = ->
        if $scope.state
          $scope.iconClass = 'material-design-hamburger__icon--to-arrow'
        else
          $scope.iconClass = 'material-design-hamburger__icon--from-arrow'
        return

      $scope.toggleState = ->
        $scope.state = !$scope.state
        do setClass

      # set initial class
      do setClass