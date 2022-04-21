-- two dashes starts a one line comment
--[[
  adding two ['s and ]'s makes it a multi-line comment

--]]
-------------------------------------------
-- 1. Variables and flow-control
-------------------------------------------

num=42
--[[ All numbers are doubles, 64-bit doubles have 52 bits for storing exact int values 
--]]

s='this is a string'
d="this is also a string"
-- strings are immutable

u=[[ double brackets 
start and end 
mult-line strings.
]]  

g=nil -- undefined g; lua has garbage collection.

-- blocks are denoted with do/end
-- No ++ or -- or += type operators
while num<50 do
	print(num)
	num=num+5
end

-- if clause
s='walter'
if num>60 then
	print('over 60')
elseif s~='walter' then
	-- ~= is not equals
	-- == equality check, ok for strings
 	io.write('not over 40')
else
	-- variables are global by default
	thisIsGlobal=5
	-- local variable
	local line=io.read() -- read nxt stdin line
	-- string concatenation uses the .. operator
	print('winter iz here,' .. line)
end

-- undefined varibles return nil
-- this is not an error
foo=aUnknown
print(foo)

bool_val=false

-- only nil and false are false; 0 and '' are true!

if not bool_val then print(bool_val) end

-- 'or' and 'and' are short-circuited.
-- this is similar to a?b:c operator in c/js

ans=bool_val and 'yes' or 'no' -- > 'no'

print('ans: ' .. ans)

su=0
for i=1, 10 , 1 do
	su=su+i
end

su=0
for j=20,1,-1 do su=su+1 end

-- in general, the range is begin,end[,step].

repeat
	print('the way of the future')
	num=num-1
until num==0
