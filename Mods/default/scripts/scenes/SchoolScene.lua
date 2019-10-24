local SchoolScene = {}

local Osoro = nil
local YanChan = nil
FakeOsana = nil
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
    YanChan = GameObject.Find("YandereChan/Character")
    if Osoro == nil then
        Debug.Log("Osoro is null")
    end
    if YanChan == nil then
        Debug.Log("Yan chan is null")
    end
    --Osoro = GetStudent(1)
end

function SchoolScene.RetargetDem()
    ModelRetarget.RetargetModel(Osoro,YanChan,true)
    SetHairstyle(0)
end

kokona = nil
realkokona = nil
local osana = nil

function SchoolScene.RetargetOsana()
    local kokonatransform = kokona.transform
    realkokona = kokonatransform.Find("Character")
    if kokoobject == nil then
        Debug.Log("kokona null")
    end
    if osana == nil then
        Debug.Log("osana null")
    end
    FakeOsana = Object.Instantiate(osana)
    FakeOsana.transform.SetParent(nil)
    ModelRetarget.RetargetModel(osana,realkokona.gameObject)
end

function SchoolScene.Start()
    if FakeOsana ~= nil then
        Object.Destroy(FakeOsana)
    end
    SchoolScene.ActivateSecretCharacters()
    SchoolScene.FindYanAndOsoro()
    SchoolScene.RetargetDem()
    SetPersona(2)
end

local done = false
function SchoolScene.Update()
    if done == false then
        if kokona == nil then
            kokona = GetStudent(30)
        else
            done = true
            osana = GameObject.Find("FakeOsana")
            SchoolScene.RetargetOsana()
        end
    end

    if done and Input.GetKeyUp("b") then
        Object.DontDestroyOnLoad(FakeOsana)
        SceneManager.LoadScene("StreetScene")
    end
   -- PrintInfo()
end

function SchoolScene.OnSceneLoaded()
   
end

function SchoolScene.OnSceneUnloaded()
end

return SchoolScene