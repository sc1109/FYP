function [ u, v ] = genSquares( xyz, t, f )

figure;
subplot(3,2,1);
[X,Y] = meshgrid(xyz(1,:),xyz(2,:));
Z = meshgrid(xyz(3,:));
surf(X,Y,Z);

u = zeros(6,3);
v = zeros(6,3);
w = zeros(6,3);
u(1,:) = xyz(1,:) - 150;
v(1,:) = xyz(2,:) - 150;
z = xyz(3,:);
%w(1,:) = xyz(3,:) - 150;

for n = 1:5
    u(n+1,1) = floor(u(n,1) + (f*u(1,1))/(z(1)-n*t));
    if(u(n+1,1)<-149)
        u(n+1,1)=-149;
    end
    if(u(n+1,1)>150)
        u(n+1,1)=150;
    end
    v(n+1,1) = floor(v(n,1) + (f*v(1,1))/(z(1)-n*t));
    if(v(n+1,1)<-149)
        v(n+1,1)=-149;
    end
    if(v(n+1,1)>150)
        v(n+1,1)=150;
    end
    u(n+1,2) = floor(u(n,2) + (f*u(1,2))/(z(2)-n*t));
    if(u(n+1,2)<-149)
        u(n+1,2)=-149;
    end
    if(u(n+1,2)>150)
        u(n+1,2)=150;
    end
    v(n+1,2) = floor(v(n,2) + (f*v(1,2))/(z(2)-n*t));
    if(v(n+1,2)<-149)
        v(n+1,2)=-149;
    end
    if(v(n+1,2)>150)
        v(n+1,2)=150;
    end
    u(n+1,3) = floor(u(n,3) + (f*u(1,3))/(z(3)-n*t));
    if(u(n+1,3)<-149)
        u(n+1,3)=-149;
    end
    if(u(n+1,3)>150)
        u(n+1,3)=150;
    end
    v(n+1,3) = floor(v(n,3) + (f*v(1,3))/(z(3)-n*t));
    if(v(n+1,3)<-149)
        v(n+1,3)=-149;
    end
    if(v(n+1,3)>150)
        v(n+1,3)=150;
    end
    
    if (Z<(n+1)*t)
        u(n+1,:)=-149;
        v(n+1,:)=-149;
    end
end

u = u + 150;
v = v + 150;

uvw_part=zeros(3,3,6);
for n=1:6
uvw_part(:,:,n) = cat(1,u(n,:),v(n,:),w(n,:));
end
uvw = cat(3,uvw_part(:,:,1:6));

subplot(3,2,2);
plot3(u(2,1):u(2,2), v(2,1):v(2,3), Z);
[X,Y] = meshgrid(uvw(1,:),uvw(2,:));
Z = meshgrid(uvw(3,:));
surf(X,Y,Z);

subplot(3,2,3);
plot3(u(3,1):u(3,2), v(3,1):v(3,3), Z);

subplot(3,2,4);
plot3(u(4,1):u(4,2), v(4,1):v(4,3), Z);

subplot(3,2,5);
plot3(u(5,1):u(5,2), v(5,1):v(5,3), Z);

subplot(3,2,6);
plot3(u(6,1):u(6,2), v(6,1):v(6,3), Z);

end
