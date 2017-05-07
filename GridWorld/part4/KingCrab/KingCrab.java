package part4;

import info.gridworld.actor.Actor;
import info.gridworld.grid.Location;

public class KingCrab extends CrabCritter {
	public void makeMove(Location location) {
		super.makeMove(location);
		for (Actor actor: getActors()) {
			Location actorLocation = actor.getLocation();
			int actorNewDirection = location.getDirectionToward(actorLocation);
			Location actorNewLocation = actorLocation.getAdjacentLocation(actorNewDirection);
			
			if (getGrid().isValid(actorNewLocation) && getGrid().get(actorNewLocation)==null) {
				actor.moveTo(actorNewLocation);
			} else {
				actor.removeSelfFromGrid();
			}
		}
	}
}
