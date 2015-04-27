// uses ReactTools module to compile code
var reactTools = require('react-tools');

var jsxCode = process.argv[2];
var compiledCode = reactTools.transform(jsxCode);

console.log(compiledCode);
