const { environment } = require('@rails/webpacker')

module.exports = environment

// アプリケーションを完成させよう2  / 24章【MeshiterroにBootstrapを導入しよう】
const webpack = require('webpack')
environment.plugins.prepend(
  'Provide',
  new webpack.ProvidePlugin({
    $: 'jquery/src/jquery',
    jQuery: 'jquery/src/jquery',
    Popper: 'popper.js'
  })
)