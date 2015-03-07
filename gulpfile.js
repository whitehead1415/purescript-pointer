var gulp = require('gulp');
var purescript = require('gulp-purescript');
var browserSync = require('browser-sync');

function swallowError (error) {
    console.log(error.toString());
    this.emit('end');
}

gulp.task('build', function() {
    return (gulp.src(['src/**/*.purs', "bower_components/**/src/**/*.purs"])
	    .pipe(purescript.psc({
		main: "Pointer",
		modules: ["Pointer"]
	    }))
	    .on('error', swallowError)
	    .pipe(gulp.dest('dist/'))
    );
});

gulp.task('browser-sync', function() {
    browserSync({
	server:{
	    baseDir: "./dist"
	},
	notify: false
	//,
	//browser: ["firefox"]
    });
});

gulp.task('default', ['build', 'browser-sync'], function() {
    gulp.watch(["src/**/*.purs", "dist/**/*.html"], ['build', browserSync.reload]);
});
