local allowCountdown = false
function onStartCountdown()
	-- Block the first countdown and start a timer of 0.8 seconds to play the dialogue
	if not allowCountdown and isStoryMode and not seenCutscene then
		setProperty('inCutscene', true);
		runTimer('startDialogue', 1.5);
		allowCountdown = true;
		return Function_Stop;
	end
	return Function_Continue;
end

function onCreate()
	if isStoryMode and not seenCutscene then
		setProperty('camFollowPos.x', getProperty('boyfriend.x') - 200)
		setProperty('camFollowPos.y', getProperty('boyfriend.y') + 50)
	end
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

function onStepHit()
	if isStoryMode and not seenCutscene then
		if curStep == 1 then
			triggerEvent('Intro', 'Locochon', 'Amigo de Duxo\ny Aquino')
		end
		if curStep == 35 then
			triggerEvent('Intro2', 'Sonando:', 'YA PERO\nDe: Laleritose')
		end
	else
		if curStep == 1 then 
			triggerEvent('Intro2', 'Sonando:', 'YA PERO\nDe: Laleritose')
		end
	end
end