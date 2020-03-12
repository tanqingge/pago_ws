function [cnt] = whether_flexible(attach_NP,angle_NP,x_max,x_min,y_max,y_min,z_max,z_min,angle_P,oriegn_height)
%it is used to determine whether this point belongs to the flexible
%workspace
    cnt=0;
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
        cnt=1;
    end
end

