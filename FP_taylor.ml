let m = 32
let si = string_of_int
let  p = si 64

let print s = print_string s

let () = 
    print "Variables\n";
    print "  real t_1 in [1,1];\n";
    print "  real t_2 in [1,1];\n";
    print "\n";
    print "Expressions\n";

    for i = 1 to (m-1) do
        print ("  a_" ^ (si i) ^ " rnd64= -2 - 2 * (t_1 * " ^ 
            (si i) ^ ") / " ^ (si m) ^ ";\n");
    done;
    for i = 2 to (m-1) do
        print ("  b_" ^ (si i) ^ " rnd64= 1 + (t_1 * " ^ 
            (string_of_float (float_of_int i -. 0.5)) ^ ") / " ^ (si m) ^ ";\n");
    done;
    for i = 1 to (m-2) do
        print ("  c_" ^ (si i) ^ " rnd64= 1 + (t_1 * " ^ 
            (string_of_float (float_of_int i +. 0.5)) ^ ") / " ^ (si m) ^ ";\n");
    done;

    print "\n  alpha_1 rnd64= a_1;\n";
    for i = 2 to (m-1) do
        print ("  beta_" ^ (si i) ^ " rnd64= b_" ^  (si i) ^ " / alpha_" ^ (si (i-1)) ^ ";\n");
        print ("  alpha_" ^ (si i) ^ " rnd64= a_" ^  (si i) ^ " - beta_" ^ (si i) ^ " * c_" ^ (si (i-1)) ^ ";\n");
    done;

    print "\n  f rnd64= -50 * t_2 * t_2;\n";

    print "\n  y_1 rnd64= f;\n";
    for i = 2 to (m-1) do
        print ("  y_" ^ (si i) ^ " rnd64= f - beta_" ^ (si i) ^ " * y_" ^ (si (i-1)) ^ ";\n");
    done;

    print ("\n  u_" ^ (si (m-1)) ^ " rnd64= y_" ^ (si (m-1)) ^ " / alpha_" ^ (si (m-1)) ^ ";\n");
    for i = m-2 downto 1 do
        print ("  u_" ^ (si i) ^ " rnd64= y_" ^ (si i) ^ " / alpha_" ^ (si i) ^ 
                " - c_" ^ (si i) ^ " * (u_" ^ (si (i+1)) ^ " / alpha_" ^ (si i) ^ ");\n");
    done;

    print "  p rnd64= ";
    for i = 1 to (m-2) do
        print ( "u_" ^ (si i) ^ "/ " ^ (si m) ^ " + ");
    done;
    print (" u_" ^ (si (m-1)) ^ " / " ^ (si m) ^ ";\n");



