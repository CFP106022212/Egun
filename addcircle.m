function output = addcircle(x,y,x0,y0,angle,position,type)
    R = (x-x0)^2+(y-y0)^2;
    theta0 = rad2deg(atan2(y-y0,x-x0));
    output = [0,0,0,1,1,-R,x-sqrt(R),x+sqrt(R),y-sqrt(R),y+sqrt(R),theta0,angle,position,type];
end