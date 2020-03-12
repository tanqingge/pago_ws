clear;
clc;
tic;
Pogo_Param;
m=(x_max-x_min)/2+1;
n=(y_max-y_min)/2+1;
l=(z_max-z_min)/2+1;
w_s=cell(m,n,l);
for i=1:m
    for j=1:n
        for k=1:l
            w_s{i,j,k}=[x_min+2*(i-1);y_min+2*(j-1);z_min+2*(k-1)];
        end  
    end
end
Occugrid=zeros(m,n,l);
orient=[0,0,0];
for k=1:l
    for i=1:m
        for j=1:n
            trans=w_s{i,j,k};
            [attach_NP,angle_NP]=Calculate_angle(orient,trans,attach_P,attach_B,oriegn_height);
            %[distance] = caculate_distance(Arm,attach_B);
            max_mx=max(attach_NP(1,:));
            max_my=max(attach_NP(2,:));
            max_mz=max(attach_NP(3,:))-oriegn_height(3,1);
            min_mx=min(attach_NP(1,:));
            min_my=min(attach_NP(2,:));
            min_mz=min(attach_NP(3,:))-oriegn_height(3,1);
            max_angle_P=max(angle_NP);
            min_angle_P=min(angle_NP);
            if (max_mx<=x_max)&&(min_mx>=x_min)...
                &&(max_my<=y_max)&&(min_my>=y_min)...
                &&(max_mz<=z_max)&&(min_mz>=z_min)...
                &&(max_angle_P<=angle_P)...
                &&(min_angle_P>=-angle_P)
                Occugrid(i,j,k)=1;
            end
        end
    end
end
toc;


