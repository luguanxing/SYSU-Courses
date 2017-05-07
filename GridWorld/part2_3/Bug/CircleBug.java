package gridworld;

import info.gridworld.actor.Bug;

public class CircleBug extends Bug
{
    private int steps;
    private int sideLength;
    public CircleBug(int length)
    {
        steps = 0;
        sideLength = length;
    }
    public void act()
    {
        if (steps < sideLength && canMove())
        {
            move();
            steps++;
        }
        else
        {
            turn();	//Turn only once!
            steps = 0;
        }
    }
}
