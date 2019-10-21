local TitleScene = {}


function TitleScene.ActivateSecretCharacters()
    -- THIS IS WHERE THE HIDDEN CHARACTERS ARE ACTIVATED, SO IF YOU WANT TO ACTIVATE ANY OBJECT JUST FIND IT IN ASSETSTUDIO AND REPLACE THE NAME "DisabledCharacters"
    local result = FindHiddenObjects("LoveSickScene")
    if result ~= nil  then
        for k,v in pairs(result) do
            print(v.name)
            if v.name == "f02_schoolwear_200_h" then
                v.SetActive(true)
            end
            --YandereNext.Tools.SetAllChildren(v,true,false)
        end
    end
end

local done = false

function TitleScene.Awake()
end

function TitleScene.Start()
  --  TitleScene.ActivateSecretCharacters()
   
    
   
end

function TitleScene.Update()
    --[[
    if done == false then
        done = true
        print("Loading bundle")
        local bundle = AssetBundle.LoadFromFile(BundlesDir .. "youngyanchan")
        print("loading young yan chan")
        local youngasset = bundle.LoadAsset("YanPrefab")
        bundle.Unload(false)
        if youngasset == null then
            Debug.Log("Young asset is null")
        end
        print("instantiating young yan chan")
        local youngyandere1 = Object.Instantiate(youngasset)
        local youngyandere2 = Object.Instantiate(youngyandere1)
        print("locating yandere")
        local yandere = GameObject.Find("HomeYandereChan")
        TitleScene.ActivateSecretCharacters()
        local lovesickdere = GameObject.Find("LoveSickScene/f02_schoolwear_200_h")
        print("retargeting yandere")
        local tepresult = ModelRetarget.RetargetModel(youngyandere1,yandere,"Hips")
        local tepresult2 = ModelRetarget.RetargetModel(youngyandere2,lovesickdere,"Hips")
        
    end]]
end

function TitleScene.OnSceneLoaded()
end

function TitleScene.OnSceneUnloaded()
end

return TitleScene