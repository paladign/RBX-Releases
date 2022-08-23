local Functions = {
    ["Highlight"] = function(args) --args = Instance, Bool, Color3 (optional)
        if args[2] == true then
            if args[1]:FindFirstChild("Highlight") then return end
            local Highlight = Instance.new("Highlight", args[1])
            Highlight.FillColor = Color3.new(1,0.5,0.75)
            if args[3] ~= nil then
                Highlight.FillColor = args[3]
            end
        elseif args[2] == false then
            for _, obj in pairs(args[1]:GetChildren()) do
                if obj:IsA("Highlight") then
                    obj:Destroy()
                end
            end
        end
    end
}

return Functions