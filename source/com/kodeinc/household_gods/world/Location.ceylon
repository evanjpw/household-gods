//void board() {}

shared interface Location {

	shared formal Boolean ok;

	shared formal Integer x;

	shared formal Integer y;

}

shared class RawLocation(x, y) satisfies Location  {
	shared actual Integer x;
	shared actual Integer y;
	
	Boolean valid => x%2 == y%2;
	shared Boolean inBounds(Bounds bounds) => valid && bounds.inBounds(x, y);
	shared actual default Boolean ok => valid;
	
	assert (valid);
}

class BoundedLocation(Integer x, Integer y, bounds)
		extends RawLocation(x, y) {
	
	shared Bounds bounds;
	
	shared actual Boolean ok => inBounds(bounds);
}

Location newLocation(Integer incx, Integer incy, Location old) {
	assert (old.ok);
	
	Integer x = old.x + incx;
	Integer y = old.y + incy;
	
	if (is BoundedLocation old) {
		value bounds = old.bounds;
		value location = BoundedLocation(bounds.normalizeX(x), bounds.normalizeY(y), bounds);
		assert (location.ok);
		return location;
	} else {
		value location = RawLocation(x, y);
		assert (location.ok);
		return location;
	}
}

shared Location north(Location old, Integer distance = 1) {
	return newLocation(0, 2 * distance, old);
}

shared Location south(Location old, Integer distance = 1) {
	return newLocation(0, -2 * distance, old);
}

shared Location east(Location old, Integer distance = 1) {
	return newLocation(distance, 0, old);
}

shared Location west(Location old, Integer distance = 1) {
	return newLocation(-distance, 0, old);
}

shared Location northeast(Location old, Integer distance = 1) {
	return newLocation(distance, distance, old);
}

shared Location northwest(Location old, Integer distance = 1) {
	return newLocation(-distance, distance, old);
}

shared Location southeast(Location old, Integer distance = 1) {
	return newLocation(distance, -distance, old);
}

shared Location southwest(Location old, Integer distance = 1) {
	return newLocation(-distance, -distance, old);
}
