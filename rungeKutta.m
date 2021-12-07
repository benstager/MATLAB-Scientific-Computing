function u = rungeKutta(f,y0, x0,h, xend)
v1 = h*f(x0,y0);
v2 = h*f(x0+(1/2)*h,y0+(1/2)*v1);
v3 = h*f(x0+h, y0+2*v2-v1);

y = y0;
x = x0;

while x <= xend
    y = y + 1/6*(v1+4*v2+v3);
    x = x + h;
end


y