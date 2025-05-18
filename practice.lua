-- This is a single line comment

-- This is a 
-- multi-line comment.

print("Hello world")

name = "Ayush" -- String can have double/single quotes.

io.write("Size of string ", #name, "\n")

-- \b, \t, \\, \", \'

name = 4
io.write("My name is ", name, "\n")

-- Lua just have floating point numbers what they call numbers

bigNum = 9223372036854775807 + 1
io.write("Big Number ", bigNum, "\t type is: ", type(bigNum), "\n")

-- Floating point numbers are precise upto 13 digits after decimal
floatPrecision = 1.999999999999 + 0.00000000000055
io.write(floatPrecision, "\n")

longString = [[
I am a very very long
string that goes on
forever
]]
io.write(longString, "\n")

longString = longString .. name
io.write(longString, "\n")

isAble = true
io.write(type(isAble), "\n")

io.write(type(madeUpVariable), "\n")

io.write("5 + 3 = ", 5+3, "\n")
io.write("5 - 3 = ", 5-3, "\n")
io.write("5 * 3 = ", 5*3, "\n")
io.write("5 / 3 = ", 5 / 3, "\n")
io.write("5.2 % 3 = ", 5.2 % 3, "\n")

-- number++, ++number, number--, --number ( can not perform these operations )

-- number += 1 to number = number + 1 ( in lua )

io.write("floor(2.345) : ", math.floor(2.345), "\n")
io.write("ceil(2.345) : ", math.ceil(2.345), "\n")
io.write("max(2, 3) : ", math.max(2, 3), "\n")
io.write("min(2, 3) : ", math.min(2, 3), "\n")
io.write("pow(8, 2) : ", math.pow(8, 2), "\n")
io.write("sqrt(64) : ", math.sqrt(64), "\n")


io.write("math.random() : ", math.random(), "\n")
io.write("math.random(10) : ", math.random(10), "\n")
io.write("math.random(5, 100) : ", math.random(5, 100), "\n")

math.randomseed(os.time())
print(string.format("Pi = %.10f", math.pi))


-- Relational Operators : > < >= <= == ~=
-- Logical Operators : and or not

age = 13
if age < 16 then
  io.write("You can go to school", "\n")
  local localvar = 10 -- Can not be accessed outside of if statement
elseif (age <= 16) and (age < 18) then
  io.write("You can drive", "\n")
else
  io.write("You can vote", "\n")
end

print(localvar) -- nil

if(age < 14) or (age > 67) then io.write("You shouldn't work", "\n") end

print(string.format("not true = %s", tostring(not true)))

-- canVote = age > 18 ? true : false ( no ternary operator in lua )

canVote = age > 18 and true or false
io.write("Can I vote : ", tostring(canVote), "\n")


-- String methods

quote = "Hey, I have successfully changed my password but I forgot it"

io.write("Quote length: ", string.len(quote), "\n")
io.write("Quote length: ", #quote, "\n")

io.write("Replace I with me: ", string.gsub(quote, "I", "me"), "\n")
io.write("Index of password: ", string.find(quote, "password"), "\n")
io.write("Quote Upper: ", string.upper(quote), "\n")
io.write("Quote Lower: ", string.lower(quote), "\n")


-- Loops

i = 1
while(i < 10) do
  io.write(i)
  i = i + 1

  if i == 8 then break end
end

io.write("\n")
-- There is no continue in lua

-- repeat
--   io.write("Enter your guess : ")
--   guess = io.read()
--
-- until tonumber(guess) == 15

for i = 1, 10, 2 do
  io.write(i)
end

io.write("\n")

-- tables
months = {"Jan", "Feb", "March", "Apr", "May", "June"}

for key, value in pairs(months) do
  io.write(value, " ")
end

io.write("\n")

aTable = {}

for i = 1, 10 do
  aTable[i] = i
end

io.write("First: ", aTable[1], "\n")
io.write("Number of items: ", #aTable, "\n")

table.insert(aTable, 1, 0) -- inserting 0 at 1th index
io.write("First: ", aTable[1], "\n")
io.write("Last : ", aTable[10], "\n")

print(table.concat(aTable, ", "))
table.remove(aTable, 1)
print(table.concat(aTable, ", "))

aMultiTable = {}
for i = 0, 9 do
  aMultiTable[i] = {}
  for j = 0, 9 do
    aMultiTable[i][j] = tostring(i) .. tostring(j)
  end
end

io.write("Table[0][0]: ", aMultiTable[0][0], "\n")

-- functions 

function getSum(num1, num2)
  return num1 + num2
end

print(string.format("5 + 2 = %d", getSum(5, 2)))

function splitStr(thestring)
  stringTable = {}

  local i = 1

  for word in string.gmatch(thestring, "[^%s]+") do
    stringTable[i] = word
    i = i+1
  end

  return stringTable, i
end

splitStrTable, numOfStr = splitStr("The turtle")

for j = 1, numOfStr do
  print(string.format("%d : %s", j, splitStrTable[j]))
end

function getSumMore(...)
  local sum = 0
  for k, v in pairs{...} do
    sum = sum + v
  end
  return sum
end

io.write("Sum ", getSumMore(1,2,3,4,5), "\n")

-- Assigning function to a variable
doubleIt = function(x) return x * 2 end
print(doubleIt(4))

-- Closure 
function outerFunc()
  local i = 0

  return function()
    i = i + 1
    return i
  end

end

getI = outerFunc()
print(getI())
print(getI())

-- Coroutine
print("========= Coroutines ========== ")
co = coroutine.create(function()
  for i = 1, 10, 1 do
    print(i)
    print(coroutine.status(co))
    if i == 5 then
      coroutine.yield() 
    end
  end
end)

print(coroutine.status(co))
coroutine.resume(co)

print(coroutine.status(co))

co2 = coroutine.create(function()
  for i = 101, 110, 1 do
    print(i)
  end
end)

coroutine.resume(co2)
coroutine.resume(co)
print(coroutine.status(co))

convertModule = require("convert")
print(string.format("%.3f cm", convertModule.ftToCm(12)))
