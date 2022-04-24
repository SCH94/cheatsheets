function start_hack()
	gg.toast("starting...")
	-- write hack code here
end

function instructions()
	gg.alert("scrpt created by silent1694")
	-- instructions foes here
end

function exit()
	os.exit()
end

gg.toast("loading script...")
gg.alert("SCRIPT BY SILENT1694")

opts={"> start hack", "instructions", "exit"}
menu=gg.choice(opts)
if menu==1 then start_hack() end
if menu==2 then instructions() end
if menu==3 then exit() end

gg.toast("#HACK SUCCESS#")
gg.alert("HACK CREATED BY SILENT1694")

