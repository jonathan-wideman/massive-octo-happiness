massive-octo-happiness
======================

### Installation

Run `sudo npm install -g gulp`

Run `npm install` in the working directory


### Building

To build scripts, use `gulp scripts`

To build styles (none yet), use `gulp styles`

To watch and build, use `gulp watch`

### Running

Run `gulp serve` to start a local server on port 8000

### Building for Release

To package the game for release, use `gulp build`. This will compile scripts and styles, and then zip the contents of `build` into `dist/<package>-<version>.zip`. "package" and "version" are pulled from the package.json file.
