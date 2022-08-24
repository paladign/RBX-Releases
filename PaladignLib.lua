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
            local obj = datatable[2]
            local vec, vis = workspace.CurrentCamera:WorldToViewportPoint(obj.Position)
            local vec2 = Vector2.new(vec.X, vec.Y+obj.Size.Y)
            datatable[1].Position = vec2
            if vis then
                datatable[1].Visible = true
            elseif not vis then
                datatable[1].Visible = false
            end
            if obj == nil then
                datatable[1]:Remove()
            end
        end
    end,
    ["AddESP"] = function(obj)
        local text = Drawing.new("Text")
        text.Text = obj.Name
        if obj.Parent:IsA("Model") then
            text.Text = obj.Parent.Name
        end
        text.Size = 20
        text.Center = true
        text.Color = Color3.new(1,0.5,0.75)
        text.Visible = true
        local datatable = {text, obj}
        table.insert(ESPs, datatable)
    end,
    ["RemoveESP"] = function(obj)
        for index, datatable in pairs(ESPs) do
            if datatable[2] == obj then
                table.remove(ESPs, index)
                datatable[1]:Remove()
            end
        end
    end,
    ["ClearESP"] = function()
        for index, datatable in pairs(ESPs) do
            table.remove(ESPs, index)
            datatable[1]:Remove()
        end
    end
}

return Functions