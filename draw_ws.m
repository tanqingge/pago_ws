figure;
M=1;
for i=1:m
    for j=1:n
        for k=1:l
            if (Occugrid(i,j,k)==1)
                temp=w_s{i,j,k};
                temp_x(M)=temp(1,:);
                temp_y(M)=temp(2,:);
                temp_z(M)=temp(3,:)+400;
                M=M+1;
            end
        end
    end
end
scatter3(temp_x,temp_y,temp_z,'filled'); 
xlim([-150 150]);
ylim([-150 150]);
zlim([0 600]);