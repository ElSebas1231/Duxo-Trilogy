function onEvent(eventName, value1, value2)
    if eventName == 'Missingno' then
        isDownscroll = getRandomBool(50)
        for i = 4, 7 do
            setPropertyFromGroup('strumLineNotes', i, 'downScroll', isDownscroll)
        end
        for i = 4, 7 do
            if i == 4 then
            setPropertyFromGroup('strumLineNotes',i,'x',getRandomInt(100, screenWidth / 3)- 25)
            if isDownscroll then
                setPropertyFromGroup('strumLineNotes',i,'y',getRandomInt(screenHeight / 2,screenHeight-200))
            else
                setPropertyFromGroup('strumLineNotes',i,'y',getRandomInt(100, 300))
            end
            else
                futurex = getRandomInt(getPropertyFromGroup('strumLineNotes',i - 1, 'x') + 80, getPropertyFromGroup('strumLineNotes', i - 1, 'x') + 400)
                if futurex > screenWidth - 100 then
                    futurex = screenWidth - 100
                end

                setPropertyFromGroup('strumLineNotes', i, 'x', futurex)
                setPropertyFromGroup('strumLineNotes', i, 'y', getRandomInt(getPropertyFromGroup('strumLineNotes', 4, 'y') - 100, getPropertyFromGroup('strumLineNotes', 4, 'y') + 100))
            end
        end
    end
end
