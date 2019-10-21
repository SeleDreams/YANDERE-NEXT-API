local StreetScene = {}

function StreetScene.ActivateSecretCharacters(objet)
    -- THIS IS WHERE THE HIDDEN CHARACTERS ARE ACTIVATED, SO IF YOU WANT TO ACTIVATE ANY OBJECT JUST FIND IT IN ASSETSTUDIO AND REPLACE THE NAME "DisabledCharacters"
    local result = FindHiddenObjects("Mother")
    if result ~= nil  then
        for k,v in pairs(result) do
            Debug.Log(v.name .. " FOUND")
            v.SetActive(true)
            YandereNext.Tools.SetAllChildren(v,true,true)
        end
    end
end

function StreetScene.Awake()
end

function StreetScene.Start()
   -- FixCamera()
   -- print("trying to activate ryoba")
   
end
local yan
local mom
function StreetScene.Update()
   --[[ if Input.GetKeyUp("b") then
        StreetScene.ActivateSecretCharacters("Mother")
        mom = GameObject.Find("Mother")
        yan = GameObject.Find("Yandere-chan")
        mom.transform.position = yan.transform.position
    end
    if yan ~= nil and mom ~= nil then
        
    end]]
end

function StreetScene.OnSceneLoaded()
end

function StreetScene.OnSceneUnloaded()
end

return StreetScene