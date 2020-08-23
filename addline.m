function output = addline(x,y,len,angle,position,type)
    if angle == 90 || angle == 270 || angle == -90
        y0 = y + len*sin(angle/180*pi);
        ymin = min([y,y0]);
        ymax = max([y,y0]);
        output = [0,0,0,0,1,-x,x-1,x+1,ymin,ymax,0,360,position,type];
    else
        a  = tan(angle/180*pi);
        b  = y-a*x;
        x0 = x+len*cos(angle/180*pi);
        y0 = y+len*sin(angle/180*pi);
        xmin = min([x,x0]);
        ymin = min([y,y0]);
        xmax = max([x,x0]);
        ymax = max([y,y0]);
        output = [0,0,0,-1,a,b,xmin,xmax,ymin,ymax,0,360,position,type];
    end
end