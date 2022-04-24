--[[
delivery from the pain hack
--]]

opts={'speed hack', 'item hack'}

menu=gg.choice(opts)

if menu==1 then
	gg.setSpeed(200)
elseif menu==2 then
	input=gg.prompt({'Enter the number of items you currently have: '},{[1]='number'})
end
