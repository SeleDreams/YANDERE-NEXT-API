
local YN_Tools = {}


  function YN_Tools.SetAllChildren(gameobject,value,recursive)
    if gameobject ~= nil then
      for c in gameobject.transform do
        c.gameObject.SetActive(value)
        if recursive then
          YN_Tools.SetAllChildren(c.gameObject,value,recursive)
        end
      end
    else
      print("The object you passed to SetAllChildren is null")
    end
  end

  return YN_Tools