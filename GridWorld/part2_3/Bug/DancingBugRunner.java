package gridworld;

import java.awt.Color;

import info.gridworld.actor.*;
import info.gridworld.grid.Location;

public class DancingBugRunner{
	public static void main(String[] args) {
        ActorWorld world = new ActorWorld();
        String str = new String("0,0,2,0,0,4,0,0,6,0,0,6");
        DancingBug mybug = new DancingBug(str);
        mybug.setColor(Color.blue);
        world.add(new Location(3, 4), mybug);
        world.show();
	}
}
