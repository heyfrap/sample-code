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

