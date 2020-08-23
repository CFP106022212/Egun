function output = addcircle(x,y,x0,y0,tmin,tmax,position,type)
    R = (x-x0)^2+(y-y0)^2;
    output = [1,1,0,-2*x0,-2*y0,-R+x0^2+y0^2,x0-sqrt(R),x0+sqrt(R),y0-sqrt(R),y0+sqrt(R),tmin,tmax,position,type];
end