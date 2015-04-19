Angular Hamburger Toggle
------------------------

Angular directive of Material Design morphing hamburger menu toggle. It's based off of [Material Design Hamburger](https://github.com/swirlycheetah/material-design-hamburger).

![toggle-gif](https://i.imgur.com/B0PT1Lb.gif)

###Features
* Two way bound state model.
* Tuned for Bootstrap.
* Super easy.

###[Demo](http://dbtek.github.io/angular-hamburger-toggle)

##Install
```bash
 $ bower install angular-hamburger-toggle --save
```

##Usage

* Add dependency  
```js
  angular.module('myApp', ['ngHamburger']);
```
* Use directive  
```html
  <hamburger-toggle state="stateModel"></hamburger-toggle>
```

`state` attribute is for two way bound model that will be toggled. Initially can be `true`, `false` or `undefined`.

##Credits
[Material Design Hamburger](https://github.com/swirlycheetah/material-design-hamburger)

##Author
İsmail Demirbilek - [@dbtek](https://twitter.com/dbtek)
