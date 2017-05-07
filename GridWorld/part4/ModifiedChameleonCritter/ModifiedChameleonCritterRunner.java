package part4;

import java.awt.Color;

import info.gridworld.actor.ActorWorld;
import info.gridworld.actor.Flower;
import info.gridworld.actor.Rock;
import info.gridworld.grid.Location;


public class ModifiedChameleonCritterRunner {

	public static void main(String[] args) {
        ActorWorld world = new ActorWorld();
        Rock rock1 = new Rock();
        Rock rock2 = new Rock();
        rock1.setColor(Color.RED);
        rock2.setColor(Color.YELLOW);
        world.add(new Location(3, 2), rock1);
        world.add(new Location(5, 7), rock2);
        world.add(new Location(3, 3), new ModifiedChameleonCritter());
        world.add(new Location(5, 8), new ModifiedChameleonCritter());
        world.show();
	}

}
