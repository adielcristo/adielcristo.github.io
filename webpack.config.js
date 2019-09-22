const Encore = require('@symfony/webpack-encore');

Encore
    .setOutputPath('source/assets/')
    .setPublicPath('/assets')
    .copyFiles({
        from: './source/_layouts/default/assets/img',
        to: 'img/[path][name].[ext]',
        pattern: /\.(png|jpg|jpeg)$/
    })
    .addEntry('app', './source/_layouts/default/assets/js/app.js')
    .disableSingleRuntimeChunk()
    .cleanupOutputBeforeBuild()
    .enableSourceMaps(!Encore.isProduction())
    .enableSassLoader()
;

module.exports = Encore.getWebpackConfig();
