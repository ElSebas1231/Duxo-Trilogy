function onEvent(n, v1, v2)
    if n == 'HUD & Camera Fade' then
        doTweenAlpha('hudFade', 'camHUD', 0, tonumber(v1), 'smootherStepOut')
        doTweenAlpha('gameFade', 'camGame', 0, tonumber(v1), 'smootherStepOut')
    end
end