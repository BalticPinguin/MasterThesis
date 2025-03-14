p=3.14159265
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

r(x,y,z)=sqrt(x*x+y*y+z*z)
Radial(r,k,l)=exp(-sqrt(-1)*r*k)*(2*k*r)**l * F_1(1+l+sqrt(-1)/k, 2*l+2, sqrt(-1)*k*r)  /(2*k)**l
pm_Polynom(l,m,x)=l==0 ? 1 : l==1 ? (m==0? x : sqrt(1-x*x) ):  \
  l==2 ?( m==0 ? 0.5*(3*x*x-1) : m==1 ? 3*x*sqrt(1-x*x) : 3*(1-x*x) ) : \
  l==3 ?( m==0 ? 0.5*(5*x*x -3)*x : m==1 ? 1.5*sqrt(1-x*x)*(5*x*x-1) : m==2 ? 15*(1-x*x)*x : 15*(1-x*x)*sqrt(1-x*x) ) : \
  l==4 ?( m==0 ? (3+(-30+35*x*x)*x*x)/6.: m==1 ? 2.5*sqrt(1-x*x)*(7*x*x-3)*x : m==2 ? 7.5*(1-x*x)*x*(7*x*x-1) : m==3 ? 105*x*(1-x*x)*sqrt(1-x*x) : 105*(1-x*x)*(1-x*x) ) : \
        ( m==0 ? (15+(-70+63*x*x)*x*x)*x/8: m==1 ? 0 : m==2 ? 0: m==3 ? 0: m==4 ?  0: 0)

SpherHarm(theta,phi,l,m)=pm_Polynom(l,m,theta) #*exp(sqrt(-1)*phi*m)


#set palette defined ( 0 '#B35806',\
#                      1 '#E08214',\
#                      2 '#FDB863',\
#                      3 '#FEE0B6',\
#                      4 '#D8DAEB',\
#                      5 '#B2ABD2',\
#                      6 '#8073AC',\
#                      7 '#542788' )

set palette defined ( 0 '#000000',\
                      1 '#542788',\
                      2 '#FAFAFF',\
                      3 '#B35806',\
                      4 '#D90902')
Z=1
k=1.063

set term pdf size 8,8 font "Amiri, 32"
set termopt enhanced
set output "CoulombPlane3.pdf"

#load 'dark2.map'

set xtics offset 0.0, 0.8
set ylabel offset 1.0, 0.0
set format y "%3.1f"
set key spacing 0.60

#set ylabel "wave function"

set xrange [-10:10]
set yrange [-10:10]

set pm3d map
set style data pm3d
set style function pm3d
set isosamples 500
set samples 500
unset key

z=0
m=0
l=0
set palette defined ( -0.1 '#000000',\
                     -0.05 '#542788',\
                      0 '#FAFAFF',\
                      0.5 '#B35806',\
                      1 '#D90902')

set title "l=0, m=0"
sp real(Radial(r(x,y,z),k,l)*SpherHarm(z/r(x,y,z),atan2(y,x),l,m)*cos(atan2(y,x)*m))

m=1
set title "l=1, m=1"
sp real(Radial(r(x,y,z),k,l)*SpherHarm(z/r(x,y,z),atan2(y,x),l,m)*cos(atan2(y,x)*m))
set palette defined ( -1   '#000000',\
                      -.5  '#542788',\
                      0    '#FAFAFF',\
                      1.25 '#B35806',\
                      2.5  '#D90902')

l=2
m=0
set palette defined ( 0 '#000000',\
                      1 '#542788',\
                      2 '#FAFAFF',\
                      3 '#B35806',\
                      4 '#D90902')
set title "l=2, m=0"
sp real(Radial(r(x,y,z),k,l)*SpherHarm(z/r(x,y,z),atan2(y,x),l,m)*cos(atan2(y,x)*m))
m=2
set title "l=2, m=2"
sp real(Radial(r(x,y,z),k,l)*SpherHarm(z/r(x,y,z),atan2(y,x),l,m)*cos(atan2(y,x)*m))

l=3
m=1
set title "l=3, m=1"
sp real(Radial(r(x,y,z),k,l)*SpherHarm(z/r(x,y,z),atan2(y,x),l,m)*cos(atan2(y,x)*m))
m=3
set title "l=3, m=3"
sp real(Radial(r(x,y,z),k,l)*SpherHarm(z/r(x,y,z),atan2(y,x),l,m)*cos(atan2(y,x)*m))

l=4
m=0
set title "l=4, m=0"
sp real(Radial(r(x,y,z),k,l)*SpherHarm(z/r(x,y,z),atan2(y,x),l,m)*cos(atan2(y,x)*m))
m=2
set title "l=4, m=2"
sp real(Radial(r(x,y,z),k,l)*SpherHarm(z/r(x,y,z),atan2(y,x),l,m)*cos(atan2(y,x)*m))
m=4
set title "l=4, m=4"
sp real(Radial(r(x,y,z),k,l)*SpherHarm(z/r(x,y,z),atan2(y,x),l,m)*cos(atan2(y,x)*m))

#l=5
#m=0
#set title "l=5, m=0"
#sp real(Radial(r(x,y,z),k,l)*SpherHarm(z/r(x,y,z),atan2(y,x),l,m)*cos(atan2(y,x)*m))
