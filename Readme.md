### JSX Compiler for Vim

An experiment in providing the ability to easily preview the result of compiling your JSX file into Javascript. Supports compiling the whole file, or a visual mode selection. Inspired by, and based on the implementation of [vim-coffee-script](https://github.com/kchmck/vim-coffee-script). This plugin handles only the JSX compilation support. For JSX highlighting and indentention, see the [vim-jsx](https://github.com/mxw/vim-jsx) plugin.

## Requirements

* `nodeJS` - required to run react-tools
* `react-tools` - NPM package which handles the compilation

# Installation

1. Install with [Pathogen](https://github.com/tpope/vim-pathogen), cloning into `~/.vim/bundle`
2. Run `npm install` within `~/.vim/bundle/jsx-compiler-vim` to grab `react-tools` 

## Usage

`:JsxCompile`

Run the command in normal mode to convert the whole file, or on a visual selection to convert just a snippet. When ran, the compiled output calls out to the system to compile, then outputs the resulting Javascript into a new scratch buffer.

## ToDo

* Have compiled Javascript output syntax highlighted
* Look to add linting support and other helpful output
