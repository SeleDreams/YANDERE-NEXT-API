local SchoolScene = {}

local Osoro = nil
local YanChan = nil
function SchoolScene.Awake()
end

function SchoolScene.ActivateSecretCharacters()
    -- THIS IS WHERE THE HIDDEN CHARACTERS ARE ACTIVATED, SO IF YOU WANT TO ACTIVATE ANY OBJECT JUST FIND IT IN ASSETSTUDIO AND REPLACE THE NAME "DisabledCharacters"
    local result = FindHiddenObjects("DisabledCharacters")
    if result ~= nil  then
        for k,v in pairs(result) do
            v.SetActive(true)
            YandereNext.Tools.SetAllChildren(v,true,false)
        end
    end
end
   
function SchoolScene.FindYanAndOsoro()
    -- THIS IS WHERE IT FINDS YANDERE CHAN AND OSORO
    Osoro = GameObject.Find("DisabledCharacters/FakeOsoro")
    YanChan = GameObject.Find("YandereChan")
    --Osoro = GetStudent(1)
end

function SchoolScene.RetargetDem()
    Debug.Log("Started retargetting")
    local result = ModelRetarget.RetargetModel(Osoro,YanChan,"Hips")
    SetHairstyle(0)
    Debug.Log("Result is " .. result)
end



function SchoolScene.Start()
    SchoolScene.ActivateSecretCharacters()
    SchoolScene.FindYanAndOsoro()
    SchoolScene.RetargetDem()
    SetPersona(2)
end

function SchoolScene.Update()
    
   -- PrintInfo()
end

function SchoolScene.OnSceneLoaded()
   
end

function SchoolScene.OnSceneUnloaded()
end

return SchoolScene