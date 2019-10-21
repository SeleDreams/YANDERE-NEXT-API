local SchoolScene = {}

function SchoolScene.Awake()
end

function SchoolScene.Start()
    local original = GameObject.Find("School/ScienceClub/MechHeartbreaker")
    local bundle = AssetBundle.LoadFromFile(BundlesDir.. "/mijuubike")
    local data = bundle.LoadAsset("MijuuPrefab")
    bundle.Unload(false)
    local instance = Object.Instantiate(data).transform.Find("MechHeartbreaker").gameObject
    local tepresult = ModelRetarget.RetargetModel(instance,original)
    --UnlockMech()
end

function SchoolScene.Update()
end

function SchoolScene.OnSceneLoaded()
   
end

function SchoolScene.OnSceneUnloaded()
end
return SchoolScene