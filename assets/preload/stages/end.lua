function onCreate()
	-- background shit
	makeLuaSprite('aquino17_00', 'end/aquino17_01', -230, -50);
	scaleObject('aquino17_00', 0.8, 0.7);
	addLuaSprite('aquino17_00', false);

	makeLuaSprite('aquino17_02', 'end/aquino17_02', 0, 0)
	setObjectCamera('aquino17_02', 'other')
	addLuaSprite('aquino17_02')
end

function opponentNoteHit()
    health = getProperty('health')
    if getProperty('health') > 0.4 then
        setProperty('health', health- 0.01);
    end
end