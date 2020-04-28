/*  Coder: Chris Lee
    Course Name: ICS4UI_01
    Teacher's Name: Jill Harris
    Question number: 1
    Date: Feb 28
*/

public class ChrisLU1A1Q3 {

    public static void main(String[] args) {
        int dice;  // first ro2ll
        dice = (int)(6.0*Math.random() + 1) + (int)(6.0*Math.random() + 1);
        // set dice, random int (1~6) + random int(1~6)

        if (dice == 2 || dice == 3 || dice == 12 || dice == 7 || dice == 11){ // classify special numbers
            System.out.println("Your initial dice is: " + dice); // print first dice

            if (dice == 2 || dice == 3 || dice == 12) { // numbers which are craps, loss
                System.out.println("Craps, you lose");

            } else System.out.println("Natural, you win"); // other number which are natural, win

        } else{

            int point = dice; // point: 4, 5, 6, 8, 9, 10

            System.out.println("Your initial dice is: " + dice); //print message
            System.out.println("\nPoint: " + point); // print point
            System.out.println("=======================");

            while (true) {  // loop
                dice = (int) (6.0 * Math.random() + 1.0) + (int) (6.0 * Math.random() + 1.0);
                // set dice, random int (1~6) + random int(1~6)
                System.out.println("\nNew roll: " + dice); // print new roll until break

                if (dice == point) { // if you got same sum of dice and point, win
                    System.out.println("You got point, won");
                    break;  // break out of loop, a win
                }
                else if (dice == 7) { // if you got 7, loss
                    System.out.println("Lost with 7");
                    break;  // break out of loop, a loss
                } else System.out.println("Roll again"); // others, roll again
            }
        }
    }

}
