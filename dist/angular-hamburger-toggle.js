/*!
 * angular-hamburger-toggle - v0.2.0
 * https://github.com/dbtek/angular-hamburger-toggle
 * 2015-04-20
 * İsmail Demirbilek
 * MIT License
 */

(function() {
  'use strict';

  /**
    * @ngdoc overview
    * @name ngHamburger
    * @description
    * # ngHamburger
    * Main module of the application.
   */
  angular.module('ngHamburger', []);

}).call(this);

(function() {
  'use strict';

  /**
    * @ngdoc directive
    * @name ngHamburger.directive:hamburgerToggle
    * @param {object} state - State model with two way binding.
    * @description
    * Morphing hamburger toggle directive.
   */
  angular.module('ngHamburger').directive('hamburgerToggle', function() {
    return {
      restrict: 'E',
      replace: true,
      scope: {
        state: '='
      },
      templateUrl: 'views/hamburger-toggle.html',
      link: function($scope, $element, $attrs) {

        /**
          * @ngdoc object
          * @name toggleState
          * @methodOf ngHamburger.directive:hamburgerToggle
          * @description Toggles two way bound model.
         */
        $scope.toggleState = function() {
          return $scope.state = !$scope.state;
        };
      }
    };
  });

}).call(this);

angular.module('ngHamburger').run(['$templateCache', function($templateCache) {
  'use strict';

  $templateCache.put('views/hamburger-toggle.html',
    "<div class=\"material-design-hamburger\"><button class=\"material-design-hamburger__icon\" ng-click=\"toggleState()\"><span class=\"material-design-hamburger__layer\" ng-class=\"'material-design-hamburger__icon--' + (state ? 'to' : 'from') + '-arrow'\"></span></button></div>"
  );

}]);
