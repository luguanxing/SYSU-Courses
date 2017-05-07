package part4;

import java.awt.Color;

import info.gridworld.actor.ActorWorld;
import info.gridworld.actor.Flower;
import info.gridworld.actor.Rock;
import info.gridworld.grid.Location;

public class RockHoundRunner {

	public static void main(String[] args) {
        ActorWorld world = new ActorWorld();
        world.add(new Location(7, 8), new Rock(Color.BLUE));
        world.add(new Location(3, 3), new Rock(Color.PINK));
        world.add(new Location(2, 8), new Rock(Color.BLUE));
        world.add(new Location(5, 5), new Rock(Color.PINK));
        world.add(new Location(1, 5), new Rock(Color.RED));
        world.add(new Location(7, 2), new Rock(Color.YELLOW));
        world.add(new Location(4, 4), new RockHound(Color.RED));
        world.show();

	}

}
