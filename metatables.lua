aTable = {}

for x = 1, 10 do
  aTable[x] = x
end

mt = {
  __add = function(table1, table2)
    sumTable = {}
    for y = 1, #table1 do
      if(table1[y] ~= nil) and (table2[y] ~= nil) then
        sumTable[y] = table1[y] + table2[y]
      else
        sumTable[y] = 0
      end
    end

    return sumTable
  end,
        
  __eq = function(table1, table2)
    return table1.value == table2.value
  end,
}

setmetatable(aTable, mt)
print(aTable == aTable)

addTable = {}

addTable = aTable + aTable

for z = 1, #addTable do
  print(addTable[z])
end
