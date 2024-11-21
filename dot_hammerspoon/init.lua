local module = {}
module.lastSpace = nil

hs.hotkey.bind(
    {"option"},
    "space",
    function()
        local appName = "WezTerm"
        local activeSpace = hs.spaces.focusedSpace()
        
        local app =  hs.appfinder.appFromName(appName)
        if app == nil then
            hs.application.launchOrFocus(appName)
        elseif  app:isFrontmost() then
            local nowSpace = hs.spaces.activeSpaceOnScreen(hs.screen.primaryScreen())             
            app:hide()
            if nowSpace ~= module.lastSpace then
                hs.spaces.gotoSpace(module.lastSpace)
            end
        else
           module.lastSpace = hs.spaces.activeSpaceOnScreen(hs.screen.primaryScreen())             
           app:unhide()
           app:activate()
        end


    end
)
