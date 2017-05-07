package gridworld;

import info.gridworld.actor.Bug;
import info.gridworld.grid.Location;

public class ZBug extends Bug {
    private int steps;
    public ZBug()
    {
        steps = 0;
        setDirection(Location.EAST);
    }
    public void act()
    {
        if (canMove())
        {
            if (steps < 5) {
            	move();
            	steps++;
            	if (steps == 5) {
            		setDirection(Location.SOUTHWEST);
            	}
            } else if (steps < 10) {
            	move();
            	steps++;
            	if (steps == 10) {
            		setDirection(Location.EAST);
            	}
            }  else if (steps <15) {
            	move();
            	steps++;
            }
        }
    }
}
