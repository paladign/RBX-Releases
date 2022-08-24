local Functions = {
    ["AddHighlight"] = function(obj, creating, color) --args = Instance, Bool, Color3 (optional)
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
    ["AddESP"] = function(obj)
        local text = Drawing.new("Text")
        text.Text = "Test"
        text.Color = Color3.new(1,0.5,0.75)
        text.Visible = true
        local vec = workspace.CurrentCamera:WorldToViewportPoint(obj.Position)
        text.Position = Vector2.new(vec.X, vec.Y)
    end
}

return Functions