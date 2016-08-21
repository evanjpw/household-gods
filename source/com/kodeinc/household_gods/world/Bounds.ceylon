shared interface Bounds {

	shared formal Boolean inBounds(Integer x, Integer y);

	shared formal Integer normalizeX(Integer x);

	shared formal Integer normalizeY(Integer y);

}

shared class RectangularBounds(top, left, bottom, right) satisfies Bounds  {
	Integer top;
	Integer left;
	Integer bottom;
	Integer right;
	
	shared actual Boolean inBounds(Integer x, Integer y) {
		return x>=left && x<right &&
				y>=bottom && y<top;
	}
	
	shared actual Integer normalizeX(Integer x) {
		return if (x >= left) then (if (x < right) then x else right - 1) else left;
	}
	
	shared actual Integer normalizeY(Integer y) {
		return if (y >= bottom) then (if (y < top) then y else top - 1) else bottom;
	}
}