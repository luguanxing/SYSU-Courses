package gridworld;

import info.gridworld.actor.Bug;

public class DancingBug extends Bug {
	private int[] directions;
	private int steps;
	public DancingBug(String str) {
		steps = 0;
		String[] strarray = str.split(",");
		directions = new int[strarray.length];
		for (int i = 0; i < strarray.length; i++)
			directions[i] = Integer.parseInt(strarray[i]);	
	}
	public void act() {
		//turn before moving
		for (int i = 0; i < directions[steps]; i++)
			turn();
        if (canMove()) {
            move();
            steps = (steps+1)%(directions.length);
        }
	}
}
