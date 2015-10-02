var gulp =require('gulp');
var paths = {
	css:['view/css/list.css']
	}
gulp.task('watcher',function(){
	gulp.watch(paths.css);
})
gulp.task('default',['watcher']);