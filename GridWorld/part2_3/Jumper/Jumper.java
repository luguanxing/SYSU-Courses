import info.gridworld.actor.Actor;  
import info.gridworld.grid.Grid;
import info.gridworld.grid.Location;
import java.awt.Color;

public class Jumper extends Actor {
	//Init
    public Jumper() {
        setColor(Color.blue);
    }
    public Jumper(Color color) {
        setColor(color);
    }
    
    //Action Methods
    public boolean isValid(Location p) {
        Grid<Actor> grid = getGrid();
        if (grid == null || !grid.isValid(p))
            return false;
        Actor checkitem = grid.get(p);
        if (checkitem != null)
        	return false;
        return true;
    }
    public boolean canMove() {
        Location here = getLocation();
        Location next1 = here.getAdjacentLocation(getDirection());
        Location next2 = next1.getAdjacentLocation(getDirection());
        return isValid(next2);
    }
    public void move() {
        Location here = getLocation();
        Location next1 = here.getAdjacentLocation(getDirection());
        Location next2 = next1.getAdjacentLocation(getDirection());
        if (isValid(next2)) {
        	moveTo(next2);
        }
    }
    public void turn() {
    	setDirection(getDirection()+Location.HALF_RIGHT);
    }
    public void act() {
    	if (canMove())
    		move();
    	else
    		turn();
    }
}

