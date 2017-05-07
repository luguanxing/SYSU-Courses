package part4;

import java.awt.Color;

import info.gridworld.actor.ActorWorld;
import info.gridworld.actor.Flower;
import info.gridworld.actor.Rock;
import info.gridworld.grid.Location;

public class ChameleonKidRunner {

	public static void main(String[] args) {
		// TODO 自动生成的方法存根
        ActorWorld world = new ActorWorld();
        ChameleonKid ck1 = new ChameleonKid();
        ChameleonKid ck2 = new ChameleonKid();
        ck1.setColor(Color.YELLOW);
        ck2.setColor(Color.GREEN);
        world.add(new Location(4, 4), ck1);
        world.add(new Location(6, 8), ck2);
        world.show();
	}

}
