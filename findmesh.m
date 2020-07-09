function output = findmesh(data)
a = data(1);
b = data(2);
c = data(3);
d = data(4);
e = data(5);
f = data(6);
xmin = data(7);
xmax = data(8);
ymin = data(9);
ymax = data(10);
meshpoint = zeros(2,2);
i = 1;

for x=floor(xmin):1:ceil(xmax)
    a1 = b;
    b1 = c*x+e;
    c1 = d*x+f+a*x^2;
    if a1~=0
        if b1^2-4*a1*c1>0
            if (-b1+sqrt(b1^2-4*a1*c1))/2/a1<ymax
                meshpoint(i,:) = [x,floor((-b1+sqrt(b1^2-4*a1*c1))/2/a1)];
                i = i+1;
                if ceil((-b1+sqrt(b1^2-4*a1*c1))/2/a1)<ymax
                    meshpoint(i,:) = [x,ceil((-b1+sqrt(b1^2-4*a1*c1))/2/a1)];
                    i = i+1;
                end
            end 
            if (-b1-sqrt(b1^2-4*a1*c1))/2/a1>ymin
                meshpoint(i,:) = [x,ceil((-b1-sqrt(b1^2-4*a1*c1))/2/a1)];
                i = i+1;
                if floor((-b1-sqrt(b1^2-4*a1*c1))/2/a1)>ymin
                    meshpoint(i,:) = [x,floor((-b1-sqrt(b1^2-4*a1*c1))/2/a1)];
                    i = i+1;
                end
            end 
        end
    else
        result = -c1/b1;
        if ceil(result)<=ymax
            meshpoint(i,:) = [x,ceil(result)];
            i = i+1;
        end
        if floor(result)>=ymin
            meshpoint(i,:) = [x,floor(result)];
            i = i+1;
        end
    end
end
for y=floor(ymin):1:ceil(ymax)
    a1 = a;
    b1 = c*y+d;
    c1 = b*y^2+e*y+f;
    if a1~=0
        if b1^2-4*a1*c1>0
            if (-b1+sqrt(b1^2-4*a1*c1))/2/a1<xmax
                meshpoint(i,:) = [floor((-b1+sqrt(b1^2-4*a1*c1))/2/a1),y];
                i = i+1;
                if ceil((-b1+sqrt(b1^2-4*a1*c1))/2/a1)<xmax
                    meshpoint(i,:) = [ceil((-b1+sqrt(b1^2-4*a1*c1))/2/a1),y];
                    i = i+1;
                end
            end 
            if (-b1-sqrt(b1^2-4*a1*c1))/2/a1>xmin
                meshpoint(i,:) = [ceil((-b1-sqrt(b1^2-4*a1*c1))/2/a1),y];
                i = i+1;
                if floor((-b1-sqrt(b1^2-4*a1*c1))/2/a1)>xmin
                    meshpoint(i,:) = [floor((-b1-sqrt(b1^2-4*a1*c1))/2/a1),y];
                    i = i+1;
                end
            end 
        end
    else
        result = -c1/b1;
        if ceil(result)<=xmax
            meshpoint(i,:) = [ceil(result),y];
            i = i+1;
        end
        if floor(result)>=xmin
            meshpoint(i,:) = [floor(result),y];
            i = i+1;
        end
    end
end 
meshpoint = unique(meshpoint,'rows','stable');
datafram  = zeros(length(meshpoint),5);
for i = 1:length(meshpoint)
    datafram(i,1:2) = meshpoint(i,:);
    x  = datafram(i,1);
    y  = datafram(i,2);
    
    a1 = b;
    b1 = c*x+e;
    c1 = d*x+f+a*x^2;
    if a1==0
        result = -c1/b1;
        if abs(result-y)<1
            datafram(i,4) = result-y;
        else
            datafram(i,4) = 2;
        end
    else
        if abs((-b1+sqrt(b1^2-4*a1*c1))/2/a1-y)<=abs((-b1-sqrt(b1^2-4*a1*c1))/2/a1-y) && abs((-b1+sqrt(b1^2-4*a1*c1))/2/a1-y)<1
            datafram(i,4) = (-b1+sqrt(b1^2-4*a1*c1))/2/a1-y;
        elseif abs((-b1-sqrt(b1^2-4*a1*c1))/2/a1-y)<abs((-b1+sqrt(b1^2-4*a1*c1))/2/a1-y) && abs((-b1-sqrt(b1^2-4*a1*c1))/2/a1-y)<1
            datafram(i,4) = (-b1-sqrt(b1^2-4*a1*c1))/2/a1-y;
        else
            datafram(i,4) = 2;
        end
    end
    
    a1 = a;
    b1 = c*y+d;
    c1 = b*y^2+e*y+f;
    if a1==0
        result = -c1/b1;
        if abs(result-x)<1
            datafram(i,3) = result-x;
        else
            datafram(i,3) = 2;
        end
    else
        if abs((-b1+sqrt(b1^2-4*a1*c1))/2/a1-x)<=abs((-b1-sqrt(b1^2-4*a1*c1))/2/a1-x) && abs((-b1+sqrt(b1^2-4*a1*c1))/2/a1-x)<1
            datafram(i,3) = (-b1+sqrt(b1^2-4*a1*c1))/2/a1-x;
        elseif abs((-b1-sqrt(b1^2-4*a1*c1))/2/a1-x)<abs((-b1+sqrt(b1^2-4*a1*c1))/2/a1-x) && abs((-b1-sqrt(b1^2-4*a1*c1))/2/a1-x)<1
            datafram(i,3) = (-b1-sqrt(b1^2-4*a1*c1))/2/a1-x;
        else
            datafram(i,3) = 2;
        end
    end
end
for i = 1:length(datafram)
    x = datafram(i,1);
    y = datafram(i,2);
    datafram(i,5) = a*x^2+b*y^2+c*x*y+d*x+e*y+f;
end
switch data(11)
    case 1
        datafram = datafram(datafram(:,4)<=0&datafram(:,4)~=2,1:4);
    case 2
        datafram = datafram(datafram(:,4)>=0&datafram(:,4)~=2,1:4);
    case 3
        datafram = datafram(datafram(:,3)>=0&datafram(:,3)~=2,1:4);
    case 4
        datafram = datafram(datafram(:,3)<=0&datafram(:,3)~=2,1:4);
    case 5
        datafram = datafram(datafram(:,5)<=0,1:4);
    case 6
        datafram = datafram(datafram(:,5)>=0,1:4);
end
output = datafram;
