function onCreate()
	-- background shit
	makeLuaSprite('2', 'side/2', -900, -910);
	setLuaSpriteScrollFactor('2', 1, 1);
	scaleObject('2', 2.1, 2);
	addLuaSprite('2', false);

	makeLuaSprite('3', 'side/3', -900, -910);
	setLuaSpriteScrollFactor('3', 1.2, 1.2);
	scaleObject('3', 2.1, 2);
	addLuaSprite('3', false);

	makeLuaSprite('4', 'side/4', -900, -110);
	setLuaSpriteScrollFactor('4', 0.9, 0.9);
	scaleObject('4', 2.1, 2);
	addLuaSprite('4', false);

	makeLuaSprite('5', 'side/5', -900, -910);
	setLuaSpriteScrollFactor('5', 1, 1);
	scaleObject('5', 2.1, 2);
	addLuaSprite('5', false);

	makeLuaSprite('6', 'side/6', -900, -110);
	setLuaSpriteScrollFactor('6', 1.1, 1.1);
	scaleObject('6', 2.1, 2);
	addLuaSprite('6', false);

	makeAnimatedLuaSprite('ParticulasNoHayAireEnElVacio', 'side/ParticulasNoHayAireEnElVacio', -800, -300);
	scaleObject('ParticulasNoHayAireEnElVacio', 1.9, 1.4);
	addLuaSprite('ParticulasNoHayAireEnElVacio', true);
	addAnimationByPrefix('ParticulasNoHayAireEnElVacio', 'idle', 'Callaste Creisi', 24, true);
end

function onCreatePost()
	setProperty('2.velocity.y', -5)
	setProperty('5.velocity.y', -5)
	setProperty('6.velocity.y', -5)
	setProperty('ParticulasNoHayAireEnElVacio.velocity.y', -2.5)

	shaderName = "chromaticAbberation"

	if shadersEnabled then
    	initLuaShader(shaderName)

    	makeLuaSprite("temporaryShader")
    	makeGraphic("temporaryShader", screenWidth, screenHeight)
    	setSpriteShader("temporaryShader", shaderName)

    	addHaxeLibrary("ShaderFilter", "openfl.filters")
    	runHaxeCode([[
        	game.camHUD.setFilters([new ShaderFilter(game.getLuaObject("temporaryShader").shader)]);
        	game.camGame.setFilters([new ShaderFilter(game.getLuaObject("temporaryShader").shader)]);
        	game.camOther.setFilters([new ShaderFilter(game.getLuaObject("temporaryShader").shader)]);
    	]])

    	setShaderInt("temporaryShader", "amount", 3)
	end
end

function onUpdate()
	songPos = getSongPosition()
	currentBeat = (songPos/1000)*(curBpm/60)
	
    doTweenY('dadwoo', 'dad', 50 - (math.cos((currentBeat) + 0) * -50), 1)
    doTweenY('owou', 'boyfriend', 50 - (math.cos((currentBeat) + 0) * 50), 1)
	doTweenX('dadwa', 'dad', 50 - (math.cos((currentBeat) + 0) * -50), 1)
	doTweenX('dada', 'boyfriend', 600 - (math.cos((currentBeat) + 0) * 50), 1)

	if not mustHitSection then
        cameraSetTarget('dad')
	else
		cameraSetTarget('boyfriend')
	end
end