package part5;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import info.gridworld.grid.AbstractGrid;
import info.gridworld.grid.Location;
import info.gridworld.grid.UnboundedGrid;

public class SparseBoundedGrid3<E> extends UnboundedGrid<E> {
    private int rowNum;
    private int colNum;
    private Map<Location, E> occupantMap;
	
    public SparseBoundedGrid3(int row, int col) {
        occupantMap = new HashMap<Location, E>();
        rowNum = row;
        colNum = col;
    }
    
	@Override
	public E get(Location loc) {
        if (loc == null)
            throw new NullPointerException("loc is null");
        return occupantMap.get(loc);
	}

	@Override
	public int getNumCols() {
		return colNum;
	}

	@Override
	public int getNumRows() {
		return rowNum;
	}

	@Override
	public ArrayList<Location> getOccupiedLocations() {
        ArrayList<Location> locations = new ArrayList<Location>();
        for (Location loc : occupantMap.keySet())
        	locations.add(loc);
        return locations;
	}

	@Override
	public boolean isValid(Location loc) {
        int row = loc.getRow();
        int col = loc.getCol();
		return (0 <= row && row < rowNum && 0 <= col && col < colNum);
	}

	@Override
    public E put(Location loc, E obj)
    {
        if (loc == null || obj == null)
            throw new NullPointerException("loc and obj can not be null");
        return occupantMap.put(loc, obj);
    }

	@Override
    public E remove(Location loc)
    {
        if (loc == null)
            throw new NullPointerException("loc is null");
        return occupantMap.remove(loc);
    }

}
