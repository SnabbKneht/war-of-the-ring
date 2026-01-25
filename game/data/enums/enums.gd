class_name Enums
extends RefCounted


enum Nation {
	DWARF,
	ELF,
	NORTH,
	ROHAN,
	GONDOR,
	ISENGARD,
	SAURON,
	EASTERLING,
	NONE
}


enum Side {
	NONE,
	FREE_PEOPLES,
	SHADOW
}


enum RegionStructure {
	NONE,
	TOWN,
	CITY,
	STRONGHOLD,
	FORTIFICATION
}


static func opposing_side(side: Enums.Side) -> Enums.Side:
	assert(side != Side.NONE, "Cannot get opposing side of side NONE.")
	match side:
		Side.FREE_PEOPLES:
			return Side.SHADOW
		Side.SHADOW:
			return Side.FREE_PEOPLES
		_:
			return Side.NONE
