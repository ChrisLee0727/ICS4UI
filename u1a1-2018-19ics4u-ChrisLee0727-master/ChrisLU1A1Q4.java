public class ChrisLU1A1Q4 {
    public static void main(String[] args) {
        int[] counts = new int[10]; // Array of ten integers

        // generate the counts of 100 random numbers and store in counts array
        for (int i = 0; i < 100; i++) {
            counts[(int)(10 * Math.random())]++;
        }

        // print message which is result from before process
        System.out.println("Count for each number between 0 and 9:");
        for (int i = 0; i < 10; i++) {
            System.out.println(i + "'s : " + counts[i]);
        }
    }

}
