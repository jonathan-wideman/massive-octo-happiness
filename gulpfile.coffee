gulp = require 'gulp'
coffee = require 'gulp-coffee'
concat = require 'gulp-concat'
uglify = require 'gulp-uglify'
srcmap = require 'gulp-sourcemaps'
less = require 'gulp-less'
rename = require 'gulp-rename'
browserify = require 'gulp-browserify'

paths =
    scripts: ['scripts/**/*.coffee']
    styles: ['styles/all.less']
    watchStyles: ['styles/**/*.less']


gulp.task 'scripts', ()->
    gulp.src("scripts/Main.coffee", {read: false})
        .pipe(browserify
            transform: ['coffeeify'],
            extensions: ['.coffee']
            debug: true
        )
        .pipe(rename('Main.js'))
        .pipe(gulp.dest('public/js'))


gulp.task 'styles', ()->
    gulp.src(paths.styles)
        .pipe(less())
        .pipe(gulp.dest('public/css'))


gulp.task 'watch', ()->
    gulp.watch paths.scripts, ['scripts']
    gulp.watch paths.watchStyles, ['styles']



gulp.task 'default', ()->
    console.log "hallo"
