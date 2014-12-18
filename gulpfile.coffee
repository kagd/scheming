gulp        = require 'gulp'
plugins     = require('gulp-load-plugins')()

gulp.task 'build', ->
  gulp.src('**/*.coffee', {cwd: 'src', cwdbase : true})
    .pipe(plugins.sourcemaps.init())
    .pipe(plugins.coffee())
    .pipe(plugins.sourcemaps.write('.'))
    .pipe(gulp.dest 'dest')

gulp.task 'watch', ->
  gulp.watch ['src/**/*.coffee', 'test/**/*.coffee'] , ['test']

gulp.task 'test', ->
  gulp.src('**/*.coffee', {cwd : 'test', cwdbase: true})
    .pipe(plugins.mocha({reporter : 'spec'}))
