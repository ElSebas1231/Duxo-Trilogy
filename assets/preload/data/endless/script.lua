function onCreatePost()
	setProperty('dad.color', -12880716)
	setProperty('boyfriend.color', -12880716)
	setProperty('gf.color', -12880716)
	setProperty('iconP1.color', -12880716)
	setProperty('iconP2.color', -12880716)
	setProperty('healthBar.color', -12880716)
end

function onStepHit()
	if curStep == 890 then
		for i = 0, getProperty('opponentStrums.length')-1 do
			setPropertyFromGroup('opponentStrums', i, 'texture', 'Majin_Notes');
		end
		for i = 0, getProperty('playerStrums.length')-1 do
			setPropertyFromGroup('playerStrums', i, 'texture', 'Majin_Notes');
		end
		for i = 0, getProperty('unspawnNotes.length')-1 do
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'Majin_Notes');
		end
		for i = 0, getProperty('unspawnNotes.length')-1 do
			setPropertyFromGroup('unspawnNotes', i, 'noteSplashTexture', 'Majin_Splashes');
		end
	end
	if curStep == 901 then
		doTweenColor('timeBar', 'timeBar', '7b32a7', 0.5, 'linear'); 
		doTweenColor('timeTxt', 'timeTxt', '7b32a7', 0.5, 'linear'); 
	end
	if curStep == 902 then
		cameraFlash('hud', '031479', 0.5)
		for i = 0, getProperty('grpNoteSplashes.length')-1 do
			setPropertyFromGroup('grpNoteSplashes', i, 'offset.x', -36.5)
			setPropertyFromGroup('grpNoteSplashes', i, 'offset.y', -90)
		end
	end
end