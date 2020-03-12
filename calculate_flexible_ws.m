clear;
clc;

Pogo_Param;
m=(x_max-x_min)/5+1;
n=(y_max-y_min)/5+1;
l=(z_max-z_min)/5+1;
w_s=cell(m,n,l);
for i=1:m
    for j=1:n
        for k=1:l
            w_s{i,j,k}=[x_min+5*(i-1);y_min+5*(j-1);z_min+5*(k-1)];
        end  
    end
end
Occugrid=zeros(m,n,l);
angle_blanking=pi/16;
pitch_angle=[-pitch_threhold:angle_blanking:pitch_threhold];
yaw_angle=[-yaw_threhold:angle_blanking:yaw_threhold];
roll_angle=[-roll_threhold:angle_blanking:roll_threhold];
angle_distri=cell(size(pitch_angle,2),size(yaw_angle,2),size(roll_angle,2));
for a1=1:size(pitch_angle,2)
    for a2=1:size(yaw_angle,2)
        for a3=1:size(roll_angle,2)
            angle_distri{a1,a2,a3}=[pitch_angle(a1),yaw_angle(a2),roll_angle(a3)];
        end
    end
end

sum_angle=size(pitch_angle,2)*size(yaw_angle,2)*size(yaw_angle,2);
for i=1:m
              
    for j=1:n
        for k=1:l
            trans=w_s{i,j,k};
            %cnt=0;
            count=zeros(1,sum_angle);
            parfor s=1:sum_angle
                orient=cell2mat(angle_distri(s));              
                [attach_NP,angle_NP]=Calculate_angle(orient,trans,attach_P,attach_B,oriegn_height);
%                 max_mx=max(attach_NP(1,:));
%                 max_my=max(attach_NP(2,:));
%                 max_mz=max(attach_NP(3,:))-oriegn_height(3,1);
%                 min_mx=min(attach_NP(1,:));
%                 min_my=min(attach_NP(2,:));
%                 min_mz=min(attach_NP(3,:))-oriegn_height(3,1);
%                 max_angle_P=max(angle_NP);
%                 min_angle_P=min(angle_NP);
%                 if (max_mx<=x_max)&&(min_mx>=x_min)...
%                         &&(max_my<=y_max)&&(min_my>=y_min)...
%                         &&(max_mz<=z_max)&&(min_mz>=z_min)...
%                         &&(max_angle_P<=angle_P)...
%                         &&(min_angle_P>=-angle_P)
%                     cnt=cnt+1;
%                 end
                cnt=whether_flexible(attach_NP,angle_NP,x_max,x_min,y_max,y_min,z_max,z_min,angle_P,oriegn_height);
                if cnt==1
                    count(s)=1;
                end
            end
            SUM_COUNT=sum(sum(count));
            if SUM_COUNT>=30
                Occugrid(i,j,k)=1;
            end 
            fprintf('i=%d',i);
            fprintf('j=%d',j);
            fprintf('k=%d',k);
            fprintf('\n');
        end
    end
          
end
  toc;   


