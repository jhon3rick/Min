"use strict"

gulp       = require 'gulp'
concat     = require 'gulp-concat'
gutil      = require 'gulp-util'
uglify     = require 'gulp-uglify'
jshint     = require 'gulp-jshint'
notify     = require 'gulp-notify'
minifyCss  = require 'gulp-minify-css'
minifyHtml = require 'gulp-minify-html'
pkg        = require './package.json'

path =
	sourceJs   : './source/*.js'
	sourceCss  : './source/*.css'
	sourceHtml : './source/*.html'
	dist       : './dist'
	build      : './build'
	jshint     : ['./source/*.js']


# JAVASCRIPT
gulp.task 'buildJs', ->
	gulp.src path.sourceJs
		.pipe uglify()
		.pipe gulp.dest path.build
		.pipe notify({ message: 'Build Js task complete' })

gulp.task 'distJs', ->
	gulp.src path.sourceJs
		.pipe concat('script.min.js')
		.pipe uglify()
		.pipe gulp.dest path.dist
		.pipe notify({ message: 'Dist Js complete' })

# CSS
gulp.task 'buildCss', ->
	gulp.src path.sourceCss
		.pipe minifyCss()
		.pipe gulp.dest path.build
		.pipe notify({ message: 'Css - tarea completada' })

gulp.task 'distCss', ->
	gulp.src path.sourceCss
		.pipe concat('styles.min.css')
		.pipe minifyCss()
		.pipe gulp.dest path.dist
		.pipe notify({ message: 'Css - tarea completada' })

# HTML
gulp.task 'buildHtml', ->
	gulp.src path.sourceHtml
		.pipe minifyHtml()
		.pipe gulp.dest path.dist
		.pipe gulp.dest path.build
		.pipe notify({ message: 'HTML - tarea completada' })

# TAREAS EJECUTADAS
gulp.task "validateJs", ->
	gulp.src path.jshint
		.pipe jshint()
		.pipe jshint.reporter('default')
		.pipe notify({ message: 'JSHints task complete' })

gulp.task 'default', ['buildJs','distJs','buildCss','distCss','buildHtml']
