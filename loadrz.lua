local StarterGui = game:GetService("StarterGui")
StarterGui:SetCore("SendNotification", {
    Title = "BYP | Loading",
    Text = "Please wait...",
    Duration = 5
})
local scripts = {
    [662417684] = "https://raw.githubusercontent.com/coderworder/byp/refs/heads/main/lbb.lua",
  -- [142823291] = "wtfnowadwawdw"
}
local fallbackUrl = "https://raw.githubusercontent.com/coderworder/byp/main/none.lua"
local urlToLoad = scripts[game.PlaceId] or fallbackUrl
local success, response = pcall(function()
    return game:HttpGet(urlToLoad)
end)
if success and response and not response:find("<!DOCTYPE html>") then
    local loadSuccess, loadErr = pcall(loadstring(response))
    if loadSuccess then
        StarterGui:SetCore("SendNotification", {
            Title = "BYP Loaded!",
            Text = "Script executed successfully",
            Duration = 5
        })
    else
        StarterGui:SetCore("SendNotification", {
            Title = "BYP Error",
            Text = "Failed to execute script: " .. tostring(loadErr),
            Duration = 5
        })
    end
else
    StarterGui:SetCore("SendNotification", {
        Title = "BYP Error",
        Text = "Script not found or 404!",
        Duration = 5
    })
end
