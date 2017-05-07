package part5;


import java.util.ArrayList;
import info.gridworld.grid.Grid;
import java.util.*;
import info.gridworld.grid.Location;

public class UnboundedGrid2<E> implements Grid<E>
{
    private Object[][] occupantArray;
    private int size = 16;

    public UnboundedGrid2() {
        occupantArray = new Object[size][size];
    }

    public int getNumRows() {
        return -1;
    }

    public int getNumCols() {
        return -1;
    }

    public boolean isValid(Location loc) {
        return 0 <= loc.getCol() && 0 <= loc.getRow();
    }

    public ArrayList<Location> getOccupiedLocations() {
        ArrayList<Location> locations = new ArrayList<Location>();
        for (int r = 0; r < size; r++) {
            for (int c = 0; c < size; c++) {
                Location loc = new Location(r, c);
                if (get(loc) != null) {
                	locations.add(loc);
                }
            }
        }
        return locations;
    }

    public E get(Location loc) {
        if (!isValid(loc)) {
            throw new IllegalArgumentException("Location is not valid");
        }
        if (loc == null) {
            return null;
        }
        Enlarge(loc);
        return (E)occupantArray[loc.getRow()][loc.getCol()];
    }

    public E put(Location loc, E obj) {
        if (loc == null) {
            throw new IllegalArgumentException("loc == null");
        }
        if (obj == null) {
            throw new IllegalArgumentException("obj == null");
        }
        Enlarge(loc);
        E oldObject = get(loc);
        occupantArray[loc.getRow()][loc.getCol()] = obj;
        return oldObject;
    }

    public E remove(Location loc) {
        if (loc == null) {
            throw new IllegalArgumentException("loc == null");
        }
        if (!isValid(loc)) {
            throw new IllegalArgumentException("Location is not valid");
        }
        E obj = get(loc);
        occupantArray[loc.getRow()][loc.getCol()] = null;
        return obj;
    }

    public void Enlarge(Location loc) {
        int newSize = size;
        if (loc == null) {
            return;
        }
        int needcol = loc.getCol();
        int needrow = loc.getRow();
        while (needcol >= newSize  || needrow >= newSize) {
            newSize = size * 2;
        }
        Object[][] tempOccupantArray = new Object[newSize][newSize];
        for (int i = 0; i < size; i++) {
            tempOccupantArray[i] = Arrays.copyOf(occupantArray[i], newSize);
        }
        occupantArray = tempOccupantArray;
        size = newSize;
    }

    public ArrayList<E> getNeighbors(Location loc) {
        ArrayList<E> neighbors = new ArrayList<E>();
        for (Location neighborLoc : getOccupiedAdjacentLocations(loc)) {
            neighbors.add(get(neighborLoc));
        }
        return neighbors;
    }

    public ArrayList<Location> getValidAdjacentLocations(Location loc) {
        ArrayList<Location> locations = new ArrayList<Location>();
        int d = Location.NORTH;
        for (int i = 0; i < 8; i++) {
            Location neighborLoc = loc.getAdjacentLocation(d);
            if (isValid(neighborLoc)) {
            	locations.add(neighborLoc);
            }
            d = d + Location.HALF_RIGHT;
        }
        return locations;
    }

    public ArrayList<Location> getEmptyAdjacentLocations(Location loc) {
        ArrayList<Location> locations = new ArrayList<Location>();
        for (Location neighborLoc : getValidAdjacentLocations(loc)) {
            if (get(neighborLoc) == null) {
            	locations.add(neighborLoc);
            }
        }
        return locations;
    }

    public ArrayList<Location> getOccupiedAdjacentLocations(Location loc) {
        ArrayList<Location> locations = new ArrayList<Location>();
        for (Location neighborLoc : getValidAdjacentLocations(loc)) {
            if (get(neighborLoc) != null) {
            	locations.add(neighborLoc);
            }
        }
        return locations;
    }
}
