-- auto reload
hs.loadSpoon('ReloadConfiguration')
spoon.ReloadConfiguration:start()

-- clipboard history
hs.loadSpoon('ClipboardTool')
spoon.ClipboardTool:start()
-- ClipboardTool.paste_on_select = true
-- ClipboardTool.max_size = true
hs.hotkey.bind({ 'cmd', 'alt'}, 'V', function()
  spoon.ClipboardTool:showClipboard()
end)

-- open tab in new window
hs.hotkey.bind({ 'cmd', 'alt', 'shift'}, 'K', function()
  local safari = hs.appfinder.appFromName('Safari')
  safari:selectMenuItem('Move Tab to New Window')
end)

require('lib/appKeys')
require('lib/winKeys')