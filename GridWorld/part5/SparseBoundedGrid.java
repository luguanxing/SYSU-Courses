package part5;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

import info.gridworld.grid.AbstractGrid;
import info.gridworld.grid.Location;

public class SparseBoundedGrid<E> extends AbstractGrid<E> {

	private List<LinkedList<OccupantInCol>> occupantArray;
    private int rowNum;
    private int colNum;
	
    public SparseBoundedGrid(int row, int col) {
    	if (row > 0 && col > 0) {
	    	rowNum = row;
	    	colNum = col;
	    	occupantArray = new ArrayList<LinkedList<OccupantInCol>> ();
	        for (int i = 0; i < row; i++) {
	            occupantArray.add(new LinkedList<OccupantInCol> ());
	        }
    	} else {
    		throw new IllegalArgumentException("row and col must > 0");
    	}
    }
    
	@Override
	public E get(Location loc) {
        if (!isValid(loc))
            throw new IllegalArgumentException("Location is not valid");
        LinkedList<OccupantInCol> occupantCol = occupantArray.get(loc.getRow());
        for (OccupantInCol object: occupantCol) {
        	if (object.getCol() == loc.getCol()) {
        		return (E) object.getObject();
        	}
        }
        return null;
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
		ArrayList<Location> Locations = new ArrayList<Location>();
		int row = 0;
        for (LinkedList<OccupantInCol> rownodes : occupantArray) {
            for(int j = 0; j < rownodes.size(); j++) {
            	Locations.add(new Location(row, rownodes.get(j).getCol()));
            }
            row++;
        }
		return Locations;
	}

	@Override
	public boolean isValid(Location loc) {
        int row = loc.getRow();
        int col = loc.getCol();
		return (0 <= row && row < rowNum && 0 <= col && col < colNum);
	}

	@Override
	public E put(Location loc, E obj) {
        if (!isValid(loc)) {
            throw new IllegalArgumentException("Location is not valid");
        }
        if (obj == null) {
            throw new NullPointerException("obj is null");
        }
        
        E oldOccupant = get(loc);
        int row = loc.getRow();
        int col = loc.getCol();
        if (oldOccupant != null) {
            LinkedList<OccupantInCol> occupantCol = occupantArray.get(row);
        	for (OccupantInCol check: occupantCol) {
        		if (check.getCol() == col) {
        			check.setObject(obj);
        			break;
        		}
        	}
        } else {
        	(occupantArray.get(loc.getRow())).add(new OccupantInCol(loc.getCol(), obj));
        }
        return oldOccupant;
	}

	@Override
	public E remove(Location loc) {
        if (!isValid(loc))
            throw new IllegalArgumentException("Location is not valid");
        
        E g = get(loc);
        int row = loc.getRow();
        int col = loc.getCol();
        
        LinkedList<OccupantInCol> rownodes = occupantArray.get(row);
        for (OccupantInCol check: rownodes) {
    		if (check.getCol() == col) {
    			rownodes.remove(check);
    			break;
    		}
    	}
        return g;
	}

}
