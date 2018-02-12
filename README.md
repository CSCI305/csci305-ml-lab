# "MLing Sets"
## ML Programming Lab
## Concepts of Programming Languages
## CSCI 305, Spring 2018

# Due Date: March 09, 2018 at 11:59 PM

Table of Contents
=================

   * [Troubleshooting](#troubleshooting)
   * [ML](#ml)
      * [What's Alread in the File?](#whats-already-in-the-file)
      * [Other Files](#other-files)
      * [Warmup](#warmup)
         * [Lab Questions 1 - 4](#lab-questions-1---4)
      * [Sets datatype](#sets-datatype)
         * [isMember function](#ismember-function)
         * [list2Set function](#list2set-function)
         * [Lab Questions 5 - 8](#lab-questions-5---8)
         * [Union function](#union-function)
         * [Intersect function](#intersect-function)
         * [Lab Questions 9 - 10](#lab-questions-9---10)
         * [Lab Questions 11 - 15](#lab-questions-11---15)
   * [Submission](#submission)
   * [Grading](#grading)

# Troubleshooting
This lab requires an independent study of the ML language. You are encouraged to use any web tutorials and resources to learn ML beyond those in the book and provided by me (i.e. you will need to find them).
- ### **Given the size of the class, I will not be able to debug your code for you**
- ### **Please do not send panicked emails requesting I fix your bug for you.**
- ### **Allow yourself plenty of time, and use patience, perseverance, and the internet to debug your code.**

I will gladly answer **clarifying questions about the goals and instructions of the Lab assignment**. What this means is that if you come to my office hours or email me with questions concerning the following items or their derivatives, the provided stock answer applies. When it comes to these assignments, think of me more as your client/customer who is acquiring your product. **Before coming to me with a question regarding the assignment, ask whether you would ask a client/customer that question.**
* Can you take a look at this code and tell me what I'm doing wrong? No.
* Can you help me debug this program? No.
* Can you help me get XXX running on my computer? No.
* Can you tell me why my code isn't working? No.

# ML
For this lab, you will use ML. You may use any flavor of ML of your choice. I recommend the Standard New Jersey flavor for Linux and MacOS, and PolyML for Windows.

## What's Already In the File
The provided code in file `ml_lab.sml` has the following pieces of code (in order from top to bottom of the file):

**Lines 1 - 8:** -- A Header Comment Block, fill this in with appropriate information, note that your first and last name do not have angle brackets surrounding them.
```ml
(***************************************************************
*
* CSCI 305 - ML Programming Lab
*
* <firstname> <lastname>
* <email-address>
*
***************************************************************)
```

**Line 10:** The place where I would suggest placing your code.
```ml
(* Define your data type and functions here *)
```

**Lines 12 - 31:** Some simple funtions to print the contents of Sets, note these will not work until you have defined the `sets` data type with the corresponding `Set` and `Empty` constructors.
```ml
(* Simple function to stringify the contents of a Set of characters *)
fun stringifyCharSet Empty = ""
  | printCharSet (Set(y, ys)) = Char.toString(y) ^ " " ^ stringifyCharSet(ys);

(* Simple function to stringify the contents of a Set of ints *)
fun stringifyIntSet Empty = ""
  | printIntSet (Set(w, ws)) = Int.toString(w) ^ " " ^ stringifyIntSet(ws);

(* Simple function to stringify the contents of a Set of strings *)
fun stringifyStringSet Empty = ""
  | printStringSet (Set(z, zs)) = z ^ " " ^ stringifyStringSet(zs);

(* Simple function that prints a set of integers *)
fun print_int x = print ("{ " ^ stringifyIntSet(x) ^ "}\n");

(* Simple function that prints a set of strings *)
fun print_str x = print ("{ " ^ stringifyStringSet(x) ^ "}\n");

(* Simple function that prints a set of characters *)
fun print_chr x = print ("{ " ^ stringifyCharSet(x) ^ "}\n");
```

**Lines 33 - 37:** Some example code for the `list2Set` function, note this will not work until after you define the `list2Set` function.
```ml
list2Set [1, 3, 2];
list2Set [#"a", #"b", #"c"];
list2Set [];
list2Set [6, 2, 2];
list2Set ["x", "y", "z", "x"];
```

**Lines 39 - 58:** The code from the lab questions, from which answers to questions 1, 5, 7, 9 and 10 will come.
```ml
(* Question 1 *)
f [3, 1, 4, 1, 5, 9]

(* Question 5 *)
val quest5 = isMember "one" (list2Set ["1", "2", "3", "4"]);
print ("\nQuestion 5: " ^ Bool.toString(quest5) ^ "\n");

(* Question 7 *)
val quest7 = list2Set ["it", "was", "the", "best", "of", "times,", "it", "was", "the", "worst", "of", "times"];
print "\nQuestion 7: ";
print_str quest7;
print "\n";

(* Question 9 *)
print "\nQuestion 9: ";
print_str (union (list2Set ["green", "eggs", "and"]) (list2Set ["ham"]));

(* Question 10 *)
print "\nQuestion 10: ";
print_str (intersect (list2Set ["stewed", "tomatoes", "and", "macaroni"]) (list2Set ["macaroni", "and", "cheese"]));
```

## Other Files
Along with the source code in `ml_lab.sml` there are three other files:
* LICENSE - A simple license for this code based on the MIT License.
* README - What you are currently reading.
* README.pdf - A pdf version of what you are currently reading.

## Warmup

Begin by entering this function in ML. The lines that begin with a semicolon are comment lines that you will fill in.

```ml
 fun f [] = [] (* a *)
   | f (x::xs) = (x + 1) :: (f xs) (* b *)
```

### Lab Questions 1 - 4

1. Run this function as `f [3, 1, 4, 1, 5, 9]`. What output do you get?
2. What does this function `f` do?
3. Give a comment that explains the line following `(a)`.
4. Give a comment that explains the line following `(b)`.

## Sets datatype
Construct a datatype used to represent sets, called `set`, it should have two different types: `Set` and `Empty`. Where `Set` is of type `'element * 'element set`, meaning that it hold some polymorphic type `'element` and a sets of `'element`.

### isMember function
Write a function `isMember` that determines if an element `e` is part of the set, `set`. This function will return `true` if `e` is a member of the set, `set`, and `false` otherwise.

```ml
 fun isMember e set = ; (* complete this function definition *)
```

### list2Set function

Write a function `list2Set` that convertes a list into a set ensuring that the properties of a well formed set, i.e., that is has no duplicates, are maintained. You may find it useful to make use of your `isMember` function in your `list2Set` function.

For example:

```ml
 list2Set [1, 3, 2]; => Set (1, Set (3, Set (2, Empty)))
 list2Set [#"a", #"b", #"c"]; => Set (#"a", Set (#"b", Set (#"c", Empty)))
 list2Set []; => Empty
 list2Set [6, 2, 2]; => Set (6, Set(2, Empty))
 list2Set ["x", "y", "z", "x"]; => Set ("x", Set ("y", Set ("z", Empty)))
```

```ml
 fun isSet set = ; (* complete this function definition *)
 ```

### Lab Questions 5 - 8

Your answers **must** reflect the output of your code. No credit will be given to answers if you have not submitted the respective correct function implementation.

5. What output do you get for the call: `isMember "one" ["1", "2", "3", "4"]`
6. Does your `isMember` function use head or tail recursion?
7. What output do you get for the call

```
  list2Set ["it", "was", "the", "best", "of", "times,", "it", "was", "the", "worst", "of", "times"];
```

8. Research `tail recursion`. Describe, in a few short sentences, why it can be beneficial to write tail recursing functions.

### Union function

Write a function `union` that takes the set union of set `set1` and set `set2` and returns a set representing the mathematical union of the two sets. You may use the functions you defined previously (`list2Set` and `isMember`), if useful, in addition to any of the common ML functions mentioned in class. Comment your function.

```ml
 fun union set1 set2 = ; (* complete this function definition *)
```

### Intersect function
Write a function `intersect` that takes the set intersection of set `set1` and set `set2` and returns a set representing the mathematical intersection of the two sets. Comment your function.

```ml
 fun intersect set1 set2 = ; (* Complete this function definition *)
```

### Lab Questions 9 - 10
Your answers **must** reflect the output of your code for these functions. No credit will be given to answers if you have not submitted the respective correct function implementation in ML.

9. What output do you get for the call:

```ml
  union (list2Set ["green", "eggs", "and"]) (list2Set ["ham"]);
```

10. What output do you get for the call:

```ml
  intersect (list2Set ["stewed", "tomatoes", "and", "macaroni"]) (list2Set ["macaroni", "and", "cheese"]);
```

### Lab Questions 11 - 15

The following questions are for feedback and evaluation purposes. Points are awarded for any sincere answer.

11. Name something you like about ML. Explain.
12. Name something you dislike about ML. Explain.
13. Did you enjoy this lab? Which aspects did you like and/or dislike?
14. Approximately how many hours did you spend on this lab?
15. Do you think you will use ML again? For which type(s) of project(s)?

# Submission

Each student will complete and submit this assignment individually. Do not consult with others. However, you are encouraged to use the internet to learn ML **but not to research the questions asked in this lab.**

Comment your program appropriately.

Save the final version of your program as `[lastname]_[firstname].ml_lab.ml` Type your lab questions in plain text as `[lastname]_[firstname].ml_lab.questions.txt`. Include your name in the text file.

Submit your files to the ML Lab dropbox folder on BrightSpace. Do not archive your files but instead use two attachments. Submit your files before the due date as late submissions will not be accepted.

# Grading

Total Assignment Points: 100, Total Grade Points: 7.5

The rubric for this assignment is as follows:
* 5 points each for questions 1 - 15, Total 75 points
  - Questions 1, 5, 7, 9, and 10 will be graded all or nothing
  - Questions 11 - 15, will be given full credit for reasonable answers
  - The remaining questions will be graded with partial credit
* 15 points for working code, with no errors: All or nothing
* 10 points for documented code
  - 2 points per function: `isMember`, `list2Set`, `union`, and `intersect` commented with a good description of what the function does
  - 2 points for header
