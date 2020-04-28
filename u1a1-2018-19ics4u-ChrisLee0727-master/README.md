# ICS4U Unit 1 Assignment 1 2018-19 Sem. 2
Unit 1 Assignment 1 ICS4U-01 Sem 2 2018-19

Please refer to Google Classroom for instructions regardig txt files and flowcharts hand-in.  Your java programs go into GitHub - see integration of NetBeans with GitHub in Google Classroom.  (IE: Comments, naming conventions etc.)

Comittments, push and pulls and date will be checked.

# Question 1 
(Basic – Selection)  Write a program that plays rock scissors paper. 
Requirements:
  - The program randomly generates a number 0, 1, or 2 representing rock, scissor, or paper. 
  - The program prompts the user to enter a number 0, 1, or 2.
  - The program displays a message indicating whether the user or the computer won.
  - Appropriate messages to your user are expected
 
# Question 2
After your flowchart using it for structure and comments, write a program  to check an ISBN.  

ISBN is International Standard Book Number which consists of 10 digits d1, d2, d3, d4, d5, d6, d7, d8, d9, d10. (using the old 10 digit one for ease).

The last digit d10 is a checksum, which is calculated from the other nine digits using the following formula:
		(d1 x 1+  d2 x 2 + d3 x 3 + …  x 9) %11

If the checksum is 10, the last digit is denoted X, according to the ISBN convention.  

Requirements;
  - your program prompts the user to enter the first 9 digits
  - your program displays the 10 – digit ISBN (including leading zeros).  
  - your program should read the input as an integer.
  - Appropriate messages to your user are expected


# Question 3
After your flowchart using it for structure and comments, write a program for the dice game craps. 
(Basic Methods practice) Craps is a popular dice game played in casinos.  For simplification, see the test cases below.
Our variation is as follows;
Roll 2 dice.  Each die has six faces representing values 1, 2, …, and 6, respectively.  
Check the sum of the two dice.  If the sum is 2,3,, or 12 (called craps), you lose. 
If the sum is 7 or 11 (called natural), you win.  
If the sum is another value (i.e., 4,5,6,8,9, or 10.), a point is awarded. 
Continue to roll the dice until either a 7 or the same point value is rolled. 
If a 7 is rolled, you lose. 
Otherwise you win.  

Your program acts a single player. 

  - Possible  samples: 
  
        You rolled 5 + 6 = 11
        You win!

        You rolled 1 + 2 = 3
        You lose.

      	You rolled 4 + 4 = 8
      	Your points are 8
      	You rolled 6 + 2 = 8
      	You win!

      	You rolled 3 + 2 = 5
      	Your points are 5
      	You rolled 2 + 5 = 7
      	You lose.


# Question 4
(ArrayQuestion) 
After your flowchart using it for structure and comments, write a program that generates 100 random integers between 0 and 9 and displays the count for each number. 

(Hint: use (int)(Math.random() * 10) to generate random integer between 0 and 9. 

Use an array of ten integers, say counts, to store the counts for the number of 0’s, 1’s, …, 9’s)

# Question 5 
Impress me with your Array, GUI, Images, Listeners, Buttons an other GUI classes (expectaion at least one).  
After your flowchart using it for structure and comments, write a program that uses as many of the above listed elements in a fun way.                   
Have fun with this one!
