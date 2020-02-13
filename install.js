const os = require('os');
const spawn = require('cross-spawn');
const fs = require('fs-extra');

if (os.platform() === 'win32') {
	console.log("Windows detected build game overlay modules");
}