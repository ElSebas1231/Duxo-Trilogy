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

function noteMiss() 
	-- Si la dificultad es díficil, osea 0, pues mueres en un fallo
	-- If the difficulty is hard, in this case 0, you die if you get a miss
	if difficulty == 0 then
		setProperty('health', 0)
	end
end

local allowEndShit = false
function onEndSong()
	if not allowEndShit and isStoryMode and not seenCutscene then
	 	setProperty('inCutscene', true);
	 	startDialogue('dialogue2');
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