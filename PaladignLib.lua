local Functions = {
    ["Highlight"] = function(args)
        if args[2] then
            local Highlight = Instance.new("HighLight", args[1])
        elseif not args[2] then
            for _, obj in pairs(args[1]:GetChildren()) do
                if obj:IsA("HighLight") then
                    obj:Destroy()
                end
            end
        end
    end
}

return Functions