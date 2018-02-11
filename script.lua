--[[ 
    ONElua.
	Lua Interpreter for PlayStation®Vita.
	
	Licensed by GNU General Public License v3.0
	
	Copyright (C) 2014-2018, ONElua Team
	http://onelua.x10.mx/staff.html
	
	Designed By:
	- Gdljjrod (https://twitter.com/gdljjrod).
	- DevDavisNunez (https://twitter.com/DevDavisNunez).

]]

color.loadpalette() -- Load Defaults colors

-- ## IMMAGINE DI SFONDO ##
back = image.load("resources/back.png")

local wstrength = wlan.strength()
if wstrength then
    if wstrength > 55 then dofile("git/updater.lua") end
end
ftp.init() 
while true do
	buttons.read()
	if back then back:blit(0,0) end
	
	screen.print(10,30,"Press START to exit.",1,color.white,color.red)
	screen.print(10,50, "Mac: "..tostring(os.mac()))

	if ftp.state() then	screen.print(10,70,"Connect to:>>>> ftp://"..tostring(wlan.getip())..":1337",1,color.green) end

	screen.flip() -- Show Buff

	if buttons.released.start then break end -- Exit

end
ftp.term()