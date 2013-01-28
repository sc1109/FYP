function [ u, v ] = genSquares( xyz, t, f )

a = figure;
subplot(3,2,1);
[X,Y] = meshgrid(xyz(1,:),xyz(2,:));
Z = meshgrid(xyz(3,:));
surf(X,Z,Y);
axis([0 300 0 300 0 300]);
daspect([1 1 1]);

b = figure;
subplot(3,2,1);
xyzsq = cat(2,xyz(:,1:2),[max(xyz(1,:)) max(xyz(2,:)) max(xyz(3,:))]', xyz(:,3));
patch(xyzsq(1,:),xyzsq(2,:),'blue');
axis([0 300 0 300]);
daspect([1 1 1]);

u = zeros(6,3);
v = zeros(6,3);
w = zeros(6,3);
u(1,:) = xyz(1,:) - 150;
v(1,:) = xyz(2,:) - 150;
w(:,:) = cat(1,xyz(3,:),xyz(3,:),xyz(3,:),xyz(3,:),xyz(3,:),xyz(3,:));
%w(1,:) = xyz(3,:) - 150;

for n = 1:5
    u(n+1,1) = floor(u(n,1) + (f*u(1,1))/(w(1,1)-n*t));
    if(u(n+1,1)<-149)
        u(n+1,1)=-149;
    end
    if(u(n+1,1)>150)
        u(n+1,1)=150;
    end
    v(n+1,1) = floor(v(n,1) + (f*v(1,1))/(w(1,1)-n*t));
    if(v(n+1,1)<-149)
        v(n+1,1)=-149;
    end
    if(v(n+1,1)>150)
        v(n+1,1)=150;
    end
    u(n+1,2) = floor(u(n,2) + (f*u(1,2))/(w(1,2)-n*t));
    if(u(n+1,2)<-149)
        u(n+1,2)=-149;
    end
    if(u(n+1,2)>150)
        u(n+1,2)=150;
    end
    v(n+1,2) = floor(v(n,2) + (f*v(1,2))/(w(1,2)-n*t));
    if(v(n+1,2)<-149)
        v(n+1,2)=-149;
    end
    if(v(n+1,2)>150)
        v(n+1,2)=150;
    end
    u(n+1,3) = floor(u(n,3) + (f*u(1,3))/(w(1,3)-n*t));
    if(u(n+1,3)<-149)
        u(n+1,3)=-149;
    end
    if(u(n+1,3)>150)
        u(n+1,3)=150;
    end
    v(n+1,3) = floor(v(n,3) + (f*v(1,3))/(w(1,3)-n*t));
    if(v(n+1,3)<-149)
        v(n+1,3)=-149;
    end
    if(v(n+1,3)>150)
        v(n+1,3)=150;
    end
    
    if (w(1,1)<(n+1)*t && w(1,2)<(n+1)*t && w(1,3)<(n+1)*t)
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

figure(a);
subplot(3,2,2);
[X,Y] = meshgrid(uvw(1,:,2),uvw(2,:,2));
Z = meshgrid(uvw(3,:,2));
surf(X,Z,Y);
axis([0 300 0 300 0 300]);
daspect([1 1 1]);

subplot(3,2,3);
[X,Y] = meshgrid(uvw(1,:,3),uvw(2,:,3));
Z = meshgrid(uvw(3,:,3));
surf(X,Z,Y);
axis([0 300 0 300 0 300]);
daspect([1 1 1]);

subplot(3,2,4);
[X,Y] = meshgrid(uvw(1,:,4),uvw(2,:,4));
Z = meshgrid(uvw(3,:,4));
surf(X,Z,Y);
axis([0 300 0 300 0 300]);
daspect([1 1 1]);

subplot(3,2,5);
[X,Y] = meshgrid(uvw(1,:,5),uvw(2,:,5));
Z = meshgrid(uvw(3,:,5));
surf(X,Z,Y);
axis([0 300 0 300 0 300]);
daspect([1 1 1]);

subplot(3,2,6);
[X,Y] = meshgrid(uvw(1,:,6),uvw(2,:,6));
Z = meshgrid(uvw(3,:,6));
surf(X,Z,Y);
axis([0 300 0 300 0 300]);
daspect([1 1 1]);

figure(b);
subplot(3,2,2);
uvwsq = cat(2,uvw(:,1:2,2),[max(uvw(1,:,2)) max(uvw(2,:,2)) max(uvw(3,:,2))]', uvw(:,3,2));
patch(uvwsq(1,:),uvwsq(2,:),'blue');
axis([0 300 0 300]);
daspect([1 1 1]);

subplot(3,2,3);
uvwsq = cat(2,uvw(:,1:2,3),[max(uvw(1,:,3)) max(uvw(2,:,3)) max(uvw(3,:,3))]', uvw(:,3,3));
patch(uvwsq(1,:),uvwsq(2,:),'blue');
axis([0 300 0 300]);
daspect([1 1 1]);

subplot(3,2,4);
uvwsq = cat(2,uvw(:,1:2,4),[max(uvw(1,:,4)) max(uvw(2,:,4)) max(uvw(3,:,4))]', uvw(:,3,4));
patch(uvwsq(1,:),uvwsq(2,:),'blue');
axis([0 300 0 300]);
daspect([1 1 1]);

subplot(3,2,5);
uvwsq = cat(2,uvw(:,1:2,5),[max(uvw(1,:,5)) max(uvw(2,:,5)) max(uvw(3,:,5))]', uvw(:,3,5));
patch(uvwsq(1,:),uvwsq(2,:),'blue');
axis([0 300 0 300]);
daspect([1 1 1]);

subplot(3,2,6);
uvwsq = cat(2,uvw(:,1:2,6),[max(uvw(1,:,6)) max(uvw(2,:,6)) max(uvw(3,:,6))]', uvw(:,3,6));
patch(uvwsq(1,:),uvwsq(2,:),'blue');
axis([0 300 0 300]);
daspect([1 1 1]);

end
