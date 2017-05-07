package part4;

import java.awt.Color;
import java.util.ArrayList;

import info.gridworld.actor.Actor;
import info.gridworld.grid.Location;

public class ChameleonKid extends ChameleonCritter {

    public void processActors(ArrayList<Actor> actors)
    {
      
        ArrayList<Actor> frontOrBehind = new ArrayList<Actor>();
        for (Actor actor : actors) {
            Location other = actor.getLocation();
            Location center = getLocation();
            int direction = center.getDirectionToward(other);
            if (direction == getDirection() || direction == getDirection() + 180)
            	frontOrBehind.add(actor);        
        }
        
        if (frontOrBehind.size() > 0) {
            Actor other = actors.get((int)(Math.random() * frontOrBehind.size()));
            setColor(other.getColor());
            return;
        } else {
        	int red = (int) (getColor().getRed() * 0.9);
            int green = (int) (getColor().getGreen() * 0.9);
            int blue = (int) (getColor().getBlue() * 0.9);
            setColor(new Color(red, green, blue));
        }
    }
	
}
