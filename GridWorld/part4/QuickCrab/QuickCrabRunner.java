package part4;

import java.awt.Color;

import info.gridworld.actor.ActorWorld;
import info.gridworld.actor.Flower;
import info.gridworld.actor.Rock;
import info.gridworld.grid.Location;

public class QuickCrabRunner {

	public static void main(String[] args) {
        ActorWorld world = new ActorWorld();
        
        world.add(new Location(4, 4), new QuickCrab());
        world.add(new Location(4, 3), new Rock(Color.PINK));
        world.add(new Location(4, 7), new Rock(Color.PINK));
        world.add(new Location(5, 4), new Rock(Color.PINK));
        world.add(new Location(2, 4), new Rock(Color.PINK));
        world.add(new Location(8, 4), new Rock(Color.PINK));           
        world.add(new Location(5, 5), new Rock(Color.PINK));
        world.add(new Location(3, 5), new Rock(Color.PINK));
        world.add(new Location(8, 5), new Rock(Color.PINK));  
        world.add(new Location(2, 6), new Rock(Color.PINK));
        world.add(new Location(8, 6), new Rock(Color.PINK));           
        world.add(new Location(5, 6), new Rock(Color.PINK));
        world.show();

	}

}
