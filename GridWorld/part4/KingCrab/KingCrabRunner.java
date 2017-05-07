package part4;

import java.awt.Color;

import info.gridworld.actor.ActorWorld;
import info.gridworld.actor.Rock;
import info.gridworld.grid.Location;

public class KingCrabRunner {

	public static void main(String[] args) {
        ActorWorld world = new ActorWorld();
        
        KingCrab kc = new KingCrab();
        kc.setColor(Color.BLUE);
        world.add(new Location(5, 5), kc);
        
        for (int i = 2; i < 9; i++) {
        	world.add(new Location(3, i), new Rock());
        	world.add(new Location(7, i), new Rock());
        }
        
        for (int i = 3; i < 7; i++) {
        	world.add(new Location(i, 2), new Rock());
        	world.add(new Location(i, 8), new Rock());
        }
        
        world.add(new Location(4, 7), new CrabCritter());
        world.add(new Location(4, 5), new CrabCritter());
        world.add(new Location(4, 3), new CrabCritter());
        world.add(new Location(6, 7), new CrabCritter());
        world.add(new Location(6, 3), new CrabCritter());
        world.show();
	}

}
