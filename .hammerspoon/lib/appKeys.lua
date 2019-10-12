-- app hotkeys (supports fallbacks)
function appKey(modifiers, key, apps)
	hs.hotkey.bind(modifiers, key, function()
		if (type(apps) == 'string') then
			-- open specified app
			hs.application.open(apps)
		else
			-- launch first app that exists
			for _, app in ipairs(apps) do
				if (hs.application.open(app)) then
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
appKey({'ctrl', 'alt'}, 'J', 'Safari Technology Preview')
appKey({'ctrl', 'alt', 'shift'}, 'S', 'Google Chrome')
appKey({'ctrl', 'alt'}, 'H', 'Tweetbot')
appKey({'ctrl', 'alt'}, 'E', { 'Microsoft Outlook', 'Mail' })
appKey({'ctrl', 'alt'}, 'T', 'iTunes')
appKey({'ctrl', 'alt'}, 'N', 'Notes')
appKey({'ctrl', 'alt'}, 'K', 'Console')
