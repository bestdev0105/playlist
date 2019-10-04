let mix = require('laravel-mix');

/*
 |--------------------------------------------------------------------------
 | Mix Asset Management
 |--------------------------------------------------------------------------
 |
 | Mix provides a clean, fluent API for defining some Webpack build steps
 | for your Laravel application. By default, we are compiling the Sass
 | file for the application as well as bundling up all the JS files.
 |
 */

mix.js('src/js/app.js', 'www/js')
mix.sass('src/scss/app.scss', 'www/css')

mix.options({
	processCssUrls: false,
})

mix.webpackConfig({
	resolve: {
		alias: {
			'@': path.resolve('src/scss'),
			'#': path.resolve('www/img'),
		}
	},
});
