/datum/techweb_node/tailor
	id = "tailor"
	display_name = "Tailoring"
	description = "Studies into the art of modern-day clothing replication."
	prereq_ids = list("biotech")
	design_ids = list(
		"pattern_table",
		"autotailor",
	)
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 1000)
