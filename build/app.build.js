({
    wrap: true,
    baseUrl: '../src',
    name: 'js-libs/almond/almond',
    include: 'app/config/config',
    mainConfigFile: '../src/app/config/config.js',
    out: '../public/dist/build.js',
    keepBuildDir: true,
    optimize: 'uglify2',
    optimizeCss: 'none',
})
