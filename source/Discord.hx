package;

import Sys.sleep;
import discord_rpc.DiscordRpc;
import lime.app.Application;

#if LUA_ALLOWED
import llua.Lua;
import llua.State;
#end

using StringTools;

class DiscordClient
{
	public static var isInitialized:Bool = false;
	public function new()
	{
		trace("Cliente de Discord iniciando...");
		DiscordRpc.start({
			clientID: "1053303809394360461",
			onReady: onReady,
			onError: onError,
			onDisconnected: onDisconnected
		});
		trace("Cliente de Discord iniciado.");

		while (true)
		{
			DiscordRpc.process();
			sleep(2);
			//trace("Discord Client Update");
		}
	}
	
	public static function shutdown()
	{
		DiscordRpc.shutdown();
	}
		
	public static function start()
	{
		if (ClientPrefs.discordRPC){
			if (!isInitialized){
				initialize();
				Application.current.window.onClose.add(function() {
					shutdown();
				});
			}
		}
	}
	
	static function onReady()
	{
		if(isInitialized && ClientPrefs.discordRPC){
			DiscordRpc.presence({
				details: "Cargando...",
				state: null,
				largeImageKey: 'icon',
				largeImageText: "FNF X DUXO: Complete Trilogy"
			});
			Application.current.window.onClose.add(function() {
				shutdown();
			});
		}
	}

	static function onError(_code:Int, _message:String)
	{
		trace('Error! $_code : $_message');
	}

	static function onDisconnected(_code:Int, _message:String)
	{
		trace('Desconectado! $_code : $_message');
	}

	public static function initialize()
	{
		var DiscordDaemon = sys.thread.Thread.create(() ->
		{
			new DiscordClient();
		});
		trace("Cliente de Discord iniciado");
		isInitialized = true;
	}

	public static function changePresence(details:String, state:Null<String>, ?smallImageKey : String, ?hasStartTimestamp : Bool, ?endTimestamp: Float, ?stagePortrait : String)
	{
		var startTimestamp:Float = if(hasStartTimestamp) Date.now().getTime() else 0;

		if (endTimestamp > 0)
		{
			endTimestamp = startTimestamp + endTimestamp;
		}

		if(isInitialized && ClientPrefs.discordRPC){
			DiscordRpc.presence({
				details: details,
				state: state,
				largeImageKey: stagePortrait, //used to change the RPC Image
				largeImageText: "Versión de Psych Engine: " + MainMenuState.psychEngineVersion,
				smallImageKey : smallImageKey,
				// Obtained times are in milliseconds so they are divided so Discord can use it
				startTimestamp : Std.int(startTimestamp / 1000),
            	endTimestamp : Std.int(endTimestamp / 1000)	
			});
		}
		//trace('RPC de Discord Actualizada. Argumentos: $details, $state, $smallImageKey, $hasStartTimestamp, $endTimestamp');
	}

	#if LUA_ALLOWED
	public static function addLuaCallbacks(lua:State) {
		Lua_helper.add_callback(lua, "changePresence", function(details:String, state:Null<String>, ?smallImageKey:String, ?hasStartTimestamp:Bool, ?endTimestamp:Float) {
			changePresence(details, state, smallImageKey, hasStartTimestamp, endTimestamp);
		});
	}
	#end
}
