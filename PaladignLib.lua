local Functions = {
    ["Highlight"] = function(args)
        print(args)
        if args[2] == true then
            local Highlight = Instance.new("Highlight", args[1])
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