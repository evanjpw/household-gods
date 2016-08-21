import com.kodeinc.household_gods.things {
	Thing
}
shared abstract class Terrain(Character glyph, occupiable = true, mutable = false)
		of ice_wall | rock | dirt | water | grass | arable_land | plowed_land | stone_floor | ice extends Thing(glyph) {
	shared Boolean occupiable;
	shared Boolean mutable;
}

shared object ice_wall extends Terrain('\{#00A7}', false, false) {}
shared object rock extends Terrain('@', false, true) {}
shared object dirt extends Terrain('.') {}
shared object water extends Terrain('~') {}
shared object grass extends Terrain(',') {}
shared object arable_land extends Terrain('\{#00B7}', true, true) {}
shared object plowed_land extends Terrain('\{#00A6}', true, true) {}
shared object stone_floor extends Terrain('\{#00BB}') {}
shared object ice extends Terrain('\{#00BA}') {}
