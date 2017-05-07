import info.gridworld.actor.ActorWorld;
import info.gridworld.grid.Location;
import info.gridworld.actor.Flower; 
import info.gridworld.actor.Rock; 
import info.gridworld.grid.Grid; 
import java.awt.Color;

public final class JumperRunner {
    public static void main(String[] args) {
        ActorWorld world = new ActorWorld();
        Jumper jumper = new Jumper();
        Flower flower = new Flower();
        Rock rock = new Rock();
        world.add(new Location(1, 6), rock);
        world.add(new Location(1, 4), flower);
        world.add(new Location(3, 4), jumper);
        world.show();
    }
}
