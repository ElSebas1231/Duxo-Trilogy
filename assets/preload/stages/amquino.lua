function onCreate()
	-- background shit
	makeLuaSprite('aquino17_00', 'amquino/aquino17_00', -230, -270);
	setLuaSpriteScrollFactor('aquino17_00', 1, 1);
	scaleObject('aquino17_00', 0.8, 0.7);
	addLuaSprite('aquino17_00', false);

	makeLuaSprite('aquino17_02', 'amquino/aquino17_02', 0, 0)
	setObjectCamera('aquino17_02', 'other')
	addLuaSprite('aquino17_02')
end