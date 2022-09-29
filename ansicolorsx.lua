local function isWindows()
  return type(package) == 'table' and type(package.config) == 'string' and package.config:sub(1,1) == '\\'
end

local supported = not isWindows()

local support256 = os.getenv'TERM':find'256'
local supportAixterm = os.getenv'TERM' == 'aixterm'

local kw = { -- Stands for KeyWord
  -- Reset
  reset = 0,

  -- Misc.
  bright = 1,
  dim = 2,
  italic = 3,
  underline = 4,
  blink = 5,
  reverse = 7,
  hidden = 8,
  strike = 9,

  -- Foreground colors
  black = 30,
  red = 31,
  green = 32,
  yellow = 33,
  blue = 34,
  magenta = 35,
  cyan = 36,
  white = 37,

  -- Background colors
  blackbg = 40,
  redbg = 41,
  greenbg = 42,
  yellowbg = 43,
  bluebg = 44,
  magentabg = 45,
  cyanbg = 46,
  whitebg = 47,
}

if supportAixterm and supported then
  local ext_kw = {
    -- Foreground colors (bright)
    bblack = 90,
    bred = 91,
    bgreen = 92,
    byellow = 93,
    bblue = 94,
    bmagenta = 95,
    bcyan = 96,
    bwhite = 97,

    -- Background colors (bright)
    bblackbg = 100,
    bredbg = 101,
    bgreenbg = 102,
    byellowbg = 103,
    bbluebg = 104,
    bmagentabg = 105,
    bcyanbg = 106,
    bwhitebg = 107
  }

  for i,v in pairs(ext_kw) do
    kw[i] = v
  end
end

local escstr = '\27[%dm'
local esctstr = '\27[%d8;5;%dm'
local rgbstr = '\27[%d8;2;%sm'

local function escnum(num)
  return escstr:format(num)
end

local function esctnum(num,bg)
  if bg then
    return esctstr:format(4,num)
  else
    return esctstr:format(3,num)
  end
end

local function rgbnum(str,bg)
  str = str:gsub('[,]+',';')
  
  if bg then
    return rgbstr:format(4,str)
  else
    return rgbstr:format(3,str)
  end
end

local function esckeys(str)
  if not supported then return '' end

  local buffer = {}
  local number

  local errw
  for w in str:gmatch '%w+' do
    number = kw[w]
    
    if not number then
      errw = w
      break
    end
    
    table.insert(buffer,escnum(number))
  end

  if support256 then
    errw = nil

    for n in str:gmatch 'tcolor:([%d]+)' do
      table.insert(buffer,esctnum(tonumber(n)))
    end
    for n in str:gmatch 'tcolorbg:([%d]+)' do
      table.insert(buffer,esctnum(tonumber(n),true))
    end

    for rgb in str:gmatch 'rgbcolor:([%d]+,[%d]+,[%d]+)' do
      table.insert(buffer,rgbnum(rgb))
    end
    for rgb in str:gmatch 'rgbcolorbg:([%d]+,[%d]+,[%d]+)' do
      table.insert(buffer,rgbnum(rgb,true))
    end
  end
  

  if errw then
    error('Unknown keyword: '..errw)
  else
    return table.concat(buffer)
  end
end

local function replcode(str)
  str = string.gsub(str,'(%%{(.-)})', function (_,str) return esckeys(str) end )
  return str
end

local function color(str)
  str = tostring(str or '')

  return replcode('%{reset}'..str..'%{reset}')
end

local ac_mt = { __call = function(_,str)
  return color(str)
end
}

---@overload fun(str: string): string
local color = setmetatable({ noReset = replcode }, ac_mt)

return color
