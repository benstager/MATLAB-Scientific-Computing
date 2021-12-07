function e = eulerMethod(f,a,b,ya,n)

h = (b-a)/n;
x = (a:h:b)';
y = (0:n)';

y(1) = ya;

for i = 1:n
    y(i+1) = y(i)+h*f(x(i),y(i));
    x = x+h;
    
end
x = x - b
y

plot(x,y)
