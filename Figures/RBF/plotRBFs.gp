
set term pdf size 8,6 font ",20"
set output "RBFerror.pdf"

set xrange [-1:3]

unset xtics 
set ytics 0.2

set multiplot
set origin 0.0, 0.662
set size 1.0, 0.36
p exp(-x*x) t "Psi_1" ,exp(-(x-1.0)*(x-1.0)) t "Psi_2", (exp(-x*x)+ exp(-(x-1.0)*(x-1.0)))/(1+exp(-1.)) t "interpolation",\
 "imp" u (0):(1) w i lt 1 not,  "imp" u (1.):(1.0) w i lt 2 not

set yrange [0:1.1]
set origin 0.0, 0.381
set size 1.0, 0.36
p exp(-x*x) t "Psi_1" ,exp(-(x-1.5)*(x-1.5)) t "Psi_2", (exp(-x*x)+ exp(-(x-1.5)*(x-1.5)))/(1+exp(-2.25)) t "interpolation",\
 "imp" u (0):(1) w i lt 1 not,  "imp" u (1.5):(1) w i lt 2 not

set xtics
set xlabel "x [r_0]"
set origin 0.0, 0.0
set size 1.0, 0.46
p exp(-x*x) t "Psi_1" ,exp(-(x-2.0)*(x-2.0)) t "Psi_2", (exp(-x*x)+ exp(-(x-2.0)*(x-2.0)))/(1+exp(-4)) t "interpolation",\
 "imp" u (0):(1) w i lt 1 not, "imp" u (2.0):(1.0) w i lt 2 not

unset multiplot
