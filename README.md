# thomas_experiments

To generate Gappa file, run: 
```
ocaml Gappa.ml > thomas.g
```

To run Gappa script, run:
```
gappa -Bcoq thomas.g > thomas.v
```

The `thomas.v` file contains a certificate in Coq.

The theta_1 and theta_2 intervals can be changed inside the Gappa file at the following location:
```
print "{t_1  in [1, 1] -> t_2 in [1, 1] -> p in ?}";
```
