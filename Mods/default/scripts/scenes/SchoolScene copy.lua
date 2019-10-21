local SchoolScene = {}

local Osoro = nil
local YanChan = nil
function SchoolScene.Awake()
end

function SchoolScene.ActivateSecretCharacters(objet)
    -- THIS IS WHERE THE HIDDEN CHARACTERS ARE ACTIVATED, SO IF YOU WANT TO ACTIVATE ANY OBJECT JUST FIND IT IN ASSETSTUDIO AND REPLACE THE NAME "DisabledCharacters"
    local result = FindHiddenObjects(objet)
    if result ~= nil  then
        for k,v in pairs(result) do
            v.SetActive(true)
            YandereNext.Tools.SetAllChildren(v,true,false)
        end
    end
end
   
function SchoolScene.FindYanAndOsoro()
    -- THIS IS WHERE IT FINDS YANDERE CHAN AND OSORO
    --Osoro = GameObject.Find("DisabledCharacters/FakeOsoro")
    YanChan = GameObject.Find("YandereChan")
  --  Osoro = GetStudent(1)
end

function SchoolScene.RetargetDem()
    Debug.Log("Started retargetting")
    local source = Object.Instantiate(YanChan)
    local target = Object.Instantiate(Osoro)
    local tepresult = ModelRetarget.RetargetModel(target,YanChan,"Hips")
    local result = ModelRetarget.RetargetModel(source,Osoro,"Hips","Hair")
   -- SetStudentHairstyle(1,"0")
    --SetHairstyle(0)
    Debug.Log("Result is " .. result)
end



function SchoolScene.Start()
   -- SchoolScene.ActivateSecretCharacters()
    --SchoolScene.FindYanAndOsoro()
    --SetPersona(1)
    SchoolScene.ActivateSecretCharacters("DisabledManagers")
end

local i = 0
function SchoolScene.Update()
    --[[
    --Debug.Log(YanChan.transform.position)
    if Osoro ~= nil then
        i = i + 1
        local pos = New_Vector3()
        pos.x = -20
        pos.y = 0
        pos.z = 7.8
        Osoro.transform.position = pos
        Osoro.transform.LookAt(YanChan.transform.position,Vector3.up)
       -- SchoolScene.RetargetDem()
        print(Osoro.transform.position)
    else
        Osoro = GetStudent(3)
    end
    if Input.GetKeyUp("b") then
        Osoro = GetStudent(5)
      --  SchoolScene.RetargetDem()
    end
    ]]
end

function SchoolScene.OnSceneLoaded()
   
end

function SchoolScene.OnSceneUnloaded()
end
return SchoolScene