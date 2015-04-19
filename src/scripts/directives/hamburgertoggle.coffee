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

      ###*
       # @ngdoc object
       # @name toggleState
       # @methodOf ngHamburger.directive:hamburgerToggle
       # @description Toggles two way bound model.
      ###
      $scope.toggleState = ->
        $scope.state = !$scope.state

      return