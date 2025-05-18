-- Tables in lua can be used as arrays, dictionaries (maps), records (objects), sets, and more.

local t = {} -- empty table

-- arrays

local fruits = {"apple", "banana", "cherry"}
print(fruits[1])
fruits[4] = "date"
print(fruits[4])

-- key value pairs as in dictionary

local person = {
  name = "Alice",
  age = 30
}
print(person["name"])
print(person.age)
person["city"] = "Paris"

-- mixed Tables

local t = {
  "first",      -- index 1
  "second",     -- index 2
  name = "foo", -- key "name"
}

print(t[1], t[2])
print(t['name'])

-- Table functions

local t = {"a", "b", "c"}
table.insert(t, "d")    -- adds at the end
table.remove(t, 2)      -- removes "b"
print(#t)               -- length (3 after removal)

-- Table as objects

local car = {
  speed = 100,
  drive = function(self)
    print("Driving at " .. self.speed .. " km/h")
  end
}

car:drive()

-- Tables as Classes/objects

local Car = {}
Car.__index = Car

function Car:new(speed)
  local obj = setmetatable({}, Car)
  obj.speed = speed or 0
  return obj
end

function Car:drive()
  print("Driving at " .. self.speed .. " km/h")
end

local myCar = Car:new(120)
myCar:drive()

-- Table as sets

local set = {}
set["apple"] = true
set["banana"] = true

if set["apple"] then
  print("Apple is in the set")
end

-- Tables with Metatables

local mt = {}
function mt.__add(a, b)
  return {x = a.x + b.x, y = a.y + b.y}
end

local v1 = {x = 1, y = 2}
local v2 = {x = 3, y = 4}
setmetatable(v1, mt)
setmetatable(v2, mt)

local v3 = v1 + v2
print(v3.x, v3.y)

-- Metatables support many metamethods like:
  -- __index, __newindex
  -- __add, __sub, __tostring
  -- __call, __eq, __lt, __le etc


