x = 0
checked = true
function onGUI()
    -- button
    if ImGui.Button("Test") then
        Engine.logError("Test clicked.")
    end

    -- drag float
    local changed = false
    changed, x = ImGui.DragFloat("Drag float", x)
    if changed then
        Engine.logError("X changed, new value = " .. tostring(x))
    end

    -- checkbox
    changed, checked = ImGui.Checkbox("Checkbox", checked)
    if changed then
        if checked then
            Engine.logError("Checkbox is checked")
        else
            Engine.logError("Checkbox is unchecked")
        end
    end
end