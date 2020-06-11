// const path = require('path');
module.exports = {
    entry: './react_minesweeper.jsx',
    output: {
        filename: 'bundle.js'
    },
    module: {
        rules: [
            {
                test: /\.(js|jsx)$/,
                exclude: /(node_modules)/,
                use: {
                    loader: 'babel-loader',
                    query: {
                        presets: ['@babel/preset-env', '@babel/preset-react']
                    }
                }
            }
        ]
    },
    devtool: 'source-map', //gives more detailed error message
    resolve: {
        extensions: ['.js', '.jsx', '.*']
    }
}