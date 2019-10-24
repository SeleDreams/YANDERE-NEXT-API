local StreetScene = {}

function StreetScene.Awake()
end

function StreetScene.Start()
    if mode == nil then
        mode = 1
    else
        mode = mode + 1
        if mode > 2 then
            mode = 1
        end
    end
end

local done = false
local osana = nil
local target = nil

function StreetScene.Update()

    if Input.GetKeyUp("b") then
        done = false
        SceneManager.LoadScene("StreetScene")
    end

    if mode == 1 then
        if done == false then
            if FakeOsana ~= nil and target ~= nil then
                done = true
                osana = Object.Instantiate(FakeOsana)
                ModelRetarget.RetargetModel(osana, target)
                Debug.Log("It's retargeting")
            else
                target = GameObject.Find("EnjoKosaiCouple/KokonaCasualOutfit")
            end
        end
    elseif mode == 2 then
        if done == false then
            if FakeOsana ~= nil and target ~= nil then
                done = true
                osana = Object.Instantiate(FakeOsana)
                ModelRetarget.RetargetModel(osana, target)
                Debug.Log("It's retargeting")
            else
                target = GameObject.Find("EnjoKosaiCouple/Kocho_StandingIdle")
            end
        end
    elseif mode == 3 then
        if done == false then
            if FakeOsana ~= nil and target ~= nil then
                done = true
                osana = Object.Instantiate(FakeOsana)
                ModelRetarget.DisableAnims(osana)
                ModelRetarget.DisableScripts(osana)
                osana.transform.position = target.transform.position
                osana.transform.rotation = target.transform.rotation
                target.SetActive(false)
            else
                target = GameObject.Find("EnjoKosaiCouple/KokonaCasualOutfit")
            end
        
        end
    end
end

function StreetScene.OnSceneLoaded()
end

function StreetScene.OnSceneUnloaded()
end

return StreetScene
