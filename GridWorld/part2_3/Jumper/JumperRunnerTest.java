import static org.junit.Assert.*;

import java.awt.Color;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import info.gridworld.actor.ActorWorld;
import info.gridworld.actor.Bug;
import info.gridworld.actor.Flower;
import info.gridworld.actor.Rock;
import info.gridworld.grid.Location;

public class JumperRunnerTest {

    @Before
    public void setUp() throws Exception {
    	
    }
    @After
    public void tearDown() throws Exception {
    	
    }

    @Test
    public void testInit() {
        Jumper jumper1 = new Jumper();
        assertEquals(jumper1.getColor(), Color.BLUE);
    }

    @Test
    public void testInit2() {
        Jumper jumper1 = new Jumper(Color.BLUE);
        assertEquals(jumper1.getColor(), Color.BLUE);
    }

    @Test
    public void testAct() {     
        Jumper jumper = new Jumper();
        ActorWorld world = new ActorWorld();
        world.add(new Location(5, 5), jumper);
        jumper.act();
        assertEquals(jumper.getLocation(), new Location(3,5));
    }

    @Test
    public void testActBorder() {     
        Jumper jumper = new Jumper();
        ActorWorld world = new ActorWorld();
        world.add(new Location(1, 5), jumper);
        jumper.act();
        assertEquals(jumper.getLocation(), new Location(1,5));
    }

    @Test
    public void testActMove() {   
        ActorWorld world = new ActorWorld();
        Jumper jumper = new Jumper();
        Rock rock = new Rock();
        world.add(new Location(3, 3), rock);
        world.add(new Location(5, 3), jumper);
        jumper.act();
        assertEquals(jumper.getLocation(), new Location(5,3));
        assertEquals(jumper.getDirection(), 45);
    }


    @Test
    public void testTurn() {
       Jumper jumper = new Jumper();
       ActorWorld world = new ActorWorld();
       world.add(new Location(5, 5), jumper);
       jumper.turn();
       assertEquals(jumper.getDirection(), 45);
    }

    @Test
    public void testTurn2() {
       Jumper jumper = new Jumper();
       ActorWorld world = new ActorWorld();
       world.add(new Location(3, 3), jumper);
       jumper.setDirection(180);
       jumper.turn();
       assertEquals(jumper.getDirection(), 225);
    }

    @Test
    public void testBlock() {
       ActorWorld world = new ActorWorld();
       Jumper jumper = new Jumper();
       Flower flower = new Flower();
       Rock rock = new Rock();
       Bug bug = new Bug();
       world.add(new Location(3, 3), jumper);
       assertEquals(jumper.canMove(), true);
       
       
       world.add(new Location(1, 3), rock);
       assertEquals(jumper.canMove(), false);
       rock.removeSelfFromGrid();
       world.add(new Location(1, 3), flower);
       assertEquals(jumper.canMove(), false);
       flower.removeSelfFromGrid();
       world.add(new Location(1, 3), bug);
       assertEquals(jumper.canMove(), false);
       bug.removeSelfFromGrid();
       
       world.add(new Location(2, 3), rock);
       assertEquals(jumper.canMove(), true);
       rock.removeSelfFromGrid();
       world.add(new Location(2, 3), flower);
       assertEquals(jumper.canMove(), true);
       flower.removeSelfFromGrid();
       world.add(new Location(2, 3), bug);
       assertEquals(jumper.canMove(), true);
    }

}
