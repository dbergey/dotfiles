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

-- app hotkeys (supports fallbacks)
function appKey(modifiers, key, apps)
	hs.hotkey.bind(modifiers, key, function()
		if (type(apps) == 'string') then
			-- open specified app
			hs.application.launchOrFocus(apps)
		else
			-- launch first app that exists
			for _, app in ipairs(apps) do
				if (hs.application.find(app)) then
					hs.application.launchOrFocus(app)
					break
				end
			end
		end
  end)
end

appKey({'ctrl', 'alt'}, 'B', 'Visual Studio Code')
appKey({'ctrl', 'alt'}, 'A', 'Messages')
appKey({'ctrl', 'alt', 'shift'}, 'A', 'Slack')
appKey({'ctrl', 'alt'}, 'P', 'System Preferences')
appKey({'ctrl', 'alt'}, 'D', 'Discord')
appKey({'ctrl', 'alt'}, 'F', 'Finder')
appKey({'ctrl', 'alt'}, 'V', 'iTerm')
appKey({'ctrl', 'alt'}, 'S', 'Safari')
appKey({'ctrl', 'alt'}, 'J', 'Safari Preview')
appKey({'ctrl', 'alt', 'shift'}, 'S', 'Google Chrome')
appKey({'ctrl', 'alt'}, 'H', 'Tweetbot')
appKey({'ctrl', 'alt'}, 'E', { 'Microsoft Outlook', 'Mail' })
appKey({'ctrl', 'alt'}, 'T', 'iTunes')
appKey({'ctrl', 'alt'}, 'N', 'Notes')
appKey({'ctrl', 'alt'}, 'K', 'Console')

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
	hs.window.focusedWindow().moveOneScreenEast()
end)

-- move display left
hs.hotkey.bind({'ctrl', 'alt'}, 'Left', function()
  hs.window.focusedWindow().moveOneScreenWest()
end)
