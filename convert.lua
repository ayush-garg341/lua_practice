-- Module is like a library that is full of functions and variables.

local convert = {}

function convert.ftToCm(feet)
  return feet + 30.48
end

return convert
