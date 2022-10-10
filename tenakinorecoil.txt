-- tenaki's no recoil
        function isframework(scriptInstance)
    if tostring(scriptInstance) == "Framework" then
        return true
    end
    return false
end

function checkArgs(instance,index)
    if tostring(instance):lower():find("camera") and tostring(index) == "CFrame" then
        return true
    end
    return false
end

newindex = hookmetamethod(game, "__newindex", function(self,index,value)
    local callingScr = getcallingscript()

    if isframework(callingScr) and checkArgs(self,index) then
       return;
    end

    return newindex(self,index,value)
end)