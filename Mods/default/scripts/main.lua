YandereNext = loadfile(PluginsDir .. "\\scripts\\yn_plugin.lua")()

-- First function called, it's called when the game starts, useful to initialize some variables
function Awake()
    YandereNext.Awake()
end

-- This function is called just after awake, put the stuff you do only once here
function Start()
    YandereNext.Start()
end

-- This function is called every frame
function Update()
   YandereNext.Update()
end

-- this function is called every time a scene is loaded in memory
function OnSceneLoaded(name, mode)
    YandereNext.OnSceneLoaded(name, mode)
end

-- this function is called every time a scene is unloaded from memory
function OnSceneUnloaded(name)
    YandereNext.OnSceneUnloaded(name)
end
