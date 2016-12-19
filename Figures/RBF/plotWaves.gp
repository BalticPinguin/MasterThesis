k=1
#p besj0(k*x) t "j_0"

# bessel
p sin(k*x)/(k*x) , sin(k*x)/(k*x)**2-cos(k*x)/(k*x), sin(k*x)*(3/(k*x)**3-1/(k*x))-3cos(x*k)/(k*x)**2

p besj1(k*x) t "j_1"

f(a,b,c,n)= for [i=0:n] '*' (a+i)/(b+i)
F_1(a,b,c)=(sum [n=0:30] f(a,b,c,n)*c**n/factorial(n))

#Coulomb
p  exp(-pi*Z/(2*k)) gamma(1+i*Z/k)/gamma(2)*e^(i*x*k) * F_1(1+)

# Coul 0k
#p  (2*k*x)**l*exp(-pi*Z/(2*k)) gamma(l+1+i*Z/k)/gamma(2*l+2)*e^(i*x*k)* factorial(2*l+1)*(2*x)**(-l-0.5)*J_{2l+1}(sqrt(8*x))
p  exp(-pi*Z/(2*k)) gamma(1+i*Z/k)/gamma(2)*e^(i*x*k)/sqrt(2*x)*J_{1}(sqrt(8*x))
