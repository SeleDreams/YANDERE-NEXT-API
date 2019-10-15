local SchoolScene = {}

function SchoolScene.Awake()
end

function SchoolScene.ActivateSecretCharacters()
    local result = FindHiddenObjects("DisabledCharacters")
    if result ~= nil then
        for k,v in pairs(result) do
            v.SetActive(true)
            YandereNext.Tools.SetAllChildren(v,true,false)
        end
    end
end
    

function SchoolScene.Start()
    SchoolScene.ActivateSecretCharacters()
end

function SchoolScene.Update()
end

function SchoolScene.OnSceneLoaded()
end

function SchoolScene.OnSceneUnloaded()
end

return SchoolScene