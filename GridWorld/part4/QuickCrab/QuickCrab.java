package part4;

import java.util.ArrayList;

import info.gridworld.grid.Location;

public class QuickCrab extends CrabCritter {

	public ArrayList<Location> getLocationsInDirections(int[] directions) {
		
		ArrayList<Location> locations = new ArrayList<Location>();
		Location center = getLocation();
		int step = (int) (Math.random() * 2) + 1;
		
		for (int dirction : directions) {
			if (step == 1) {
				Location next = center.getAdjacentLocation(getDirection()+dirction);
				if (getGrid().isValid(next)) {
					locations.add(next);
				}
			} else {
				Location next1 = center.getAdjacentLocation(getDirection()+dirction);
				Location next2 = next1.getAdjacentLocation(getDirection()+dirction);
				if (getGrid().isValid(next2)) {
					locations.add(next2);
				} else if (getGrid().isValid(next1)) {
					locations.add(next1);
				}
			}
		}
		
		return locations;
	}
	
}
