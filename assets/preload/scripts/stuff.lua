cosasxd = {'amquinom', 'amquinom2', 'amquinom3',
'laucorrupted', 'pico','creisi_andreh',
'creisi-corrupted', 'natalan_corruptado'}

function onCreate()
    if string.lower(songName) == 'endless' or string.lower(songName) == 'triple trouble' then
        setProperty('ratingsData[0].image', 'sick-exe')
        setProperty('ratingsData[1].image', 'good-exe')
        setProperty('ratingsData[2].image', 'bad-exe')
        setProperty('ratingsData[3].image', 'shit-exe')
    end
end

function onCreatePost()
----------------------- [[Custom NoteSkin in characters]] ---------------------------------------------
    for s = 0, #cosasxd do
        if dadName == cosasxd[s] then
            for i = 0, getProperty('opponentStrums.length')-1 do
                setPropertyFromGroup('opponentStrums', i, 'texture', 'Corrupnote_assets');
            end
            for i = 0, getProperty('unspawnNotes.length')-1 do
                if not getPropertyFromGroup('unspawnNotes', i, 'mustPress')then
                    setPropertyFromGroup('unspawnNotes', i, 'texture', 'Corrupnote_assets');
                    setPropertyFromGroup('unspawnNotes', i, 'noteSplashTexture', 'CorrupnoteSplashes');
                end
            end
        end
        if dadName == 'aquinoOP' and string.lower(songName) == 'no more webadas' then
            for i = 0, getProperty('opponentStrums.length')-1 do
                setPropertyFromGroup('opponentStrums', i, 'texture', 'Corrupnote_assets');
            end
            for i = 0, getProperty('unspawnNotes.length')-1 do
                if not getPropertyFromGroup('unspawnNotes', i, 'mustPress') then
                    setPropertyFromGroup('unspawnNotes', i, 'texture', 'Corrupnote_assets');
                    setPropertyFromGroup('unspawnNotes', i, 'noteSplashTexture', 'CorrupnoteSplashes');
                end
            end
        end
    end
-------------------------------------------------------------------------------------------------------
end

--This is just get things work properly, don't get mad pls.
function onCountdownTick(counter)
	if boyfriendName == 'duxo_car' and songName == 'Suffer' then
		if counter == 2 then
			playSound('silbato', 1)
		end
		if counter == 3 then
			triggerEvent('Play Animation', 'dodges', 'bf')
		end
	end
    if counter == 0 then
        if isStoryMode and not seenCutscene then
            for s = 0, #cosasxd do
                if dadName == cosasxd[s] then
                    for i = 0, getProperty('opponentStrums.length')-1 do
                        setPropertyFromGroup('opponentStrums', i, 'texture', 'Corrupnote_assets');
                    end
                end
            end
            if dadName == 'aquinoOP' and string.lower(songName) == 'no more webadas' then
                for i = 0, getProperty('opponentStrums.length')-1 do
                    setPropertyFromGroup('opponentStrums', i, 'texture', 'Corrupnote_assets');
                end
            end
        end
    end
end

function onUpdatePost()
    if string.lower(songName) == 'triple trouble' then
		for i = 0, getProperty('grpNoteSplashes.length')-1 do
			setPropertyFromGroup('grpNoteSplashes', i, 'offset.x', -36.5)
			setPropertyFromGroup('grpNoteSplashes', i, 'offset.y', -90)
		end
	end
end

function onGameOverStart()
    if boyfriendName == 'bf-aquino' then
        setProperty('camFollow.x', getProperty('boyfriend.x') + 200)
        setProperty('camFollow.y', getProperty('boyfriend.y') + 200)
    end
end