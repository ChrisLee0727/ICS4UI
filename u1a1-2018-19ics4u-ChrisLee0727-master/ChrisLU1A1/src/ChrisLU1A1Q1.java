/*  Coder: Chris Lee
    Course Name: ICS4UI_01
    Teacher's Name: Jill Harris
    Question number: 1
    Date: Feb 27
*/

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
                if (user == com) { // if user's play and com's play is same
                    System.out.println("\nYour play is : " + Str[user] + ", computer's play is : " + Str[com]);
                    System.out.println("It's tie.\n");
                } else if (user == 1 && com == 0) { // if user's play is scissors and com's play is rock
                    System.out.println("\nYour play is : " + Str[user] + ", computer's play is : " + Str[com]);
                    System.out.println("You lose.\n");
                } else if (user == 0 && com == 2) { // if user's play is rock and com's play is paper
                    System.out.println("\nYour play is : " + Str[user] + ", computer's play is : " + Str[com]);
                    System.out.println("You lose.\n");
                } else if (user == 2 && com == 0) { // if user's play is scissors and com's play is rock
                    System.out.println("\nYour play is : " + Str[user] + ", computer's play is : " + Str[com]);
                    System.out.println("You win.\n");
                } else if (user < com) { // others to win
                    System.out.println("\nYour play is : " + Str[user] + ", computer's play is : " + Str[com]);
                    System.out.println("You win.\n");
                } else { // others to lose
                    System.out.println("\nYour play is : " + Str[user] + ", computer's play is : " + Str[com]);
                    System.out.println("You lose.\n");
                }
            } else { // if plays are not acceptable
                System.out.println("Please choose it again.\n"); // if user typed number which is not 1, 2, or 3, it shows error message
            }




        }

    }

}
