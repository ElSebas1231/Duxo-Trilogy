local allowCountdown = false
function onStartCountdown()
	-- Block the first countdown and start a timer of 0.8 seconds to play the dialogue
	if not allowCountdown and isStoryMode and not seenCutscene then
		setProperty('inCutscene', true);
		runTimer('startDialogue', 0.8);
		allowCountdown = true;
		return Function_Stop;
	end
	return Function_Continue;
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'startDialogue' then -- Timer completed, play dialogue
		startDialogue('dialogue');
	end
end

-- Dialogue (When a dialogue is finished, it calls startCountdown again)
function onNextDialogue(count)
	-- triggered when the next dialogue line starts, 'line' starts with 1
end

function onSkipDialogue(count)
	-- triggered when you press Enter and skip a dialogue line that was still being typed, dialogue line starts with 1
end

local allowEndShit = false

function onEndSong()
	if not allowEndShit and isStoryMode and not seenCutscene then
	 	setProperty('inCutscene', true);
	 	startDialogue('dialogue2');
	 	setProperty('camHUD.alpha', 1);
		setProperty('strumLineNotes.visible', false)
		removeLuaText('score', true)
		removeLuaText('acc', true)
		setProperty('healthBarBG.visible', false)
		setProperty('healthBar.visible', false)
		setProperty('iconP1.visible', false)
		setProperty('iconP2.visible', false)
	 	allowEndShit = true;
	 	return Function_Stop;
	end
	return Function_Continue;
end

function onStepHit()
	if isStoryMode and not seenCutscene then
		if curStep == 65 then
			triggerEvent('Intro2', 'Sonando:', 'Empty Hearth\nDe: Kimakurus Music')
		end
	end
	if curStep > 0 and curStep < 20 and mousePressed('middle') then
		loadSong('esotilin')
	end
	if curStep == 2072 then
        doTweenAlpha('tx','camHUD', 0, 0.2, 'linear')
	end
end

function onSongStart()
	if isStoryMode and not seenCutscene then
		triggerEvent('Intro', 'AQUINOby02', 'A.K.A Aquino')
	else
		triggerEvent('Intro2', 'Sonando:', 'Empty Hearth\nDe: Kimakurus Music')
	end
    if flashingLights then
        cameraFlash('hud', 'ffffff', 0.5)
	end
end