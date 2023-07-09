module.exports = {
  build: {
    extend (config, { isDev, isClient }) {
      config.module.rules.push(
        // JavaScriptファイルにBabelローダーを適用
        {
          test: /\.js$/,
          loader: 'babel-loader',
          exclude: /node_modules/
        },
        // VueファイルにVueローダーを適用
        {
          test: /\.vue$/,
          loader: 'vue-loader'
        },
        // SCSSファイルにSassローダーを適用
        {
          test: /\.scss$/,
          use: [
            'style-loader',
            'css-loader',
            'sass-loader'
          ]
        }
      )
    }
  }
}

module.exports = {
  build: {
    extend (config, { isDev, isClient }) {
      // node_modulesの中の特定のパッケージをトランスパイル対象に含めます
      config.module.rules.push({
        test: /\.m?js$/,
        exclude: /(node_modules\/(?!(sora-js-sdk)\/).*)/,
        use: {
          loader: 'babel-loader',
        }
      })
    }
  }
}


