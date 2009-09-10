local table_concat = table.concat
local loadstring, assert = loadstring, assert
local pairs, type, tostring = pairs, type, tostring
dofile('lua-nucleo/import.lua')
local gen_random_dataset=loadfile("test/lib/table.lua")()[ "gen_random_dataset"]
local tserialize=loadfile("lua-nucleo/tserialize.lua")() ["tserialize"]
dofile("bench/metalua_serialize.lua")
local lua = "return {"..("true,false,134,"):rep(1024).."}"local data = gen_random_dataset(1)

--print("lua", #lua)
--print("saved", #saved)

local bench = {}

bench.tserialize = function()
  assert(tserialize(data))
end

bench.metalua_serialize = function()
  assert(serialize(data))
end


return bench
