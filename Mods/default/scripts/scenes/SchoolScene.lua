local SchoolScene = {}

local Senpai = nil
local YanChan = nil

function SchoolScene.RetargetDem()
    Debug.Log("Started retargeting")
    ModelRetarget.UpdateRenderers(YanChan)
    ModelRetarget.UpdateRenderers(Senpai)
    local s = Object.Instantiate(Senpai)
    local y = Object.Instantiate(YanChan)
    ModelRetarget.DisableScripts(y)
    ModelRetarget.DisableScripts(s)
    local senpai_hips = s.transform.Find("Character/PelvisRoot/Hips")
    local yanchan_hips = YanChan.transform.Find("Character/PelvisRoot/Hips")
    ModelRetarget.DisableRenderers(YanChan)
    ModelRetarget.DisableStaticRenderers(Senpai)
    ModelRetarget.RetargetModel(senpai_hips.gameObject,yanchan_hips.gameObject)
    
    local yan2_hips = y.transform.Find("Character/PelvisRoot/Hips")
    local sen2_hips = Senpai.transform.Find("Character/PelvisRoot/Hips")
    ModelRetarget.DisableRenderers(Senpai)
    ModelRetarget.DisableStaticRenderers(Senpai)
    ModelRetarget.RetargetModel(yan2_hips.gameObject,sen2_hips.gameObject)
   -- SetHairstyle(0)
end



function SchoolScene.Start()
    YanChan = GameObject.Find("YandereChan")
    local gloves = YanChan.transform.Find("RiggedGlovesAttacher")
    Object.Destroy(gloves.gameObject)
end

local done = false

function SchoolScene.Update()
    if done == false then
        if Senpai == null then
            Senpai = GetStudent(1)
        else
            done = true
            SchoolScene.RetargetDem()
        end
    end
   -- PrintInfo()
end

function SchoolScene.OnSceneLoaded()
   
end

function SchoolScene.OnSceneUnloaded()
end

return SchoolScene