#include <amxmodx>
#include <fakemeta>

new g_kvd

public plugin_precache()
{
	g_kvd = register_forward(FM_KeyValue, "fw_KeyValue");
}

public plugin_init()
{
	register_plugin("Crossfire Siren", "1.0.0", "Zombak");
	if(g_kvd)
	{
		unregister_forward(FM_KeyValue, g_kvd);
	}
}

public fw_KeyValue(ent, handle)
{
	if(pev_valid(ent))
	{
		new g_keyNm[32], g_keyVl[ 32 ], g_ClassNm[32];
		get_kvd(handle, KV_KeyName, g_keyNm, charsmax(g_keyNm));
		get_kvd(handle, KV_Value, g_keyVl, charsmax(g_keyVl));
		get_kvd(handle, KV_ClassName, g_ClassNm, charsmax(g_ClassNm));
		if(equal(g_keyNm, "message") && equal(g_keyVl, "ambience/siren.wav") && equal(g_ClassNm, "ambient_generic"))
		{
			set_kvd(0, KV_KeyName, g_keyNm);
			set_kvd(0, KV_Value, "ambience/warn1.wav");
			set_kvd(0, KV_fHandled, 0);
			dllfunc(DLLFunc_KeyValue, ent, 0);
			return FMRES_SUPERCEDE;
		}
		return FMRES_IGNORED;
	}
	return FMRES_IGNORED;
}
