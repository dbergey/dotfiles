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
	hs.window.focusedWindow():moveOneScreenEast()
end)

-- move display left
hs.hotkey.bind({'ctrl', 'alt'}, 'Left', function()
  hs.window.focusedWindow():moveOneScreenWest()
end)
