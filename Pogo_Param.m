%%% definite parameters of the Pogo column
%% the type is Equilateral triangle
h=400;              %[mm]the height of the triangle
d=400;              %[mm] length of the half side
z_min=-100;      
z_max=100;
x_min=-100;
x_max=100;
y_min=-100;
y_max=100;          %the ranges of height
trans=zeros(3,1);     %[mm] The vector which describes the wanted translational movement of the platform [x, y, z]
orient=zeros(3,1);    %[rad] the vector describe the Euler angle [ phi, theta, psi]
attach_B=[[-d/2,-d/2*tan(pi/6),0]'...
          [d/2,-d/2*tan(pi/6),0]'...
          [0, d*tan(pi/6),0]'];   %[mm]the coor of the base
attach_P=[[-d/2,-d*tan(pi/6)/2,0]'...
          [d/2,-d*tan(pi/6)/2,0]'...
          [0, d*tan(pi/6),0]'];   %[mm]the coor of the platform
pitch_threhold=pi/4;
yaw_threhold=pi/4;
roll_threhold=pi/4;
angle_P=pi/3;
oriegn_height=[0;0;400];