local ghostProps = {
    "prop_streetlight_01", "prop_streetlight_01b", "prop_streetlight_02",
    "prop_streetlight_03", "prop_streetlight_03b", "prop_streetlight_04",
    "prop_streetlight_05", "prop_streetlight_06", "prop_streetlight_06b",
    "prop_streetlight_m", "prop_streetlight_01a", "prop_streetlight_m1",
    "prop_streetlight_01c", "prop_streetlight_07a"
}

CreateThread(function()
    while true do
        local playerCoords = GetEntityCoords(PlayerPedId())
        local nearbyObjects = GetGamePool("CObject")

        for _, obj in pairs(nearbyObjects) do
            if #(playerCoords - GetEntityCoords(obj)) < 100.0 then
                local modelHash = GetEntityModel(obj)
                for _, ghostProp in pairs(ghostProps) do
                    if modelHash == GetHashKey(ghostProp) then
                        SetEntityCollision(obj, false, false)
                        SetEntityVisible(obj, true, false)
                        FreezeEntityPosition(obj, true)
                    end
                end
            end
        end
        Wait(1000)
    end
end)
