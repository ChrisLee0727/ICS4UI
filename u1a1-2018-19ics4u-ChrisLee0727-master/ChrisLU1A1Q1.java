package src.ChrisL;

import java.util.Random;
import java.util.Scanner;

public class ChrisLU1A1Q1 {


    public static void main(String[] args){

        // set variables
        int user;
        int com;
        Scanner scan = new Scanner(System.in); //set Scanner
        Random rd = new Random(); //set Random
        String[] Str = new String[]{"Rock", "Scissors", "Paper"}; //set rock scissors paper and data

        //Loop
        while(true){
            System.out.println("0.Rock,"+ " 1.Scissors,"+ " 2.Paper,"+ " 3.EXIT"); 
            System.out.println("======================");
            System.out.print("What are you going to choose?: ");
            // print message
            
            user = scan.nextInt();
            com = rd.nextInt(3);
            // add scanned number in user and com


            if(user == 3){ // Exit
                System.out.println("Exit\n");
                break;
            }

            if(user == 0 || user == 1 || user == 2 ) {
                if (user == com) {
                    System.out.println("\nYour play is : " + Str[user] + ", computer's play is : " + Str[com]);
                    System.out.println("It's tie.\n");
                } else if (user == 1 && com == 0) {
                    System.out.println("\nYour play is : " + Str[user] + ", computer's play is : " + Str[com]);
                    System.out.println("You lose.\n");
                } else if (user == 0 && com == 2) {
                    System.out.println("\nYour play is : " + Str[user] + ", computer's play is : " + Str[com]);
                    System.out.println("You lose.\n");
                } else if (user == 2 && com == 0) {
                    System.out.println("\nYour play is : " + Str[user] + ", computer's play is : " + Str[com]);
                    System.out.println("You win.\n");
                } else if (user < com) {
                    System.out.println("\nYour play is : " + Str[user] + ", computer's play is : " + Str[com]);
                    System.out.println("You win.\n");
                } else {
                    System.out.println("\nYour play is : " + Str[user] + ", computer's play is : " + Str[com]);
                    System.out.println("You lose.\n");
                }
            } else {
                System.out.println("Please choose it again.\n"); // if user typed number which is not 1, 2, or 3, it shows error message
            }




        }

    }

}