# ansicolorsx.lua
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

> If you're using 256-colors support terminal (such as xterm, Alacritty, etc.), you can use special attributes that uses 256-colors codes. The syntax: `b(color)` or `b(color)bg`, example: `bred` or `bwhitebg`.
