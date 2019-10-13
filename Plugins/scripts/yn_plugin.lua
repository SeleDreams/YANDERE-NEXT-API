--[[ 
  This is the main plugin of the Yandere Next engine.
  Modifying it is NOT recommended unless you know what you're doing.
  This plugin manages the functions available and the way scripts are loaded during gameplay.
]]

local YN = {
  PrintScenes = true,
  SceneScripts = {}
}

-- Updates all the scene related scripts
function YN.UpdateSceneScripts()
  for k, v in pairs(YN.SceneScripts) do
    if YN.SceneScripts[k].script.Update then
      YN.SceneScripts[k].script.Update()
    end
  end
end

function OnSceneLoadedSceneScripts(scene_name)
  for k, v in pairs(YN.SceneScripts) do
    if YN.SceneScripts[k].script.OnSceneLoaded then
      YN.SceneScripts[k].script.OnSceneLoaded(scene_name,mode)
    end
  end
end

function OnSceneUnLoadedSceneScripts(scene_name)
  for k, v in pairs(YN.SceneScripts) do
    if YN.SceneScripts[k].script.OnSceneUnLoaded then
      YN.SceneScripts[k].script.OnSceneUnLoaded(scene_name,mode)
    end
  end
end

-- This function is called when any scene loads
function YN.OnSceneLoaded(scene_name,mode)

  -- Prints current scene
  if YN.PrintScenes then
    Console.Log("Loaded " .. scene_name)
  end
  -- Loads scene script
  local tempObject = {name = scene_name,
  script = require('scenes.' .. scene_name)
}
  if tempObject.script ~= nil then
    YN.SceneScripts[scene_name] = tempObject
  end

  -- Calls the events
  OnSceneLoadedSceneScripts(scene_name)

  if YN.SceneScripts[scene_name].script.Awake then
    YN.SceneScripts[scene_name].script.Awake()
  end
  if YN.SceneScripts[scene_name].script.Start then
    YN.SceneScripts[scene_name].script.Start()
  end

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
    Console.ToggleLog()
  end
  YN.UpdateSceneScripts()
end



-- This function is called when any scene loads
function YN.OnSceneLoaded(scene_name,mode)

  -- Prints current scene
  if YN.PrintScenes then
    Console.Log("Loaded " .. scene_name)
  end
  -- Loads scene script
  local tempObject = {name = scene_name,
  script = require('scenes.' .. scene_name)
}
  if tempObject.script ~= nil then
    YN.SceneScripts[scene_name] = tempObject
  end

  -- Calls the events
  OnSceneLoadedSceneScripts(scene_name)

  if YN.SceneScripts[scene_name].script.Awake then
    YN.SceneScripts[scene_name].script.Awake()
  end
  if YN.SceneScripts[scene_name].script.Start then
    YN.SceneScripts[scene_name].script.Start()
  end

end

-- This function is called when any scene unloads
function YN.OnSceneUnloaded(scene_name)
  for k, v in pairs(YN.SceneScripts) do
    if YN.SceneScripts[k].script.OnSceneUnloaded then
      YN.SceneScripts[k].script.OnSceneUnloaded(scene_name)
    end
  end
  YN.SceneScripts[scene_name] = nil
end

return YN
