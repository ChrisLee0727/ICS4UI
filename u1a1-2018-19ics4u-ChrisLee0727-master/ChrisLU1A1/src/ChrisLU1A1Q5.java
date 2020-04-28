/*  Coder: Chris Lee
    Course Name: ICS4UI_01
    Teacher's Name: Jill Harris
    Question number: 1
    Date: Feb 27
*/
import java.util.*; // import all of java util

public class ChrisLU1A1Q5 {
    public static void main(String[] args) {

        while (true) {
            //set variables
            Scanner scan = new Scanner(System.in);  // initial Scanner
            System.out.println("\nHow much do you want to buy it? (1 ~ 4 : accepted / others: EXIT)");
            int gca = scan.nextInt();
            int gca2[][] = new int[6][6];

            int lotto[];
            lotto = lottoNumbers();

            if (gca == 1 || gca == 2 || gca == 3 || gca == 4 || gca == 5) {
                for (int i = 0; i < gca; i++) {
                    System.out.println("\nSheet Number: " + (i + 1)); // sheet number
                    System.out.println("===================");
                    for (int j = 0; j < 6; j++) {
                        System.out.println("Type your lotto number between 1 to 45"); // receive lotto number
                        gca2[i][j] = scan.nextInt();
                    }
                    System.out.println("===================\n"); // for UI
                }

                System.out.println("\nRECEIPT"); // RECEIPT
                System.out.println("===================");
                for (int i = 1; i <= gca; i++) {
                    System.out.println(i + ":" + Arrays.toString(gca2[i - 1])); // show receipt by each module
                }
                System.out.println("===================\n");

                System.out.println("\nLOTTO"); // LOTTO
                System.out.println("===================");
                System.out.println(Arrays.toString(lotto));
                System.out.println("===================\n");

                int cnt = 0;
                List<Integer> cor = new ArrayList<>(); // set Arraylist which is much easier than array and I extremely prefer to use

                // borrowed from https://bluelemonwater.tistory.com/entry/배열-제어문으로-중복값-찾기
                for (int k = 0; k < gca; k++) {
                    for (int i = 0; i < 6; i++) {
                        for (int j = 0; j < 6; j++) {
                            if (gca2[k][i] == lotto[j]) {
                                cor.add(gca2[k][i]); // add to cor which is to save corrected lotto number(s).
                                cnt++; // count cnt + 1
                                break;
                            }
                        }

                    }

                }

                if (cnt == 0) { // if it doesn't got any lotto
                    System.out.println("Sorry, you got nothing");
                } else { // if player got lotto, messages represents lotto and rank
                    System.out.println("You got : " + cor + "\nYour rank : " + (6 - cor.size()));
                }
            } else {
                System.out.println("Thank you for using it."); // end
                break;
            }
        }


    }

    static int[] lottoNumbers() { // make other to create individual lotto Numbers

        // set lottoNum
        int lottoNum[] = new int[6];

        // add random number between 1 to 45 in lottoNum
        for (int i = 0; i < 6; i++) {
            lottoNum[i] = (int)(45*Math.random());
        }


        // borrowed from https://bluelemonwater.tistory.com/entry/배열-제어문으로-중복값-찾기
        int cnt = 0;

        //check redundant number in lottoNum and change redundant number to other number
        for (int k = 0; k < 6; k++) {
            for (int i =0; i < 6; i++) {
                for (int j = 1; j < 6; j++) {
                    if (lottoNum[i] == lottoNum[j]) {
                        cnt ++;
                    }
                }
                if (cnt == 2) { // if there are redundant number, change it
                    lottoNum[i] = (int)(45*Math.random());
                    break;
                } else if (lottoNum[i] == 0) { // change 0 to other number
                    lottoNum[i] = (int)(45*Math.random());
                } else {
                    cnt = 0;
                }
            }
        }


        return lottoNum; // return lottoNum which is final task

    }


}
