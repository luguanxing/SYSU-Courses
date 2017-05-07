package gridworld;

import info.gridworld.actor.ActorWorld;
import info.gridworld.actor.Bug;
import info.gridworld.grid.Location;

public class BugRunner {

	public static void main(String[] args) {
		ActorWorld world = new ActorWorld();
		
		Bug bug = new Bug();
		world.add(new Location(2, 4), bug);
		
		world.show();
	}

}
