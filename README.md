Lucas Square Pyramid

1. The input goes into the Boss.pony file. I have mentioned where in that file itself.

2. Input 2 numbers inside the process().

3. Here is how the code works:
Let's consider the input 3,2
The arrayCreator creates an array of size 2 starting with 1 => [1,2]
Then result calculates if the sum of squares of these numbers is a square.
If yes, result is sent back to the Boss actor where the result is printed. 
If no, I have used the sliding window technique where the 0th index is removed and the next consecutive number is added. For example [1,2] becomes [2,3], which further becomes [3,4]

4. The program stops at [3,4] because 3^2 + 4^2 = 5^2. 

5. How to run the code:

- run ponyc command and let the pony compiler compile the code.
- once the complier completes, a .exe file is created.
- now run the command .\ponyworld.exe

6. To calculate the time taken by the program to run-
- run the following command:
 Measure-Command { .\ponyworld.exe }#   I m p l e m e n t i n g - A c t o r s - i n - P o n y  
 