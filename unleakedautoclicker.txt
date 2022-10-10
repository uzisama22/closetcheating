local time = 0.01 --decrease if too slow increase if too fast

click = false
m = game.Players.LocalPlayer:GetMouse()
m.KeyDown:connect(function(key)
if key == "v" then
if click == true then click = false
elseif
click == false then click = true

while click == true do 
wait(time)
mouse1click()
end
end
end
end)