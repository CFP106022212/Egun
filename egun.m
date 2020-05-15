clc;clear;

fi=fopen('15.0kV.txt','r');
vol = zeros(10,1);
boundary = zeros(10,5);
emit = zeros(10,9);
for i = 1:6000
    a = fgets(fi);
    a = a(find(~isspace(a)));
    if strcmp(a, convertStringsToChars("BZA="))
        break
    end
end 

for i=1:6000
    a = fgets(fi);
    if length(a) == 2
        break;
    else
        vol(i) = sscanf(a,'%f');
    end
end 
a = fgets(fi);

for i=1:6000
    a = fgets(fi);
    if length(a) == 2
        break;
    else
        boundary(i,:) = sscanf(a,'%f')';
    end
end 

for i = 1:6000
    a = fgets(fi);
    a = a(find(~isspace(a)));
    if strcmp(a, convertStringsToChars("&end"))
        break
    end
end 

for i=1:6000
    a = fgets(fi);
    if length(a) == 1
        break;
    else
        emit(i,:) = sscanf(a,'%f')';
    end
end 




loc = zeros(length(boundary),3);
k   = 1;
for i = 1:length(boundary)
    if boundary(i,4)==2
        loc(k,:)   = [boundary(i,1) boundary(i,2)               boundary(i,3)+boundary(i,5)];
        k = k+1;
    elseif boundary(i,5)==2
        loc(k,:)   = [boundary(i,1) boundary(i,2)+boundary(i,4) boundary(i,3)];
        k = k+1;
    else
        loc(k,:)   = [boundary(i,1) boundary(i,2)+boundary(i,4) boundary(i,3)];
        loc(k+1,:) = [boundary(i,1) boundary(i,2)               boundary(i,3)+boundary(i,5)];
        k = k+2;
    end
end
type       = loc(:,1);
pos_loc    = loc(type==1,:);
neg_loc    = loc(type==2,:);
blank_loc  = loc(type==0,:);

scatter(pos_loc(:,3),pos_loc(:,2));hold on;
scatter(neg_loc(:,3),neg_loc(:,2));
scatter(blank_loc(:,3),blank_loc(:,2));
scatter(boundary(:,3),boundary(:,2));
grid on;
axis equal;

save('pos.mat','pos_loc');
save('neg.mat','neg_loc');
save('blank.mat','blank_loc');