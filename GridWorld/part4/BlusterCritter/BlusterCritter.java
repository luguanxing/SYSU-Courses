package part4;

import java.awt.Color;
import java.util.ArrayList;

import info.gridworld.actor.Actor;
import info.gridworld.actor.Critter;
import info.gridworld.grid.Location;

public class BlusterCritter extends Critter {

	private int courage;
	
	public BlusterCritter(int courage) {
		super();
		this.courage = courage;
	}
	
    public ArrayList<Actor> getActors() {
        ArrayList<Actor> ActorsInTwoSteps = getGrid().getNeighbors(getLocation());
        ArrayList<Location> FullArea = getGrid().getValidAdjacentLocations(getLocation());
        ArrayList<Location> FirstRingArea = getGrid().getValidAdjacentLocations(getLocation());
        FullArea.add(getLocation());
        for (Location FirstRingGrid : FirstRingArea) {
        	for (Actor ActorsInAroundFirstRingGrid: getGrid().getNeighbors(FirstRingGrid)) {
        		if (!FullArea.contains(ActorsInAroundFirstRingGrid.getLocation())) {
        			FullArea.add(ActorsInAroundFirstRingGrid.getLocation());
        			ActorsInTwoSteps.add(ActorsInAroundFirstRingGrid);
        		}
        	}
        }
        return ActorsInTwoSteps;
    }
	
    public void act() {
    	super.act();
    	System.out.println("After moved there are " + getActors().size() + " objects in two steps");
    }
    
	public void processActors(ArrayList<Actor> actors) {
        int CritterNum = 0;
        for (Actor actor : actors) {
            if (actor instanceof Critter) {
            	CritterNum++;
            }
        }
        System.out.println("ACritterNum = " + CritterNum);
		
        if (CritterNum >= courage) {
            int red = Math.min((int) (getColor().getRed() * 1.5), 255);
            int green = Math.min((int) (getColor().getGreen() * 1.5), 255);
            int blue = Math.min((int) (getColor().getBlue() * 1.5), 255);
            setColor(new Color(red, green, blue));
            System.out.println("Brighter!!!");
        } else {
            int red = (int) (getColor().getRed() * 0.9);
            int green = (int) (getColor().getGreen() * 0.9);
            int blue = (int) (getColor().getBlue() * 0.9);
            setColor(new Color(red, green, blue));	
            System.out.println("Darker!!!");
        }
	}
}
