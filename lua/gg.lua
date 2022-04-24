--[[ lua usage with Game Gaurdian --]]

-- give user a popup alert
gg.alert("Hello World")

-- give user alert for specific interval of time
gg.toast("Toast message")

-- menu example
opts={'1st script','2nd script'}
menu=gg.choice(opts)
if menu==1 then
	gg.alert("1st script executed")
elseif menu==2 then
	gg.alert("2nd script executed")
else
	os.exit()
end

-- prompt example
res=gg.prompt({'enter first value: ','enter second value'})
if res==nil then 
	gg.alert("cancelled") 
else
	print(res[1]+res[2])
end

-- promt example 2
res=gg.prompt({"enter values \n n1:","n2"},
{"default value of n1","defaulr value of n2"},
{"number","number"}
)

print("n1: "..res[1].." n2: "..res[2])
