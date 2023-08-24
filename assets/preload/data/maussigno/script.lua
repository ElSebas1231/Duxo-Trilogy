function onCreate()
    setProperty('camHUD.visible',false)
    addCharacterToList('missingno')
    addCharacterToList('bf-pixel2')
    setProperty('skipCountdown', true)

    opponentStrums = getPropertyFromClass('ClientPrefs', 'opponentStrums')

	if opponentStrums then
		setPropertyFromClass('ClientPrefs', 'opponentStrums', false)
	end
end

function onCreatePost()
    triggerEvent('Camera Follow Pos', '500', '470')
end

function onDestroy()
    setPropertyFromClass('ClientPrefs', 'opponentStrums', opponentStrums)
end

function onStepHit()
    if curStep == 240 then
        playSound('missingnospawn', 1)
	    triggerEvent('Play Animation', 'intro', 'dad')
        setHealthBarColors('807098', '7300ff')
	end
    if curStep >= 242 then
        setProperty('iconP2.alpha',1)
        setProperty('dad.alpha', 1)
        setProperty('camHUD.visible',true)
    end
    if curStep >= 251 then
		triggerEvent('Camera Follow Pos', '', '')
    end
end