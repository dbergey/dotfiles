-- wraparound replacement
log = hs.logger.new('wraparound', 'debug');

hs.screen.strictScreenInDirection = true
mouseTap = hs.eventtap.new({ hs.eventtap.event.types.mouseMoved }, function()
    local mouse = hs.mouse.getAbsolutePosition()
    local screen = hs.mouse.getCurrentScreen()

    -- if we hit the right side
    if mouse.x > ((screen:fullFrame()).w - 1) and screen:toEast() == nil then
        log.d('wrapping from', mouse.x, 'on screen', screen:name(), 'around to', farWestScreen():fullFrame().w, 'of', farWestScreen():name())

        hs.mouse.setAbsolutePosition({
            x = farWestScreen():fullFrame().x + 1,
            y = mouse.y
        })
        
    -- if we hit the left side
    elseif mouse.x < ((screen:fullFrame()).x + 1) and screen:toWest() == nil then
        log.d('wrapping from', mouse.x, 'on screen', screen:name(), 'around to', farEastScreen():fullFrame().w, 'of', farEastScreen():name())

		hs.mouse.setAbsolutePosition({
            x = farEastScreen():fullFrame().w - 1,
            y = mouse.y
        })
	end
end)

function farEastScreen()
    local screen = hs.mouse.getCurrentScreen()
    local current = screen

    while current:toEast() ~= nil do
        current = current:toEast()
    end

    return current
end

function farWestScreen()
    local screen = hs.mouse.getCurrentScreen()
    local current = screen

    while current:toWest() ~= nil do
        current = current:toWest()
    end

    return current
end

mouseTap:start()
