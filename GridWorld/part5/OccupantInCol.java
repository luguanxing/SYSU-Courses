package part5;
public class OccupantInCol
{
    private Object occupant;
    private int col;
    
    public OccupantInCol(int c, Object object) {
    	occupant = object;
    	col = c;
    }
    
    public Object getObject() {
    	return occupant;
    }

    public void setObject(Object object) {
    	occupant = object;
    }
   
    public int getCol() {
    	return col;
    }

    public void setCol(int c) {
    	col = c;
    }
    
}