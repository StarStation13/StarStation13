/// Random Interdyne Relic Spawner///
//Contains all Interdyne specific relics along with some choice other spawners and items

/obj/effect/spawner/random/relic/interdyne
	name = "interdyne relic spawner"
	loot = list(
		/obj/item/sequence_scanner/interdyne = 10,
		/obj/effect/spawner/random/medical/surgery_tool_alien = 1,
		/obj/effect/spawner/random/exotic/syndie = 10,
		/obj/effect/spawner/random/exotic/antag_gear_weak = 2,
		/obj/item/aicard/interdyne = 1,
		/obj/item/construction/rcd/combat = 2,
		/obj/item/radio/headset/interdyne = 5
	)
