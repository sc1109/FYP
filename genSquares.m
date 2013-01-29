function [ u, v ] = genSquares( xyz, t, f )

u = zeros(6,4);
v = zeros(6,4);
w = zeros(6,4);
u(1,:) = xyz(1,:) - 150;
v(1,:) = xyz(2,:) - 150;
w(:,:) = cat(1,xyz(3,:),xyz(3,:),xyz(3,:),xyz(3,:),xyz(3,:),xyz(3,:));

for n = 1:5
    for m = 1:4
        u(n+1,m) = round(u(n,m) + (f*u(1,m))/(w(1,m)-n*t));
        if(u(n+1,m)<-149)
            u(n+1,m)=-149;
        end
        if(u(n+1,m)>150)
            u(n+1,m)=150;
        end
        v(n+1,m) = round(v(n,m) + (f*v(1,m))/(w(1,m)-n*t));
        if(v(n+1,m)<-149)
            v(n+1,m)=-149;
        end
        if(v(n+1,m)>150)
            v(n+1,m)=150;
        end
    end
    if (w(1,1)<(n+1)*t && w(1,2)<(n+1)*t && w(1,3)<(n+1)*t && w(1,4)<(n+1)*t)
            u(n+1,:)=-149;
            v(n+1,:)=-149;
    end
end

u = u + 150;
v = v + 150;

uvw_part=zeros(3,4,6);
for n=1:6
uvw_part(:,:,n) = cat(1,u(n,:),v(n,:),w(n,:));
end
uvw = cat(3,uvw_part(:,:,1:6));

% a = figure;
% figure(a);
% for m=1:6
% subplot(3,2,m);
% [X,Y] = meshgrid(uvw(1,:,m),uvw(2,:,m));
% Z = meshgrid(uvw(3,:,m));
% surf(X,Z,Y);
% axis([0 300 0 300 0 300]);
% daspect([1 1 1]);
% end

b = figure;
figure(b);
for m=1:6
    subplot(3,2,m);
    patch(uvw(1,:,m),uvw(2,:,m),'blue');
    axis([0 300 0 300]);
    daspect([1 1 1]);
end

end
