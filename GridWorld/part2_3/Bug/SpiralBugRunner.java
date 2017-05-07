package gridworld;

import info.gridworld.actor.Actor;
import info.gridworld.actor.ActorWorld;
import info.gridworld.grid.Location;
import info.gridworld.grid.UnboundedGrid;

import java.awt.Color;

public class SpiralBugRunner {
    public static void main(String[] args)
    {
        ActorWorld world = new ActorWorld(new UnboundedGrid<Actor>());
        SpiralBug mybug = new SpiralBug(2);
        mybug.setColor(Color.blue);
        world.add(new Location(5, 2), mybug);
        world.show();
    }
}