local ESPs = {}
local Functions = {
    ["Highlight"] = function(obj, creating, color) --args = Instance, Bool, Color3 (optional)
        if creating == true then
            if obj:FindFirstChild("Highlight") then return end
            local Highlight = Instance.new("Highlight", obj)
            Highlight.FillColor = Color3.new(1,0.5,0.75)
            if color ~= nil then
                Highlight.FillColor = color
            end
            Highlight.OutlineColor = Highlight.FillColor
        elseif creating == false then
            for _, obj in pairs(obj:GetChildren()) do
                if obj:IsA("Highlight") then
                    obj:Destroy()
                end
            end
        end
    end,
    ["UpdateESP"] = function(tab)
        for _, datatable in pairs(ESPs) do
            local vec = workspace.CurrentCamera:WorldToViewportPoint(datatable[2].Position)
            local vec2 = Vector2.new(vec.X, vec.Y)
            datatable[1].Position = vec2
        end
    end,
    ["AddESP"] = function(obj)
        local text = Drawing.new("Text")
        text.Text = "Test"
        text.Size = 4
        text.Color = Color3.new(1,0.5,0.75)
        text.Visible = true
        local datatable = {text, obj}
        table.insert(ESPs, datatable)
    end
}

return Functions