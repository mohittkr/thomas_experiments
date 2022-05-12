let m = 32
let si = string_of_int
let  p = si 64

let print s = print_string s

let () = 
    print "  @rnd = float<ieee_64, ne>;\n";

    for i = 1 to (m-1) do
        print ("  a_" ^ (si i) ^ " rnd= -2 - 2 * (t_1 * " ^ 
            (si i) ^ ") / " ^ (si m) ^ ";\n");
    done;
    for i = 2 to (m-1) do
        print ("  b_" ^ (si i) ^ " rnd= 1 + (t_1 * " ^ 
            (string_of_float (float_of_int i -. 0.5)) ^ ") / " ^ (si m) ^ ";\n");
    done;
    for i = 1 to (m-2) do
        print ("  c_" ^ (si i) ^ " rnd= 1 + (t_1 * " ^ 
            (string_of_float (float_of_int i +. 0.5)) ^ ") / " ^ (si m) ^ ";\n");
    done;

    print "\n  alpha_1 rnd= a_1;\n";
    for i = 2 to (m-1) do
        print ("  beta_" ^ (si i) ^ " rnd= b_" ^  (si i) ^ " / alpha_" ^ (si (i-1)) ^ ";\n");
        print ("  alpha_" ^ (si i) ^ " rnd= a_" ^  (si i) ^ " - b_" ^ (si i) ^ " * c_" ^ (si (i-1)) ^ ";\n");
    done;

    print "\n  f rnd= -50 * t_2 * t_2;\n";

    print "\n  y_1 rnd= f;\n";
    for i = 2 to (m-1) do
        print ("  y_" ^ (si i) ^ " rnd= f - beta_" ^ (si i) ^ " * y_" ^ (si (i-1)) ^ ";\n");
    done;

    print ("\n  u_" ^ (si (m-1)) ^ " rnd= y_" ^ (si (m-1)) ^ " / alpha_" ^ (si (m-1)) ^ ";\n");
    for i = m-2 downto 1 do
        print ("  u_" ^ (si i) ^ " rnd= y_" ^ (si i) ^ " / alpha_" ^ (si i) ^ 
                " - c_" ^ (si i) ^ " * (u_" ^ (si (i+1)) ^ " / alpha_" ^ (si i) ^ ");\n");
    done;

    print "  p rnd= ";
    for i = 1 to (m-2) do
        print ( "u_" ^ (si i) ^ "/ " ^ (si m) ^ " + ");
    done;
    print (" u_" ^ (si (m-1)) ^ " / " ^ (si m) ^ ";\n");

    print "{t_1  in [0.1, 0.1] -> t_2 in [0.5, 0.5] -> p in ?}";
    