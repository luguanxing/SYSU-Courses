package part5;
import info.gridworld.actor.Actor;
import info.gridworld.actor.ActorWorld;
import info.gridworld.grid.Location;
import info.gridworld.actor.Critter;
import info.gridworld.actor.Bug;
import info.gridworld.actor.Rock;
import info.gridworld.actor.Flower;
/**
* This class runs a world with additional grid choices.
*/

public class MyGridRunner
{
  public static void main(String[] args)
  {
    //ActorWorld world = new ActorWorld(new UnboundedGrid2<Actor>());
    //ActorWorld world = new ActorWorld(new SparseBoundedGrid<Actor>(5, 5));
    //ActorWorld world = new ActorWorld(new SparseBoundedGrid2<Actor>(8, 8));
	ActorWorld world = new ActorWorld(new SparseBoundedGrid3<Actor>(10, 10));
    //ActorWorld world = new ActorWorld();
    world.addGridClass("SparseBoundedGrid");
    world.addGridClass("SparseBoundedGrid2");
    world.addGridClass("UnboundedGrid2");
    world.add(new Location(4, 4), new Bug());
    world.add(new Location(2, 2), new Bug());
    world.add(new Location(3, 2), new Bug());
    world.show();
  }
}