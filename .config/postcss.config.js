module.exports = {
  plugins: [
    require('postcss-autoreset')(),
    require('postcss-unprefix')(),
    require('autoprefixer'),
    require('cssnano')(),
  ],
}