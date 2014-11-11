gulp = require 'gulp'
coffee = require 'gulp-coffee'
concat = require 'gulp-concat'
uglify = require 'gulp-uglify'
srcmap = require 'gulp-sourcemaps'
less = require 'gulp-less'
rename = require 'gulp-rename'
browserify = require 'gulp-browserify'
serve = require 'gulp-serve'

paths =
    scripts: ['src/scripts/**/*.coffee']
    styles: ['src/styles/all.less']
    watchStyles: ['src/styles/**/*.less']


gulp.task 'scripts', ()->
    gulp.src("src/scripts/Main.coffee", {read: false})
        .pipe(browserify
            transform: ['coffeeify'],
            extensions: ['.coffee']
            debug: true
        )
        .pipe(rename('Main.js'))
        .pipe(gulp.dest('build/js'))


gulp.task 'styles', ()->
    gulp.src(paths.styles)
        .pipe(less())
        .pipe(gulp.dest('build/css'))


gulp.task 'watch', ()->
    gulp.watch paths.scripts, ['scripts']
    gulp.watch paths.watchStyles, ['styles']



gulp.task 'serve', serve(
    root: ['build']
    port: 8000
)
