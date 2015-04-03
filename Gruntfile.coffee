'use strict'

module.exports = (grunt) ->
  loadGruntTasks = require 'load-grunt-tasks'
  timeGrunt = require 'time-grunt'

  loadGruntTasks grunt
  timeGrunt grunt

  # Run grunt config
  grunt.initConfig
    pkg: grunt.file.readJSON 'bower.json'
    appConfig:
      app: 'src'
      module: 'ngHamburger'
      test: 'app/test'
      name: 'Angular Hamburger Toggle'
      dist: 'dist'

    banner: '/*!\n' +
            ' * <%= pkg.name %> - v<%= pkg.version %>\n' +
            ' * <%= pkg.homepage %>\n' +
            ' * <%= grunt.template.today("yyyy-mm-dd") %>\n' +
            ' * İsmail Demirbilek\n' +
            ' * MIT License\n' +
            ' */\n'

    copy:
      app:
        expand: true
        cwd: '<%= appConfig.app %>'
        src: ['scripts/{,*/}*.js', 'styles/{,*/}*.css']
        dest: '.tmp'
      dist:
        files: [
          {
            expand: true
            dot: true
            cwd: "<%= appConfig.app %>"
            dest: "<%= appConfig.dist %>"
            src: [
              "*.{ico,png,txt}"
              ".htaccess"
              "fonts/{,*/}*.*"
            ]
          }
        ]

    coffee:
      app:
        expand: true
        cwd: '<%= appConfig.app %>'
        src: ['scripts/{,*/}*.coffee']
        dest: '.tmp'
        ext: '.js'

    ngtemplates:
      app:
        cwd: '<%= appConfig.app %>'
        src: 'views/{,*/}{,*/}*.html'
        dest: '.tmp/scripts/templates.js'
        options:
          module: '<%= appConfig.module %>'
          htmlmin:
            collapseWhitespace: true
            collapseBooleanAttributes: true

    wiredep:
      test:
        src: ['<%= karma.unit.configFile %>']
        options:
          fileTypes:
            js:
              block: /(([\s\t]*)\/\/\s*bower:*(\S*))(\n|\r|.)*?(\/\/\s*endbower)/gi
              detect:
                js: /'(.*\.js)'/gi
              replace:
                js: '\'{{filePath}}\','
          ignorePath: '../../'
          devDependencies: true
          exclude: ['jQuery', 'egemswatch']

    concat:
      js:
        options:
          banner: '<%= banner %>\n'
        files:
          '<%= appConfig.dist %>/<%= pkg.name %>.js': ['.tmp/scripts/{,*/}{,*/}*.js']
      css:
        options:
          banner: '<%= banner %>\n'
        files:
          '<%= appConfig.dist %>/<%= pkg.name %>.css': ['.tmp/styles/{,*/}{,*/}*.css']

    cssmin:
      dist:
        files:
          '<%= appConfig.dist %>/<%= pkg.name %>.min.css': [
            '<%= appConfig.dist %>/<%= pkg.name %>.css'
          ]

    connect:
      test:
        options:
          port: 9001
          base: [
            '.tmp'
            'test'
            '<%= appConfig.app %>'
          ]

    clean:
      dist:
        dot: true
        src: [
          '.tmp'
          '<%= appConfig.dist %>/<%= pkg.name %>.{js,css}'
          '!<%= appConfig.dist %>/.git*'
        ]
      server: '.tmp'
      bower: 'static/bower_components'

    autoprefixer:
      options:
        browsers: ['last 1 version']
      server:
        options:
          map: true
        files: [{
          expand: true
          cwd: '.tmp/styles/'
          src: '{,*/}*.css'
          dest: '.tmp/styles/'
        }]
      dist:
        files: [{
          expand: true
          cwd: '.tmp/styles/'
          src: '{,*/}*.css'
          dest: '.tmp/styles/'
        }]

    jshint:
      options:
        jshintrc: '.jshintrc'
      all: [
        'teest/spec/karma.conf.coffee'
        '<%= appConfig.app %>/{,*/}{,*/}{,*/}*.js'
      ]

    coffeelint:
      app: ['<%= appConfig.app %>/{,*/}**.coffee']
      options:
        'max_line_length':
          level: 'warn'

    karma:
      unit:
        configFile: 'test/karma.conf.coffee'
        singleRun: true

    ngAnnotate:
      dist:
        files: [
          expand: true,
          cwd: '.tmp/scripts'
          src: '{,*/}{,*/}*.js'
          dest: '.tmp/scripts'
        ]

    uglify:
      dist:
        options:
          enclose: true
          banner: '<%= banner %>'
        files:
          '<%= appConfig.dist %>/<%= pkg.name %>.min.js': ['<%= appConfig.dist %>/<%= pkg.name %>.js']

    ngdocs:
      options:
        dest: 'docs'
        html5Mode: false
        title: '<%= appConfig.name %> Documentation'
      all: ['.tmp/scripts/{,*/}{,*/}*.js']

  grunt.registerTask 'test', [
    'clean:server',
    'connect:test',
    'karma'
  ]

  grunt.registerTask 'build', [
    'clean:dist'
    'coffee'
    'copy'
    'ngtemplates'
    'autoprefixer'
    'concat:css'
    'ngtemplates'
    'ngAnnotate'
    'concat:js'
    'uglify'
    'cssmin'
  ]

  grunt.registerTask 'default', [
    'jshint'
    'coffeelint'
    'wiredep'
    'test'
    'build'
    'ngdocs'
    'clean:server'
  ]
