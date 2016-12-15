
load 'dark2.map'
k=1
Z=1
l=0
p=3.14159265
set xtics offset 0.0, 0.8
set ylabel offset 1.0, 0.0
set format y "%3.1f"
set key spacing 0.60
factorial(n)= n>1? factorial(n-1)*n : n==1 ? 1 : 0
f(a,b,c,n)=n>0 ? a/b*f(a+1,b+1,c,n-1) : 1
F_1(a,b,c)= 1+f(a,b,c,1)*c+f(a,b,c,2)*c*c/2+\
              f(a,b,c,3 )*c**3 /factorial(3 )+f(a,b,c,4 )*c**4 /factorial(4)+\
              f(a,b,c,5 )*c**5 /factorial(5 )+f(a,b,c,6 )*c**6 /factorial(6 )+\
              f(a,b,c,7 )*c**7 /factorial(7 )+f(a,b,c,8 )*c**8 /factorial(8 )+\
              f(a,b,c,9 )*c**9 /factorial(9 )+f(a,b,c,10)*c**10/factorial(10)+\
              f(a,b,c,11)*c**11/factorial(11)+f(a,b,c,12)*c**12/factorial(12)+\
              f(a,b,c,13)*c**13/factorial(13)+f(a,b,c,14)*c**14/factorial(14)+\
              f(a,b,c,15)*c**15/factorial(15)+f(a,b,c,16)*c**16/factorial(16)+\
              f(a,b,c,17)*c**17/factorial(17)+f(a,b,c,18)*c**18/factorial(18)+\
              f(a,b,c,19)*c**19/factorial(19)+f(a,b,c,20)*c**20/factorial(20)+\
              f(a,b,c,21)*c**21/factorial(21)+f(a,b,c,22)*c**22/factorial(22)+\
              f(a,b,c,23)*c**23/factorial(23)+f(a,b,c,24)*c**24/factorial(24)+\
              f(a,b,c,25)*c**25/factorial(25)+f(a,b,c,26)*c**26/factorial(26)+\
              f(a,b,c,27)*c**27/factorial(27)+f(a,b,c,28)*c**28/factorial(28)+\
              f(a,b,c,29)*c**29/factorial(29)+f(a,b,c,30)*c**30/factorial(30)+\
              f(a,b,c,31)*c**31/factorial(31)+f(a,b,c,32)*c**32/factorial(32)+\
              f(a,b,c,33)*c**33/factorial(33)+f(a,b,c,34)*c**34/factorial(34)+\
              f(a,b,c,35)*c**35/factorial(35)+f(a,b,c,36)*c**36/factorial(36)+\
              f(a,b,c,37)*c**37/factorial(37)+f(a,b,c,38)*c**38/factorial(38)+\
              f(a,b,c,39)*c**39/factorial(39)+f(a,b,c,40)*c**40/factorial(40)

set term pdf size 30,16 font "Amiri, 60"
set output "RadialPart.pdf" 
set xrange [0:15]

set yrange [-0.4:1]
set nokey

set multiplot
set ylabel "wave function"

set style line 1 lw 7
set style line 2 lw 7
set style line 3 lw 7

set origin 0.0, 0.43
set size 0.373, 0.57
set label 1 at 10, 0.9 font ",100"
set label 1 "k=1.0"
p sin(k*x)/(k*x) ls 1 t "Spherical, l=0", \
  real(exp(-sqrt(-1)*x*k)*(2*k*x)**l * F_1(1+l+sqrt(-1)/k, 2*l+2, sqrt(-1)*k*x) ) ls 2 t "real(Coulomb), l=0",\
  imag(exp(-sqrt(-1)*x*k)*(2*k*x)**l * F_1(1+l+sqrt(-1)/k, 2*l+2, sqrt(-1)*k*x) ) ls 3 t "imag(Coulomb), l=0"

set ylabel ""
set ytics 0.2
set ytics format " "
set origin 0.353, 0.43
set size 0.333, 0.57
set label 1 ""
l=1
p sin(k*x)/(k*x)**2-cos(k*x)/(k*x) ls 1 t "Spherical, l=1", \
  real(exp(-sqrt(-1)*x*k)*(2*x)**l * F_1(1+l+sqrt(-1)/k, 2*l+2, sqrt(-1)*k*x)/factorial(2*l+1) ) ls 2 t "real(Coulomb), l=1",\
  imag(exp(-sqrt(-1)*x*k)*(2*x)**l * F_1(1+l+sqrt(-1)/k, 2*l+2, sqrt(-1)*k*x)/factorial(2*l+1) ) ls 3 t "imag(Coulomb), l=1"

set origin 0.667, 0.43
set size 0.333, 0.57
set key
l=2
p sin(k*x)*(3/(k*x)**3-1/(k*x))-3*cos(x*k)/(k*x)**2 ls 1 t "Spherical", \
  real(exp(-sqrt(-1)*x*k)*(2*x)**l * F_1(1+l+sqrt(-1)/k, 2*l+2, sqrt(-1)*k*x)/factorial(2*l+1) ) ls 2 t "real(Coulomb)",\
  imag(exp(-sqrt(-1)*x*k)*(2*x)**l * F_1(1+l+sqrt(-1)/k, 2*l+2, sqrt(-1)*k*x)/factorial(2*l+1) ) ls 3 t "imag(Coulomb)"


k=0.1
l=0
set format y "%3.1f"
set ylabel "wave function"
set nokey
set xrange [0:45]
set origin 0.0, -0.07
set size 0.373, 0.57
set label 1 at 30, 0.9 font ",100"
set label 1 "k=0.1"
p sin(k*x)/(k*x) ls 1 t "Spherical, l=0", \
  real(exp(-sqrt(-1)*x*k)*(2*x)**l * F_1(1+l+sqrt(-1)/k, 2*l+2, sqrt(-1)*k*x) ) ls 2 t "real(Coulomb), l=0",\
  imag(exp(-sqrt(-1)*x*k)*(2*x)**l * F_1(1+l+sqrt(-1)/k, 2*l+2, sqrt(-1)*k*x) ) ls 3 t "imag(Coulomb), l=0"

set ylabel ""
set ytics 0.2
set ytics format " "
set origin 0.353, -0.07
set size 0.333, 0.57
l=1
set label 1 ""
p sin(k*x)/(k*x)**2-cos(k*x)/(k*x) ls 1 t "Spherical, l=1", \
  real(exp(-sqrt(-1)*x*k)*(2*x)**l * F_1(1+l+sqrt(-1)/k, 2*l+2, sqrt(-1)*k*x)/factorial(2*l+1) ) ls 2 t "real(Coulomb), l=1",\
  imag(exp(-sqrt(-1)*x*k)*(2*x)**l * F_1(1+l+sqrt(-1)/k, 2*l+2, sqrt(-1)*k*x)/factorial(2*l+1) ) ls 3 t "imag(Coulomb), l=1"

set origin 0.667, -0.07
set size 0.333, 0.57
set key
l=2
p sin(k*x)*(3/(k*x)**3-1/(k*x))-3*cos(x*k)/(k*x)**2 ls 1 t "Spherical", \
  real(exp(-sqrt(-1)*x*k)*(2*x)**l * F_1(1+l+sqrt(-1)/k, 2*l+2, sqrt(-1)*k*x)/factorial(2*l+1) ) ls 2 t "real(Coulomb)",\
  imag(exp(-sqrt(-1)*x*k)*(2*x)**l * F_1(1+l+sqrt(-1)/k, 2*l+2, sqrt(-1)*k*x)/factorial(2*l+1) ) ls 3 t "imag(Coulomb)"
