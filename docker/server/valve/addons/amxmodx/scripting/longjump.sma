#include <amxmodx>
#include <fakemeta>
#include <hamsandwich>
#include <fun>

#define TASK_ID_CHECK 20000

public plugin_init()
{
	register_plugin("Longjump Spawn", "1.0.0", "Zombak");
	RegisterHam(Ham_Spawn,  "player", "OnPlayerSpawn", 1);
}

public plugin_precache()
{
	register_forward(FM_Spawn, "FM_Spawn_Forward", 0);
	return PLUGIN_CONTINUE;
}

public client_putinserver(id)
{
	GiveItem(id, "item_longjump");
}

public OnPlayerSpawn(id)
{
	GiveItem(id, "item_longjump");
}

public FM_Spawn_Forward(ent)
{
	if(pev_valid(ent))
	{
		set_task(0.1, "FM_Spawn_Forward_Task", ent + TASK_ID_CHECK, "", 0, "", 0);
		return FMRES_HANDLED;
	}

	return FMRES_IGNORED;
}

public FM_Spawn_Forward_Task(ent)
{
	ent -= TASK_ID_CHECK;

	if(!pev_valid(ent))
	{
		return PLUGIN_CONTINUE;
	}

	new class[32], model[32];
	pev(ent, pev_classname, class, 32);
	pev(ent, pev_model, model, 32);

	// For debug
	// server_print("FM_Spawn_Forward_Task: (%s) - (%s)", class, model);

	// Remove all long jumps
	if(equal(class, "item_longjump", 0) && equal(model, "models/w_longjump.mdl", 0))
	{
		RemoveEntity(ent);
	}

	return PLUGIN_CONTINUE;
}

GiveItem(id, const item[])
{
	if(is_user_alive(id))
	{
		give_item(id, item);
	}
}

RemoveEntity(ent)
{
	set_pev(ent, pev_rendermode, kRenderTransAlpha);
	set_pev(ent, pev_renderamt, 0);
	set_pev(ent, pev_solid, SOLID_NOT);
	return 1;
}
