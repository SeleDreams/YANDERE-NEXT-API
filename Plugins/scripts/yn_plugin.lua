--[[ 
  This is the main plugin of the Yandere Next engine.
  Modifying it is NOT recommended unless you know what you're doing.
  This plugin manages the functions available and the way scripts are loaded during gameplay.
]]



local SceneScripts = {}

local YN = {
  PrintScenes = true,
  Tools = require("yn_tools")
}

-- Updates all the scene related scripts
function YN.UpdateSceneScripts()
  for k, v in pairs(SceneScripts) do
    if SceneScripts[k].script.Update then
      SceneScripts[k].script.Update()
    end
  end
end

function OnSceneLoadedSceneScripts(scene_name)
  for k, v in pairs(SceneScripts) do
    if SceneScripts[k].script.OnSceneLoaded then
      SceneScripts[k].script.OnSceneLoaded(scene_name, mode)
    end
  end
end

function OnSceneUnLoadedSceneScripts(scene_name)
  for k, v in pairs(SceneScripts) do
    if SceneScripts[k].script.OnSceneUnLoaded then
      SceneScripts[k].script.OnSceneUnLoaded(scene_name, mode)
    end
  end
end


-- This function is called when any scene loads
function YN.OnSceneLoaded(scene_name, mode)
  -- Prints current scene
  if YN.PrintScenes then
    print("Loaded " .. scene_name)
  end
  -- Loads scene script
  local tempObject = {name = scene_name, script = loadfile(ModDir .. "\\scripts\\scenes\\" .. scene_name .. ".lua")()}
  if tempObject.script ~= nil then
    SceneScripts[scene_name] = tempObject
  end

  -- Calls the events
  OnSceneLoadedSceneScripts(scene_name)

  if SceneScripts[scene_name].script.Awake then
    SceneScripts[scene_name].script.Awake()
  end
  if SceneScripts[scene_name].script.Start then
    SceneScripts[scene_name].script.Start()
  end
end

-- This function is called when any scene unloads
function YN.OnSceneUnloaded(scene_name)
  for k, v in pairs(SceneScripts) do
    if SceneScripts[k].script.OnSceneUnloaded then
      SceneScripts[k].script.OnSceneUnloaded(scene_name)
    end
  end
  SceneScripts[scene_name] = nil
end

-- This function is automatically executed when the game launches
function YN.Awake()
end

-- This function is automatically executed after the Awake function
function YN.Start()
  YN.OnSceneLoaded("WelcomeScene")
end

-- This function is automatically executed every frame
function YN.Update()
  if (Input.GetKeyUp("n")) then
    --Console.ToggleLog()
  end
  YN.UpdateSceneScripts()
end

return YN
