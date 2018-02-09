local lights = {nil, nil}
local lightPrefabs = {nil, nil}
local currentRot = 0.0
rotationRate = 1.0

function createLight(index)
    lights[index] = Engine.instantiatePrefab(g_engine, g_universe, {0,0,0}, lightPrefabs[index])
    
    Engine.setParent(g_universe, this, lights[index])

    local side = 2.5
    if index == 1 then side = -2.5 end

    Engine.setEntityLocalPosition(g_universe, lights[index], { side, 2, 0 })
end

function init()
    lightPrefabs[0] = Engine.loadResource(g_engine, "prefabs/party/left.fab", "prefab")
    lightPrefabs[1] = Engine.loadResource(g_engine, "prefabs/party/right.fab", "prefab")

    createLight(0)
    createLight(1)
end

function update(dt)
    currentRot = currentRot + (rotationRate * dt)
    Engine.setEntityRotation(g_universe, this, {0, 1, 0}, currentRot)
end
