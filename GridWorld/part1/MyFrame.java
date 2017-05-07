import java.awt.*;
import java.awt.event.*;

import javax.swing.JButton;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JTextField;
import javax.swing.border.Border;
import javax.swing.border.LineBorder;

public class MyFrame extends Frame {
	
	//Members of Calc
	private Double num1, num2, num3;
	private int symbol = 0;	
	
	private JPanel Row1 = new JPanel();
		private JTextField b1 = new JTextField();
		private JLabel b2 = new JLabel();
		private JTextField b3 = new JTextField();
		private JLabel b4 = new JLabel("=");
		private JTextField b5 = new JTextField();
	private JPanel Row2 = new JPanel();	
		private JButton b6 = new JButton("+");
		private JButton b7 = new JButton("-");
		private JButton b8 = new JButton("*");
		private JButton b9 = new JButton("/");
		private JButton b10 = new JButton("OK");
	Border border_gray = new javax.swing.border.CompoundBorder(null, new LineBorder(Color.gray));
	Border border_black = new javax.swing.border.CompoundBorder(null, new LineBorder(Color.black));
	
	
	//Function
	ActionListener btn_add;
	ActionListener btn_plus;
	ActionListener btn_multiply;
	ActionListener btn_divide;
	ActionListener btn_show;
	
	
	//InitFunc
	public boolean CheckNum() {
		try {
			num1 = Double.parseDouble(b1.getText());
			num2 = Double.parseDouble(b3.getText());
		} catch (Exception e) {
			System.out.println(e.toString());
		} finally {
			System.out.println(num1);
			System.out.println(num2);
		}
		if (num1 != null && num2 != null)
			return true;
		else
			return false;
	}
	
	public void InitEvent() {
		btn_add = new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				b2.setText("+");
				symbol = 1;
			}
		};
		btn_plus = new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				b2.setText("-");
				symbol = 2;
			}
		};
		btn_multiply = new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				b2.setText("*");
				symbol = 3;
			}
		};
		btn_divide = new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				b2.setText("/");
				symbol = 4;
			}
		};
		btn_show = new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				if (CheckNum()) {
					if (symbol == 1) {
						b5.setText(String.valueOf(num1+num2));
					} else if (symbol == 2) {
						b5.setText(String.valueOf(num1-num2));
					} else if (symbol == 3) {
						b5.setText(String.valueOf(num1*num2));
					} else if (symbol == 4) {
						b5.setText(String.valueOf(num1/num2));
					}
				}
			}
		};
		addWindowListener(new myWindowMonitor());
	}
    class myWindowMonitor extends WindowAdapter  
    {  
        public void windowClosing(WindowEvent e)  
        {  
            setVisible(false);  
            System.exit(0);  
        }  
    }  
	
	//Init
	public MyFrame(String name) {
		super(name);
		super.setLayout(new GridLayout(2, 1, 1, 1));
		InitEvent();
		Row1.setLayout(new GridLayout(1, 5, 1, 1));
			Row1.add(b1);
			Row1.add(b2);
			Row1.add(b3);
			Row1.add(b4);
			Row1.add(b5);
				b1.setHorizontalAlignment(JTextField.CENTER);
				b2.setHorizontalAlignment(JTextField.CENTER);
				b3.setHorizontalAlignment(JTextField.CENTER);
				b4.setHorizontalAlignment(JTextField.CENTER);
				b5.setHorizontalAlignment(JTextField.CENTER);
				b1.setBorder(border_gray);
				b3.setBorder(border_gray);
				b5.setBorder(border_gray);
				
		Row2.setLayout(new GridLayout(1, 5, 1, 1));
			Row2.add(b6);
			Row2.add(b7);
			Row2.add(b8);
			Row2.add(b9);
			Row2.add(b10);
				b6.setHorizontalAlignment(JTextField.CENTER);
		        b7.setHorizontalAlignment(JTextField.CENTER);
		        b8.setHorizontalAlignment(JTextField.CENTER);
		        b9.setHorizontalAlignment(JTextField.CENTER);
		        b10.setHorizontalAlignment(JTextField.CENTER);
				b6.setBorder(border_black);
		        b7.setBorder(border_black);
		        b8.setBorder(border_black);
		        b9.setBorder(border_black);
		        b10.setBorder(border_black);
		        b6.addActionListener(btn_add);
		        b7.addActionListener(btn_plus);
		        b8.addActionListener(btn_multiply);
		        b9.addActionListener(btn_divide);
		        b10.addActionListener(btn_show);
		        
		
		super.add(Row1);
		super.add(Row2);
		super.pack();
		super.setVisible(true);
	}
	
}