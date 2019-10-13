--[[
function _Awake()
print("Awake has been called")
end
]]

YandereNext = {
PrintScenes = true,
}

function YandereNext:_Awake()
end

function YandereNext:_Start()
  print("started")
end

function YandereNext:_Update()
   if (Input.GetKeyUp("n")) then
    ToggleLog()
   end
end

-- This function is called when the scene loads
function YandereNext:_OnSceneLoaded(name,mode)
  if self.PrintScenes then
    print("Loaded " .. name)
  end
end

