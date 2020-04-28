/*

    Chris Lee
    ICS4UI _ ChrisLU3_4A1Q3
    Ms. Harris
    May 20, 2019

 */

//import package and JAVA file
package com.chris0727.chrislu3_4a1q3;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;
import android.widget.Toast;

public class MainActivity extends AppCompatActivity {
    // declare global variables
    TextView fare;
    TextView tip;
    TextView total;
    String str_fare;
    String per_tip;
    String str_tip;
    String str_total;
    Boolean path;
    Boolean bool;
    Button selector;
    Boolean check = false; // if true, user need to clear for debug system


    @Override
    protected void onCreate(Bundle savedInstanceState) { // when on Create
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        // set variables
        fare = (TextView) findViewById(R.id.textView_Fare);
        tip = (TextView) findViewById(R.id.textView_tip);
        total = (TextView) findViewById(R.id.textView_total);
        selector = (Button) findViewById(R.id.btn_customTIp);

        str_total = "Total: ";
        str_fare = "Fare: ";
        per_tip = "";
        str_tip = "Tip (" + per_tip + "%): ";
        path = false; // if path is false represents buttons would be clicked for textView_Fare
                      // if path is true represents buttons would be clicked for textView_tip for custom tip
        bool = false; // bool is for checking that does user insert numbers

        fare.setText(str_fare);
        tip.setText(str_tip);
        total.setText(str_total);

    }

    public void onClick01(View v) { //if press btn_15
        if (check) {
            Toast.makeText(getApplicationContext(), "Please make it clear first", Toast.LENGTH_SHORT).show(); //if check is true, don't calculate before clear to avoid bug
        }
        else if (bool) {
            //calculations
            String raw_fare = fare.getText().toString().split(":")[1];
            float float_fare = Float.parseFloat(raw_fare);
            float float_total = float_fare * 1.15F;
            float float_tip_15 = float_fare * 0.15F;

            //set tip string
            per_tip += 15; //set per_tip as 15
            str_tip = "Tip (" + per_tip + "%): ";

            //set Text of tip and total
            tip.setText(str_tip + String.format("%.2f", float_tip_15));
            total.setText(str_total + String.format("%.2f", float_total));


            check = true; //debug system on

        } else {
            Toast.makeText(getApplicationContext(), "Please insert your fare first", Toast.LENGTH_SHORT).show(); // debug system _ make user insert fare
        }


    }

    /* EXPLANATION OF BUTTON ONCLICK TEMPLATE
    public void onClick0(n+1)(view v) { // press btn_n
        if (!path) { if path is false, it's for fare
            bool = true // debug system
            str_fare += n; // add string of fare
            fare.setText(str_fare); // setText of fare
        } else { // if path is true, it's for tip
            per_tip += n; // add string of tip
            str_tip = "Tip (" + per_tip + "%): "; // add string of str_tip
            tip.setText(str_tip); // setText of tip
        }
     */

    public void onClick02(View v) { // press btn_1
        if (!path) {
            bool = true;
            str_fare += 1;
            fare.setText(str_fare);
        } else {
            per_tip += 1;
            str_tip = "Tip (" + per_tip + "%): ";
            tip.setText(str_tip);
        }
    }

    public void onClick03(View v) { // press btn_2
        if (!path) {
            bool = true;
            str_fare += 2;
            fare.setText(str_fare);
        } else {
            per_tip += "2";
            str_tip = "Tip (" + per_tip + "%): ";
            tip.setText(str_tip);
        }
    }

    public void onClick04(View v) { // press btn_3
        if (!path) {
            str_fare += 3;
            bool = true;
            fare.setText(str_fare);
        } else {
            per_tip += "3";
            str_tip = "Tip (" + per_tip + "%): ";
            tip.setText(str_tip);
        }
    }

    public void onClick05(View v) { // press btn_4
        if (!path) {
            bool = true;
            str_fare += 4;
            fare.setText(str_fare);
        }
        else {
            per_tip += "4";
            str_tip = "Tip (" + per_tip + "%): ";
            tip.setText(str_tip);
        }
    }

    public void onClick06(View v) { // press btn_5
        if (!path) {
            bool = true;
            str_fare += 5;
            fare.setText(str_fare);
        } else {
            per_tip += "5";
            str_tip = "Tip (" + per_tip + "%): ";

            tip.setText(str_tip);
        }
    }

    public void onClick07(View v) { // press btn_6
        if (!path) {
            bool = true;
            str_fare += 6;
            fare.setText(str_fare);
        } else {
            per_tip += "6";
            str_tip = "Tip (" + per_tip + "%): ";

            tip.setText(str_tip);
        }
    }

    public void onClick08(View v) { // press btn_7
        if (!path) {
            bool = false;
            str_fare += 7;
            fare.setText(str_fare);
        } else {
            per_tip += "7";
            str_tip = "Tip (" + per_tip + "%): ";

            tip.setText(str_tip);
        }
    }

    public void onClick09(View v) { // press btn_8
        if (!path) {
            bool = true;
            str_fare += 8;
            fare.setText(str_fare);
        } else {
            per_tip += "8";
            str_tip = "Tip (" + per_tip + "%): ";

            tip.setText(str_tip);
        }
    }

    public void onClick10(View v) { // press btn_9
        if (!path) {
            bool = true;
            str_fare += 9;
            fare.setText(str_fare);
        } else {
            per_tip += "9";
            str_tip = "Tip (" + per_tip + "%): ";

            tip.setText(str_tip);
        }
    }

    public void onClick11(View v) { // press btn_0
        if (!path) {
            bool = true;
            str_fare += 0;
            fare.setText(str_fare);
        } else {
            per_tip += "0";
            str_tip = "Tip (" + per_tip + "%): ";

            tip.setText(str_tip);
        }
    }

    public void onClick12(View v) { // press btn_clear

        // reset variables
            bool = false;
            check = false;
            str_fare = "Fare: ";
            str_tip = "Tip (%): ";
            per_tip = "";
            str_total = "Total: ";

            fare.setText(str_fare);
            tip.setText(str_tip);
            total.setText(str_total);

    }

    public void onClick13(View v) { // press btn_.
        if (!path) { // for fare

            if (!bool) { // if no number inserted
                fare.setText(str_fare + "0."); // add 0.
                bool = true; // debug
            } else {
                str_fare += "."; //add .
                fare.setText(str_fare);
                bool = true; // debug
            }

        } else { // for tip
            if (per_tip == "") { //if no tip inserted yet
                per_tip += "0."; // add 0.
                tip.setText(str_tip); //setText
            }
            else {
                per_tip += "."; // add .
                tip.setText(str_tip);// setText
            }
        }
    }

    public void onClick14(View v) { // press btn_ok (calculation)
        if (path) {
            if (str_fare.length() == 6) {
                Toast.makeText(getApplicationContext(), "Please insert your fare first", Toast.LENGTH_SHORT).show(); // debug _ if user didn't insert numbers, make a toast!
            }
            else if (str_tip.length() == 9) {
                Toast.makeText(getApplicationContext(), "Please insert your tip first", Toast.LENGTH_SHORT).show(); // debug _ if user didn't insert numbers, make a toast!
            }
            else {
                String raw_fare = str_fare.substring(6); // get numbers which are on after index 6
                float float_fare = Float.parseFloat(raw_fare); // calculation ~
                float float_tip = Float.parseFloat(per_tip);
                float result_tip = (float_tip / 100) * float_fare;
                float result_total = (float_tip / 100 + 1) * float_fare;

                tip.setText(str_tip + String.format("%.2f", result_tip));
                total.setText(str_total + String.format("%.2f", result_total));

                check = true;
            }

        } else {
            Toast.makeText(getApplicationContext(), "Please insert your numbers first", Toast.LENGTH_SHORT).show(); // debug _ if user didn't insert numbers, make a toast!
        }


    }

    public void onClick15(View v) { // press btn_customTip
        if (!path) { // path convertor
            path = true;
            selector.setText("INSERT FARE"); //set Text
        } else {
            path = false;
            selector.setText("INSERT TIP");
        }
    }

    public void onClick16(View v) { // press btn_back
        if (!path) { // for fare
            if (str_fare.length() <= 6) {
                Toast.makeText(getApplicationContext(), "Please insert your fare first", Toast.LENGTH_SHORT).show(); //debug
            }
            else if (check) { //debug system
                Toast.makeText(getApplicationContext(), "Please make it clear", Toast.LENGTH_SHORT).show(); //debug
            }
            else {
                str_fare = "Fare:" + str_fare.split(":")[1].substring(0, str_fare.split(":")[1].length()-1); // delete last string of fare
                fare.setText(str_fare);
            }

        } else { // for custom tip
            if (str_tip.length() <= 9) {
                Toast.makeText(getApplicationContext(), "Please insert your tip first", Toast.LENGTH_SHORT).show(); //debug

            }
            else if (check) { //debug system
                Toast.makeText(getApplicationContext(), "Please make it clear", Toast.LENGTH_SHORT).show(); //debug
            }
            else {
                str_tip = "Tip (%):" + str_tip.split(":")[1].substring(0, str_tip.split(":")[1].length()-1); // delete last string of tip
                tip.setText(str_tip);
            }

        }
    }

}
