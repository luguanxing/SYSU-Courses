package gridworld;

import java.awt.Color;

import info.gridworld.actor.ActorWorld;
import info.gridworld.grid.Location;

public class ZBugRunner {
	public static void main(String[] args) {
        ActorWorld world = new ActorWorld();
        ZBug mybug = new ZBug();
        mybug.setColor(Color.blue);
        world.add(new Location(2, 2), mybug);
        world.show();
    }
}
