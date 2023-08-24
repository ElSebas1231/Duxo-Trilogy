function onCreatePost()
    setProperty('introSoundsSuffix', 'nada')
end

function opponentNoteHit()
    health = getProperty('health')
    if getProperty('health') > 0.4 then
        setProperty('health', health- 0.01);
    end
end

local allowCountdown = true
function onStartCountdown()
    if allowCountdown then
        runTimer('startText', 0.1);
        allowCountdown = false
        startCountdown();
        return Function_Stop
    end
    return function_Continue
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'startText' then
		makeLuaSprite('blackscreen', 'blackscreen', 0, 0);
		setObjectCamera('blackscreen', 'hud');
		addLuaSprite('blackscreen', true);
		makeLuaSprite('circle', 'CircleMajin', 777, 0);
		setObjectCamera('circle', 'hud');
		addLuaSprite('circle', true);
		makeLuaSprite('text', 'TextMajin', -1100, 0);
		setObjectCamera('text', 'hud');
		addLuaSprite('text', true);
		runTimer('appear', 0.6, 1);
		runTimer('fadeout', 1.9, 1);
		runTimer('sonic1', 3,1);
	elseif tag == 'appear' then
		doTweenX('circletween', 'circle', 0, 0.2, 'linear');
		doTweenX('texttween', 'text', 0, 0.2, 'linear');
	elseif tag == 'fadeout' then
		doTweenAlpha('blackfade', 'blackscreen', 0, 1, 'linear');
	elseif tag == 'sonic1' then
		doTweenAlpha('circlefade', 'circle', 0, 2, 'linear');
		doTweenAlpha('textfade', 'text', 0, 2, 'linear');
		doTweenX('circletween', 'circle', 2000, 0.5, 'linear');
		doTweenX('texttween', 'text', -2000, 0.5, 'linear');
	end
end

function onStepHit()
	if curStep == 886 then
		triggerEvent('Camera Follow Pos', '600', '250')
	elseif curStep == 888 then
		makeLuaSprite('three', 'three', 250, 50)
		setObjectCamera('three','hud')
		addLuaSprite('three')
        doTweenAlpha('threefun', 'three', 0, 0.5, 'linear')
		triggerEvent('Add Camera Zoom', '', '')
	elseif curStep == 893 then
		makeLuaSprite('two', 'two', 250, 50)
		setObjectCamera('two','hud')
		addLuaSprite('two')
        doTweenAlpha('twofun', 'two', 0, 0.5, 'linear')
		triggerEvent('Add Camera Zoom', '', '')
	elseif curStep == 896 then
		makeLuaSprite('one', 'one', 250, 50)
		setObjectCamera('one','hud')
		addLuaSprite('one')
        doTweenAlpha('onefun', 'one', 0, 0.5, 'linear')
		triggerEvent('Add Camera Zoom', '', '')
	elseif curStep == 900 then
		makeLuaSprite('go', 'gofun', 250, 50)
		setObjectCamera('go','hud')
		addLuaSprite('go')
        doTweenAlpha('gofun', 'go', 0, 0.5, 'linear')
		triggerEvent('Add Camera Zoom', '', '')
	elseif curStep == 902 then
        triggerEvent('Camera Follow Pos', '', '')
        removeLuaSprite('three', true)
		removeLuaSprite('two', true)
		removeLuaSprite('one', true)
		removeLuaSprite('go', true)
	end
end