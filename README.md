# ansicolorsx.lua
[![License](https://img.shields.io/badge/License-MIT-brightgreen.svg)](COPYING)

Extended version of [ansicolors.lua](https://github.com/kikito/ansicolors.lua) with latest ANSI color codes.

## Usage
The syntax is same as old `ansicolors` but with new attributes.
```lua
local color = require 'ansicolorsx'

print(color '%{italic red}An italic text with red color!')
```

## Attributes
Here's the list of all available attributes.

Misc. attributes:
 * `reset`
 * `bright`
 * `dim`
 * `italic`
 * `underline`
 * `blink`
 * `reverse`
 * `hidden`
 * `strike`

Foreground colors:
 * `black`
 * `red`
 * `green`
 * `yellow`
 * `blue`
 * `magenta`
 * `cyan`
 * `white`

Background colors:
 * `blackbg`
 * `redbg`
 * `greenbg`
 * `yellowbg`
 * `bluebg`
 * `magentabg`
 * `cyanbg`
 * `whitebg`

Special attributes (available if your terminal supports 256-colors):
 * `b(color)`, e.g `bred`
 * `b(color)bg`, e.g `bbluebg`
 * `tcolor!(id)`, e.g `tcolor!110`
 * `tcolorbg!(id)`, e.g `tcolorbg!100`

> For more information about 256-colors and the ID, check fnky's [ANSI Escape Sequences](https://gist.github.com/fnky/458719343aabd01cfb17a3a4f7296797#256-colors)
