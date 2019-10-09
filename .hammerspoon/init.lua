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
  -- hs.application.launchOrFocus('Safari')
  local safari = hs.appfinder.appFromName('Safari')
  safari:selectMenuItem('Move Tab to New Window')
end)

-- app hotkeys
function appKey(modifiers, key, app)
  hs.hotkey.bind(modifiers, key, function()
    hs.application.launchOrFocus(app)
  end)
end


appKey({'ctrl', 'alt'}, 'B', 'Visual Studio Code')
appKey({'ctrl', 'alt'}, 'A', 'Messages')
appKey({'ctrl', 'alt'}, 'P', 'System Preferences')
appKey({'ctrl', 'alt'}, 'D', 'Discord')
appKey({'ctrl', 'alt'}, 'F', 'Finder')
appKey({'ctrl', 'alt'}, 'V', 'iTerm')
appKey({'ctrl', 'alt'}, 'S', 'Safari')
appKey({'ctrl', 'alt', 'shift'}, 'S', 'Google Chrome')
appKey({'ctrl', 'alt'}, 'H', 'Tweetbot')
appKey({'ctrl', 'alt'}, 'E', 'Mail')
appKey({'ctrl', 'alt'}, 'T', 'iTunes')
appKey({'ctrl', 'alt'}, 'N', 'Notes')

-- moom substitute
hs.window.animationDuration = 0
hs.grid.setMargins({20, 20})
hs.grid.setGrid('3x5')

function winKey(modifiers, key, cell)
  hs.hotkey.bind(modifiers, key, function()
    hs.grid.set(hs.window.focusedWindow(), cell)
  end)
end

winKey({'cmd', 'alt', 'ctrl'}, 'M', '0,0, 3x5');
winKey({'cmd', 'alt', 'ctrl'}, 'Left', '0,0, 1x5');
winKey({'cmd', 'alt', 'ctrl'}, 'Right', '1,0, 2x5');
winKey({'cmd', 'alt', 'ctrl'}, 'C', '1,0, 1x5');
winKey({'cmd', 'alt', 'shift'}, 'C', '2,0, 1x5');
winKey({'shift', 'alt', 'ctrl'}, 'Left', '0,0, 1x3');
winKey({'shift', 'alt', 'ctrl'}, 'Down', '0,3, 1x2');
winKey({'shift', 'alt', 'ctrl'}, 'Right', '1,3, 3x2');
winKey({'shift', 'alt', 'ctrl'}, 'Up', '1,0, 3x3');

-- move display right
hs.hotkey.bind({'ctrl', 'alt'}, 'Right', function()
	local win = hs.window.focusedWindow();
  local cell = hs.grid.getCell(win)
  local toScreen = hs.screen.mainScreen().toEast()
  
	if not toScreen then
	  hs.grid.set(win, cell, toScreen)
	end

end)

-- move display left
hs.hotkey.bind({'ctrl', 'alt'}, 'Left', function()
  local win = hs.window.focusedWindow();
  local cell = hs.grid.getCell(win)
  local toScreen = hs.screen.mainScreen().toWest()

  if not toScreen then
    hs.grid.set(win, cell, toScreen)
  end
end)