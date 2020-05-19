clc;clear;
a = 2;
b = 1;
xmin = 10;
xmax = 20;
y1 = xmin*a+b;
y2 = xmax*a+b;

k = 3;
tick = 1;
result = zeros(2,4);
for i = xmin:xmax
    for j = min([y1,y2]):max(y1,y2)
        if abs(j-i*a-b)<=1 && abs(i-(j-b)/a)<=1
            result(tick,1:2) = [i,j];
            result(tick,3:4) = [i-(j-b)/a,j-i*a-b];
            tick = tick+1;
        end 
    end 
end 

if k==1
    result = result(result(:,3)>=0,:);
elseif k==2
    result = result(result(:,3)<=0,:);
elseif k==3
    result = result(result(:,4)>=0,:);
elseif k==4
    result = result(result(:,4)<=0,:);
end 

x = xmin:0.01:xmax;
y = a*x+b;
plot(x,y);hold on;
scatter(result(:,1),result(:,2));
