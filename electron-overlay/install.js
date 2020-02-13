const os = require('os');
const spawn = require('cross-spawn');
const fs = require('fs-extra');

if (os.platform() === 'win32') {
	console.log("Windows detected build game overlay modules");

    spawn.sync('npm', ['run', 'compile'], {
        input: 'win32 detected. Build native modules.',
        stdio: 'inherit'
    });

    fs.copySync('./overlay_binaries', './build/Release');
}