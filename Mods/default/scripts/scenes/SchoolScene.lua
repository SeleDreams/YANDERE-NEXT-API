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
local YanChan = nil
local Osoro = nil
function SchoolScene.FindYanChanPos() 
    YanChan = GameObject.Find("YandereChan")
    Osoro = GameObject.Find("FakeOsoro")
end

function SchoolScene.Start()
    SchoolScene.ActivateSecretCharacters()
    SchoolScene.FindYanChanPos()
end

function SchoolScene.Update()
    if YanChan ~= nil then
        if Input.GetKey("m") then
            Osoro.transform.position = YanChan.transform.position
        end
    end
end

function SchoolScene.OnSceneLoaded()
end

function SchoolScene.OnSceneUnloaded()
end

return SchoolScene