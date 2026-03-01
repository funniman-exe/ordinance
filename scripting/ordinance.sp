#include <sdkhooks>
#include <sdktools>
#include <sourcemod>
#include <submit_pawn/submit_pawn.sp>
#pragma newdecls required
#pragma semicolon 1


public Plugin myinfo =
{
	name = "ordinance",
	author = "TheRedEnemy",
	description = "",
	version = "1.0.0",
	url = "https://github.com/theredenemy/ordinance"
};


public void OnPluginStart()
{
	g_triggername = CreateConVar("pawn_trigger", "\0");
	g_autokick = CreateConVar("pawn_autokick", "0");
	g_ordserveronline = false;
	HookEvent("teamplay_round_start", Event_RoundStart, EventHookMode_Post);
	HookEvent("player_spawn", Event_PlayerSpawn, EventHookMode_Post);
	RegServerCmd("pawn_submit", pawn_submit_cmd);
	RegServerCmd("pawn_check", pawn_check_cmd);
	RegServerCmd("vul_text", display_vul_text_cmd);
	makeConfig();
	PrintToServer("Submit_Pawn Has Loaded");
}