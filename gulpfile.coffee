gulp = require 'gulp'
coffee = require 'gulp-coffee'
concat = require 'gulp-concat'
uglify = require 'gulp-uglify'
srcmap = require 'gulp-sourcemaps'
less = require 'gulp-less'
rename = require 'gulp-rename'
browserify = require 'gulp-browserify'
serve = require 'gulp-serve'
zip = require 'gulp-zip'

paths =
    scripts: ['src/scripts/**/*.coffee']
    styles: ['src/styles/all.less']
    watchStyles: ['src/styles/**/*.less']

package_data = require('./package.json')


buildScripts = ()->
    gulp.src("src/scripts/Main.coffee", {read: false})
        .pipe(browserify
            transform: ['coffeeify'],
            extensions: ['.coffee']
            debug: true
        )
        .on('error', (err)-> console.log err.message)
        .pipe(rename('Main.js'))
        .pipe(gulp.dest('build/js'))

buildStyles = ()->
    gulp.src(paths.styles)
        .pipe(less())
        .pipe(gulp.dest('build/css'))



gulp.task 'scripts', buildScripts
gulp.task 'styles', buildStyles


gulp.task 'watch', ()->
    gulp.watch paths.scripts, ['scripts']
    gulp.watch paths.watchStyles, ['styles']


gulp.task 'build', ()->
    buildStyles()
    buildScripts()
    gulp.src('build/**/*')
        .pipe(zip(package_data.name+"-"+package_data.version+'.zip'))
        .pipe(gulp.dest('dist'))


gulp.task 'serve', serve(
    root: ['build']
    port: 8000
)
