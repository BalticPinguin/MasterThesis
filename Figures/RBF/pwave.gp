p=3.14159265
factorial(n)= n>1? factorial(n-1)*n : n==1 ? 1 : 0
f(a,b,n)=n>0 ? a/b*f(a+1,b+1,n-1) : 1
F_1(a,b,c)= 1+f(a,b,1)*c+f(a,b,c,2)*c*c/2+\
              f(a,b,3 )*c**3 /factorial(3 )+f(a,b,4 )*c**4 /factorial(4)+\
              f(a,b,5 )*c**5 /factorial(5 )+f(a,b,6 )*c**6 /factorial(6 )+\
              f(a,b,7 )*c**7 /factorial(7 )+f(a,b,8 )*c**8 /factorial(8 )+\
              f(a,b,9 )*c**9 /factorial(9 )+f(a,b,10)*c**10/factorial(10)+\
              f(a,b,11)*c**11/factorial(11)+f(a,b,12)*c**12/factorial(12)+\
              f(a,b,13)*c**13/factorial(13)+f(a,b,14)*c**14/factorial(14)+\
              f(a,b,15)*c**15/factorial(15)+f(a,b,16)*c**16/factorial(16)+\
              f(a,b,17)*c**17/factorial(17)+f(a,b,18)*c**18/factorial(18)+\
              f(a,b,19)*c**19/factorial(19)+f(a,b,20)*c**20/factorial(20)+\
              f(a,b,21)*c**21/factorial(21)+f(a,b,22)*c**22/factorial(22)+\
              f(a,b,23)*c**23/factorial(23)+f(a,b,24)*c**24/factorial(24)+\
              f(a,b,25)*c**25/factorial(25)+f(a,b,26)*c**26/factorial(26)+\
              f(a,b,27)*c**27/factorial(27)+f(a,b,28)*c**28/factorial(28)+\
              f(a,b,29)*c**29/factorial(29)+f(a,b,30)*c**30/factorial(30)+\
              f(a,b,31)*c**31/factorial(31)+f(a,b,32)*c**32/factorial(32)+\
              f(a,b,33)*c**33/factorial(33)+f(a,b,34)*c**34/factorial(34)+\
              f(a,b,35)*c**35/factorial(35)+f(a,b,36)*c**36/factorial(36)+\
              f(a,b,37)*c**37/factorial(37)+f(a,b,38)*c**38/factorial(38)+\
              f(a,b,39)*c**39/factorial(39)+f(a,b,40)*c**40/factorial(40)+\
              f(a,b,41)*c**41/factorial(41)+f(a,b,42)*c**42/factorial(42)+\
              f(a,b,43)*c**43/factorial(43)+f(a,b,44)*c**44/factorial(44)+\
              f(a,b,45)*c**45/factorial(45)+f(a,b,46)*c**46/factorial(46)+\
              f(a,b,47)*c**47/factorial(47)+f(a,b,48)*c**48/fctorial(48)+\
              f(a,b,49)*c**49/factorial(49)+f(a,b,50)*c**50/factorial(50)\
              f(a,b,51)*c**51/factorial(51)+f(a,b,52)*c**52/factorial(52)\
              f(a,b,53)*c**53/factorial(53)+f(a,b,54)*c**54/factorial(54)\
              f(a,b,55)*c**55/factorial(55)

r(x,y,z)=sqrt(x*x+y*y+z*z)
Radial(r,k,l)=exp(-sqrt(-1)*r*k)*(2*k*r)**l * F_1(1+l+sqrt(-1)/k, 2*l+2, 2*sqrt(-1)*k*r) /(2*k)**l
pm_Polynom(l,m,x)=l==0 ? 1 : l==1 ? (m==0? x : sqrt(1-x*x) ):  \
  l==2 ?( m==0 ? 0.5*(3*x*x-1) : m==1 ? 3*x*sqrt(1-x*x) : 3*(1-x*x) ) : \
  l==3 ?( m==0 ? 0.5*(5*x*x -3)*x : m==1 ? 1.5*sqrt(1-x*x)*(5*x*x-1) : m==2 ? 15*(1-x*x)*x : 15*(1-x*x)*sqrt(1-x*x) ) : \
  l==4 ?( m==0 ? (3+(-30+35*x*x)*x*x)/6.: m==1 ? 2.5*sqrt(1-x*x)*(7*x*x-3)*x : m==2 ? 7.5*(1-x*x)*x*(7*x*x-1) : m==3 ? 105*x*(1-x*x)*sqrt(1-x*x) : 105*(1-x*x)*(1-x*x) ) : \
        ( m==0 ? (15+(-70+63*x*x)*x*x)*x/8: m==1 ? 0 : m==2 ? 0: m==3 ? 0: m==4 ?  0: 0)

SpherHarm(theta,phi,l,m)=pm_Polynom(l,m,theta) #*exp(sqrt(-1)*phi*m)

Z=1
k=.2575919

set term pdf size 8,8 font "Amiri, 36"
set termopt enhanced
set output "P-Wave.pdf"

#load 'dark2.map'

set xtics offset 0.0, 0.8
#set ylabel offset 1.0, 0.0
#set xlabel offset .0, 1.0
#set format y "%.0f"
#set key spacing 0.60

set bmargin 0
set tmargin 0
set rmargin 0
set lmargin 0

#set ylabel "wave function"

set xrange [-22.:22.]
set yrange [-22.:22.]
#et xrange [-24.8:24.8]
#set yrange [-24.8:24.8]

set pm3d map
set style data pm3d
set style function pm3d
set isosamples 600
set samples 600
unset key

#set palette defined (-1 "#10437b", -0.8 "#317bb2", -0.25 "#a8cddf" , 0 "white", 0.25 "#f4e1d6", 0.8 "#c03b3b", 1 "#8b0c24")
set palette defined (-0.6 "#6b011f", -0.4 "#ae172a", -0.3 "#e17962", 0.0 "#FFFFFF", 0.3 "#a0cce2", 0.4 "#3f8ec0", 0.5 "#0f437b", 0.6 "#063264")

z=0
l=1
m=-1
sp real(Radial(r(y,x,z),k,l)*SpherHarm(z/r(y,x,z),atan2(x,y),l,m)*cos(atan2(x,y)*m))
