// Chris Lee
// ICS4UI _ ChrisLU3_4A1Q1
// Ms. Harris
// May 20, 2019


//import java files
package com.ChrisLee;

import javax.swing.*;
import javax.swing.border.Border;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.ItemEvent;
import java.awt.event.ItemListener;
import java.io.File;
import java.io.FileNotFoundException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Scanner;


public class Main {

    //set static variables
    static String stn_name[];
    static String result[][];
    static List<Integer> data = new ArrayList<Integer>();
    static String station;
    static String header[];
    static List<List<String>> lines;
    static Integer count = 0;

    static class setGUI extends JFrame {
        setGUI() { // open setGUI()

            setTitle("Environment and Climate Change Canada, April 2018"); // set Title
            setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE); // make Exit available
            this.setLayout(new BorderLayout()); // set Layout as BorderLayout

            //COMBO BOX
            Border border2 = BorderFactory.createTitledBorder("Select station"); // set border for comboBox with creating its name
            JComboBox drop_down = new JComboBox(stn_name); // set drop_down for choosing station name

            //CHECK BOX
            JPanel panel1 = new JPanel(new GridLayout(13, 2)); // set JPanel for Border
            Border border1 = BorderFactory.createTitledBorder("Select data types"); //set Border for check box with creating its name
            panel1.setBorder(border1); // set border

            //set checkboxs
            JCheckBox ch1 = new JCheckBox("Latitude", false);
            JCheckBox ch2 = new JCheckBox("Longitude", false);
            JCheckBox ch3 = new JCheckBox("Province", false);
            JCheckBox ch4 = new JCheckBox("Mean Temperature", false);
            JCheckBox ch5 = new JCheckBox("Days without Valid Mean Temperature", false);
            JCheckBox ch6 = new JCheckBox("Mean Temperature difference from Normal (1981-2010)", false);
            JCheckBox ch7 = new JCheckBox("Highest Monthly Maximum Temperature", false);
            JCheckBox ch8 = new JCheckBox("Days without Valid Maximum Temperature", false);
            JCheckBox ch9 = new JCheckBox("Lowest Monthly Minimum Temperature", false );
            JCheckBox ch10 = new JCheckBox("Days without Valid Minimum Temperature", false);
            JCheckBox ch11 = new JCheckBox("Snowfall");
            JCheckBox ch12 = new JCheckBox("Days without Valid Snowfall");
            JCheckBox ch13 = new JCheckBox("Percent of Normal (1981-2010) Snowfall");
            JCheckBox ch14 = new JCheckBox("Total Precipitation (mm)");
            JCheckBox ch15 = new JCheckBox("Days without Valid Precipitation");
            JCheckBox ch16 = new JCheckBox("Percent of Normal (1981-2010) Precipitation");
            JCheckBox ch17 = new JCheckBox("Snow on the ground at the end of the month (cm)");
            JCheckBox ch18 = new JCheckBox("Number of days with Precipitation 1.0 mm or more");
            JCheckBox ch19 = new JCheckBox("Bright Sunshine (hours)");
            JCheckBox ch20 = new JCheckBox("Days without Valid Bright Sunshine");
            JCheckBox ch21 = new JCheckBox("Percent of Normal (1981-2010) Bright Sunshine");
            JCheckBox ch22 = new JCheckBox("Degree Days below 18 °C");
            JCheckBox ch23 = new JCheckBox("Degree Days above 18 °C");
            JCheckBox ch24 = new JCheckBox("Climate Identifier");
            JCheckBox ch25 = new JCheckBox("Not Available");

            //add checkBoxs to panel
            panel1.add(ch1);
            panel1.add(ch2);
            panel1.add(ch3);
            panel1.add(ch4);
            panel1.add(ch5);
            panel1.add(ch6);
            panel1.add(ch7);
            panel1.add(ch8);
            panel1.add(ch9);
            panel1.add(ch10);
            panel1.add(ch11);
            panel1.add(ch12);
            panel1.add(ch13);
            panel1.add(ch14);
            panel1.add(ch15);
            panel1.add(ch16);
            panel1.add(ch17);
            panel1.add(ch18);
            panel1.add(ch19);
            panel1.add(ch20);
            panel1.add(ch21);
            panel1.add(ch22);
            panel1.add(ch23);
            panel1.add(ch24);
            panel1.add(ch25);

            JButton button = new JButton("Apply"); //create button to apply

            drop_down.setBorder(border2); //set Border

            this.add(drop_down, "North"); // add drop_down on frame
            this.add(panel1, "Center"); // add panel on frame
            this.add(button, "East"); // add button on frame



            //actionListener
                // checkBox
            ch1.addItemListener(new ItemListener() { // check ch1 selected
                @Override
                public void itemStateChanged(ItemEvent e) {
                    if(e.getStateChange() == ItemEvent.SELECTED) {
                        data.add(1); // add on data[]
                    } else {
                        data.remove((Integer)1); // if deselected, remove from data[]
                    }
                }
            });
            ch2.addItemListener(new ItemListener() { // same as above
                @Override
                public void itemStateChanged(ItemEvent e) {
                    if(e.getStateChange() == ItemEvent.SELECTED) {
                        data.add(2);
                    }
                    else {
                        data.remove((Integer)2);
                    }
                }
            });
            ch3.addItemListener(new ItemListener() { // same as above
                @Override
                public void itemStateChanged(ItemEvent e) {
                    if(e.getStateChange() == ItemEvent.SELECTED) {
                        data.add(3);
                    }
                    else {
                        data.remove((Integer)3);
                    }
                }
            });
            ch4.addItemListener(new ItemListener() { // same as above
                @Override
                public void itemStateChanged(ItemEvent e) {
                    if(e.getStateChange() == ItemEvent.SELECTED) {
                        data.add(4);
                    }
                    else {
                        data.remove((Integer)4);
                    }
                }
            });
            ch5.addItemListener(new ItemListener() { // same as above
                @Override
                public void itemStateChanged(ItemEvent e) {
                    if(e.getStateChange() == ItemEvent.SELECTED) {
                        data.add(5);

                    }
                    else {
                        data.remove((Integer)5);
                    }
                }
            });
            ch6.addItemListener(new ItemListener() { // same as above
                @Override
                public void itemStateChanged(ItemEvent e) {
                    if(e.getStateChange() == ItemEvent.SELECTED) {
                        data.add(6);

                    }
                    else {
                        data.remove((Integer)6);
                    }
                }
            });
            ch7.addItemListener(new ItemListener() { // same as above
                @Override
                public void itemStateChanged(ItemEvent e) {
                    if(e.getStateChange() == ItemEvent.SELECTED) {
                        data.add(7);

                    }
                    else {
                        data.remove((Integer)7);
                    }
                }
            });
            ch8.addItemListener(new ItemListener() { // same as above
                @Override
                public void itemStateChanged(ItemEvent e) {
                    if(e.getStateChange() == ItemEvent.SELECTED) {
                        data.add(8);

                    }
                    else {
                        data.remove((Integer)8);
                    }
                }
            });
            ch9.addItemListener(new ItemListener() { // same as above
                @Override
                public void itemStateChanged(ItemEvent e) {
                    if(e.getStateChange() == ItemEvent.SELECTED) {
                        data.add(9);

                    }
                    else {
                        data.remove((Integer)9);
                    }
                }
            });
            ch10.addItemListener(new ItemListener() { // same as above
                @Override
                public void itemStateChanged(ItemEvent e) {
                    if(e.getStateChange() == ItemEvent.SELECTED) {
                        data.add(10);

                    }
                    else {
                        data.remove((Integer)10);
                    }
                }
            });
            ch11.addItemListener(new ItemListener() { // same as above
                @Override
                public void itemStateChanged(ItemEvent e) {
                    if(e.getStateChange() == ItemEvent.SELECTED) {
                        data.add(11);

                    }
                    else {
                        data.remove((Integer)11);
                    }
                }
            });
            ch12.addItemListener(new ItemListener() { // same as above
                @Override
                public void itemStateChanged(ItemEvent e) {
                    if(e.getStateChange() == ItemEvent.SELECTED) {
                        data.add(12);

                    }
                    else {
                        data.remove((Integer)12);
                    }
                }
            });
            ch13.addItemListener(new ItemListener() { // same as above
                @Override
                public void itemStateChanged(ItemEvent e) {
                    if(e.getStateChange() == ItemEvent.SELECTED) {
                        data.add(13);

                    }
                    else {
                        data.remove((Integer)13);
                    }
                }
            });
            ch14.addItemListener(new ItemListener() { // same as above
                @Override
                public void itemStateChanged(ItemEvent e) {
                    if(e.getStateChange() == ItemEvent.SELECTED) {
                        data.add(14);

                    }
                    else {
                        data.remove((Integer)14);
                    }
                }
            });
            ch15.addItemListener(new ItemListener() { // same as above
                @Override
                public void itemStateChanged(ItemEvent e) {
                    if(e.getStateChange() == ItemEvent.SELECTED) {
                        data.add(15);

                    }
                    else {
                        data.remove((Integer)15);
                    }
                }
            });
            ch16.addItemListener(new ItemListener() { // same as above
                @Override
                public void itemStateChanged(ItemEvent e) {
                    if(e.getStateChange() == ItemEvent.SELECTED) {
                        data.add(16);

                    }
                    else {
                        data.remove((Integer)16);
                    }
                }
            });
            ch17.addItemListener(new ItemListener() { // same as above
                @Override
                public void itemStateChanged(ItemEvent e) {
                    if(e.getStateChange() == ItemEvent.SELECTED) {
                        data.add(17);

                    }
                    else {
                        data.remove((Integer)17);
                    }
                }
            });
            ch18.addItemListener(new ItemListener() { // same as above
                @Override
                public void itemStateChanged(ItemEvent e) {
                    if(e.getStateChange() == ItemEvent.SELECTED) {
                        data.add(18);

                    }
                    else {
                        data.remove((Integer)18);
                    }
                }
            });
            ch19.addItemListener(new ItemListener() { // same as above
                @Override
                public void itemStateChanged(ItemEvent e) {
                    if(e.getStateChange() == ItemEvent.SELECTED) {
                        data.add(19);

                    }
                    else {
                        data.remove((Integer)19);
                    }
                }
            });
            ch20.addItemListener(new ItemListener() { // same as above
                @Override
                public void itemStateChanged(ItemEvent e) {
                    if(e.getStateChange() == ItemEvent.SELECTED) {
                        data.add(20);
                    }
                    else {
                        data.remove((Integer)20);
                    }
                }
            });
            ch21.addItemListener(new ItemListener() { // same as above
                @Override
                public void itemStateChanged(ItemEvent e) {
                    if(e.getStateChange() == ItemEvent.SELECTED) {
                        data.add(21);

                    }
                    else {
                        data.remove((Integer)21);
                    }
                }
            });
            ch22.addItemListener(new ItemListener() { // same as above
                @Override
                public void itemStateChanged(ItemEvent e) {
                    if(e.getStateChange() == ItemEvent.SELECTED) {
                        data.add(22);

                    }
                    else {
                        data.remove((Integer)22);
                    }
                }
            });
            ch23.addItemListener(new ItemListener() { // same as above
                @Override
                public void itemStateChanged(ItemEvent e) {
                    if(e.getStateChange() == ItemEvent.SELECTED) {
                        data.add(23);

                    }
                    else {
                        data.remove((Integer)23);
                    }
                }
            });
            ch24.addItemListener(new ItemListener() { // same as above
                @Override
                public void itemStateChanged(ItemEvent e) {
                    if(e.getStateChange() == ItemEvent.SELECTED) {
                        data.add(24);

                    }
                    else {
                        data.remove((Integer)24);
                    }
                }
            });
            ch25.addItemListener(new ItemListener() { // same as above
                @Override
                public void itemStateChanged(ItemEvent e) {
                    if(e.getStateChange() == ItemEvent.SELECTED) {
                        data.add(25);

                    }
                    else {
                        data.remove((Integer)25);
                    }
                }
            });

                // after button clicked
            ActionListener listener = new ActionListener() { // button action
                @Override
                public void actionPerformed(ActionEvent e) {
                    station = drop_down.getSelectedItem().toString(); // obtain station name

                    //get header
                    header = new String[data.size() + 1]; // set header
                    header[0] = station; // add station name on header[]

                    for (int i = 0; i < data.size() ; i++) {
                        header[i + 1] = lines.get(31).get(data.get(i)); // add into header

                    }


                    result = new String[count + 1][data.size() + 1]; // set result
                    result[count][0] = station; // add station name into result

                    for (int i = 32; i < lines.size(); i++) {
                        if (station == lines.get(i).get(0)) { // find lines<> which is for station that we are looking for
                            for (int y = 0; y < data.size();  y++) {
                                result[count][y+1] = lines.get(i).get(data.get(y)); // add on result[]d
                            }
                        }
                    }

                    JTable table = new JTable(result, header); // make JTable
                    JScrollPane scrollPane = new JScrollPane(table);
                    Main.setGUI.this.add(scrollPane, "South"); // on south
                    Main.setGUI.this.revalidate(); // revalidate to include scrollpane as Jtable into frame


                }
            };


            button.addActionListener(listener); // wait for action as Listener

            this.setSize(1200, 800); // set Size
            this.setVisible(true); //set Visible

        }
    }

    public static void main(String[] args) {
        String fileName= "eng-climate-summaries-All-4,2018.csv"; // set filenName
        File file= new File(fileName); // connect fileName into File

        lines = new ArrayList<>(); // declare lines
        Scanner input; //declare Scanner as input

        try{ //borrowed from my last assignment and JAVA
            input = new Scanner(file); // connect with file

            while(input.hasNext()){
                String line = input.nextLine(); // get line
                String[] values = line.split(","); // get values from line
                lines.add(Arrays.asList(values)); // add values into lines<>
            }

            input.close(); //close Scanner

        }catch (FileNotFoundException e) { // debug system (borrowed from my last assignment and JAVA)
            e.printStackTrace();
        }

        //get Stn_Name
        stn_name = new String[lines.size() - 32];

        for (int i = 32; i < lines.size(); i ++) {
            stn_name[i-32] = lines.get(i).get(0);
        }

        new setGUI(); // open GUI

    }

}
