(***************************************************************
*
* CSCI 305 - ML Programming Lab
*
* Isaac Griffith
* isaac.griffith@msu.montana.edu
*
***************************************************************)

fun f [] = [] (* a *)
  | f (x::xs) = (x + 1) :: (f xs); (* b *)

(*Question 1 *)
print "\nQuestion 1:";
f [3, 1, 4, 1, 5, 9];
print "\n";

(* Data Type which defines the Set as being either Empty or Composed with a given element *)
datatype 'element set =
  Empty |
  Set of 'element * 'element set;

(* Simple function to stringify the contents of a Set of characters *)
fun stringifyCharSet Empty = ""
  | stringifyCharSet (Set(y, ys)) = Char.toString(y) ^ " " ^ stringifyCharSet(ys);

(* Simple function to stringify the contents of a Set of ints *)
fun stringifyIntSet Empty = ""
  | stringifyIntSet (Set(w, ws)) = Int.toString(w) ^ " " ^ stringifyIntSet(ws);

(* Simple function to stringify the contents of a Set of strings *)
fun stringifyStringSet Empty = ""
  | stringifyStringSet (Set(z, zs)) = z ^ " " ^ stringifyStringSet(zs);

(* Simple function that prints a set of integers *)
fun print_int x = print ("{ " ^ stringifyIntSet(x) ^ "}\n");

(* Simple function that prints a set of strings *)
fun print_str x = print ("{ " ^ stringifyStringSet(x) ^ "}\n");

(* Simple function that prints a set of characters *)
fun print_chr x = print ("{ " ^ stringifyCharSet(x) ^ "}\n");

(* Function which tests whether e is an element of a Set *)
fun isMember e Empty = false
  | isMember e (Set(x, xs)) =
      if e = x then true
      else isMember e xs;

(* Function which constructs a set from a list *)
fun list2Set [] = Empty
  | list2Set (x::xs) =
      let
        val y = list2Set xs
      in
        if (isMember x y) then y
        else Set (x, y)
      end;

list2Set [1, 3, 2];
list2Set [#"a", #"b", #"c"];
list2Set [];
list2Set [6, 2, 2];
list2Set ["x", "y", "z", "x"];

(* Question 5 *)
val quest5 = isMember "one" (list2Set ["1", "2", "3", "4"]);
print ("\nQuestion 5: " ^ Bool.toString(quest5) ^ "\n");

(* Question 7 *)
val quest7 = list2Set ["it", "was", "the", "best", "of", "times,", "it", "was", "the", "worst", "of", "times"];
print "\nQuestion 7: ";
print_str quest7;
print "\n";

(* Function which computes the union of two sets *)
fun union Empty Empty = Empty
  | union set1 Empty = set1
  | union Empty set2 = set2
  | union (Set(x, xs)) y =
      let
        val z = union xs y
      in
        if not(isMember x z) then Set (x, z)
        else z
      end;

(* Funtion which computes the intersection of two sets *)
fun intersect Empty Empty = Empty
  | intersect set1 Empty = Empty
  | intersect Empty set2 = Empty
  | intersect (Set(x, xs)) y =
      if (isMember x y) then Set(x, (intersect xs y))
      else intersect xs y;

(* Question 9 *)
print "\nQuestion 9: ";
print_str (union (list2Set ["green", "eggs", "and"]) (list2Set ["ham"]));

(* Question 10 *)
print "\nQuestion 10: ";
print_str (intersect (list2Set ["stewed", "tomatoes", "and", "macaroni"]) (list2Set ["macaroni", "and", "cheese"]));
