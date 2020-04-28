package src.ChrisL;

import java.util.Scanner;

public class ChrisLU1A1Q2 {
    public static void main(String[] args) {
        Scanner s = new Scanner(System.in); // receive number via scanner

        System.out.println("Enter the 9 digits of the ISBN as integer: "); // print message

        String num = s.next(); // s to num for making string

        int ISBN = 0; // set ISBN
		
        for (int i = 1; i <= num.length(); i++) {
            ISBN += (i * num.charAt(i - 1) - '0');//Ms. H - issue here not looking for 9 numbers.
            System.out.println("ISBN IS: " + ISBN);  //Added by MS. Harris - should be obvious
        }
        // add number which is scanned to ISBN via for loop

        if ( ISBN % 11 == 10) {
            System.out.println("The ISBN-10 number is " + ISBN + "X"); 
            // if ISBN % 11 is 10, last digit will be X
        } else {
            System.out.println("The ISBN-10 number is " + ISBN + ISBN % 11);
            // else last digit will be ISBN mod 11
        }
        

    }
}