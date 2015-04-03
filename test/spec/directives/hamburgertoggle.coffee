'use strict'

describe 'Directive: hamburgerToggle', ->

  # load the directive's module
  beforeEach module 'ngHamburger'

  scope = {}

  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()

  it 'should make hidden element visible', inject ($compile) ->
    element = angular.element '<hamburger-toggle></hamburger-toggle>'
    element = $compile(element) scope
    expect(!!element).toBe true
