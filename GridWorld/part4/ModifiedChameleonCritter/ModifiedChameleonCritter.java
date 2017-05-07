package part4;

import java.awt.Color;
import java.util.ArrayList;

import info.gridworld.actor.Actor;
import info.gridworld.actor.Critter;
import info.gridworld.grid.Location;

public class ModifiedChameleonCritter extends ChameleonCritter {
		
    public void processActors(ArrayList<Actor> actors)
    {
        int n = actors.size();
        if (n == 0) {
            int red = (int) (getColor().getRed() * 0.9);
            int green = (int) (getColor().getGreen() * 0.9);
            int blue = (int) (getColor().getBlue() * 0.9);
            setColor(new Color(red, green, blue));
            return;
        }
            
        int r = (int) (Math.random() * n);
        Actor other = actors.get(r);
        setColor(other.getColor());
    }
    
}
