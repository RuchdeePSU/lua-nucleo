-- tdeepequals-test-utils.lua -- utility functions for testing tdeepequals
-- This file is a part of lua-nucleo library
-- Copyright (c) lua-nucleo authors (see file `COPYRIGHT` for the license)

assert(type(import)=="function","Import is required to run")
local tdeepequals = assert(import "lua/tdeepequals.lua" {'tdeepequals'})
local tstr = assert(import "lua/tstr.lua" {'tstr'})
local tserialize = assert(import "lua/tserialize.lua" {'tserialize'})
assert(type(tdeepequals) == "function")

local function check_ok_ser(t1,t2,rez,ser)
  assert(type(rez)=="boolean","Result type must be a number")
  local r=tdeepequals(t1,t2)
  print("First  = ",ser(t1))
  print("Second = ",ser(t2))
  print("Result = ",r)
  assert( r==rez, "Expected:"..tostring(rez))
end
local function check_ok(t1,t2,rez)
  check_ok_ser(t1,t2,rez,tstr)
end
local function check_ok_verbose(t1,t2,rez)
  check_ok_ser(t1,t2,rez,tserialize)
end

return {check_ok=check_ok,check_ok_verbose=check_ok_verbose}