-- Lua is not object oriented language

Animal = {height = 0, weight = 0, name = "No name", sound = "No sound"}

function Animal:new(height, weight, name, sound)
  setmetatable({}, Animal)

  self.height = height
  self.weight = weight 
  self.name = name 
  self.sound = sound 

  return self

end

function Animal:toString()
  animalStr = string.format("%s weighs %.1f lbs, is %.1f tall and says %s", self.name, self.weight, self.height, self.sound)
  return animalStr

end


spot = Animal:new(10, 15, "Spot", "Woof")
print(spot.weight)
print(spot:toString())


-- Inheritance example
Cat = Animal:new()

function Cat:new(height, weight, name, sound, favFood)
  setmetatable({}, Cat)
  self.height = height
  self.weight = weight
  self.name = name
  self.sound = sound
  self.favFood = favFood

  return self

end


function Cat:toString()
  catStr = string.format("%s weighs %.1f lbs, is %.1f tall and says %s and love %s", self.name, self.weight, self.height, self.sound, self.favFood)
  return catStr

end

fluffy = Cat:new(10, 15, "Fluffy", "meow", "tuna")
print(fluffy:toString())
