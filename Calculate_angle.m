function [attach_NP,angle_NP] = Calculate_angle(orient,trans,attach_P,attach_B,oriegn_height)
%UNTITLED4 此处显示有关此函数的摘要
%   此处显示详细说明
R_BP=Rotz(orient(3))*Roty(orient(2))*Rotx(orient(1));
T_BP=trans+oriegn_height;
for i=1:3
    %Vector direction is Base to Platform
    attach_NP(:,i)=T_BP+R_BP*attach_P(:,i)-attach_B(:,i);
    temp_1=R_BP*attach_NP(:,i)/norm(R_BP*attach_NP(:,i));
    angle_NP(:,i)=acos(dot(temp_1,[0 0 1]'));
end
end

