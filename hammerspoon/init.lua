local spaces = require("hs.spaces")

local open_alacritty = function()
  local appName = "Alacritty"
  local app = hs.application.get(appName)

  if app == nil then
    hs.application.launchOrFocus(appName)
  elseif app:isFrontmost() then
    app:hide()
  else
    spaces.moveWindowToSpace(app:focusedWindow():id(), spaces.focusedSpace())
    app:focusedWindow():focus()
  end
end

hs.hotkey.bind({ "option" }, "space", nil, open_alacritty())
