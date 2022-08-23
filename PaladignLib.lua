local Functions = {
    ["Highlight"] = function(args)
        if args[2] == true then
            local Highlight = Instance.new("Highlight", args[1])
            Highlight.FillColor = BrickColor.new("Really Blue").Color
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