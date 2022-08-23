local Functions = {
    ["AddHighlight"] = function(obj, creating, color) --args = Instance, Bool, Color3 (optional)
        if creating == true then
            if obj:FindFirstChild("Highlight") then return end
            local Highlight = Instance.new("Highlight", obj)
            Highlight.FillColor = Color3.new(1,0.5,0.75)
            if color ~= nil then
                Highlight.FillColor = color
            end
            Highlight.OutlineColor = Highlight.Fillcolor
        elseif creating == false then
            for _, obj in pairs(inst:GetChildren()) do
                if obj:IsA("Highlight") then
                    obj:Destroy()
                end
            end
        end
    end,
    ["AddESP"] = function(obj)
        local text = Drawing.new("Text")
        text.Text = "Test"
        text.Visible = true
        text.Position = workspace.CurrentCamera:WorldToViewportPoint(obj.Position)
    end
}

return Functions