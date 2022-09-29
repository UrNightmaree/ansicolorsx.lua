# ansicolorsx.lua
[![License](https://img.shields.io/badge/License-MIT-brightgreen.svg)](COPYING)

[![Luarocks](https://img.shields.io/luarocks/v/UrNightmaree/ansicolorsx?label=Luarocks&logo=Lua)](https://luarocks.org/modules/UrNightmaree/ansicolorsx)

Extended version of [ansicolors.lua](https://github.com/kikito/ansicolors.lua) with latest ANSI color codes.

## Usage
The syntax is same as old `ansicolors` but with new attributes.
```lua
local color = require 'ansicolorsx'

print(color '%{italic red}An italic text with red color!')
print(color '%{bbluebg cyan}A text with bright blue background and cyan foreground color!')
print(color '%{tcolor!110 underline}An underline text with cyan-like color!')
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

Special attributes:
 * Bold color (aixterm only):
   * `b(color)`, e.g `bred`
   * `b(color)bg`, e.g `bbluebg`
 * Full color (xterm/256-color only):
   * `tcolor:(id)`, e.g `tcolor:110`
   * `tcolorbg:(id)`, e.g `tcolorbg:100`
   * `rgbcolor:(r),(g),(b)`, e.g `rgbcolor:255,0,0`
   * `rgbcolorbg:(r),(g),(b)`, e.g `rgbcolorbg:255,255,0`

> For more information about 256-colors and the ID, check fnky's [ANSI Escape Sequences](https://gist.github.com/fnky/458719343aabd01cfb17a3a4f7296797#256-colors)
