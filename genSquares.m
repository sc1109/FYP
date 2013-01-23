function [ u, v ] = genSquares( x, y, z, t, f )

sq1 = ones(300, 300, 3);
sq1(min(x):max(x),min(y):max(y),1:2) = 0;
figure;
subplot(3,2,1);
image(sq1);
hold on
daspect([1,1,1]);

u = zeros(6,3);
v = zeros(6,3);

u(1,1) = min(x) - 150;
v(1,1) = min(y) - 150;
u(1,2) = max(x) - 150;
v(1,2) = min(y) - 150;
u(1,3) = max(x) - 150;
v(1,3) = max(y) - 150;

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
    
    if (z<(n+1)*t)
        u(n+1,:)=-149;
        v(n+1,:)=-149;
    end
end

u = u + 150;
v = v + 150;

sq2 = ones(300, 300, 3);
sq2(u(2,1):u(2,2), v(2,1):v(2,3),1:2) = 0;
sq3 = ones(300, 300, 3);
sq3(u(3,1):u(3,2), v(3,1):v(3,3),1:2) = 0;
sq4 = ones(300, 300, 3);
sq4(u(4,1):u(4,2), v(4,1):v(4,3),1:2) = 0;
sq5 = ones(300, 300, 3);
sq5(u(5,1):u(5,2), v(5,1):v(5,3),1:2) = 0;
sq6 = ones(300, 300, 3);
sq6(u(6,1):u(6,2), v(6,1):v(6,3),1:2) = 0;

subplot(3,2,2);
image(sq2);
daspect([1,1,1]);
subplot(3,2,3);
image(sq3);
daspect([1,1,1]);
subplot(3,2,4);
image(sq4);
daspect([1,1,1]);
subplot(3,2,5);
image(sq5);
daspect([1,1,1]);
subplot(3,2,6);
image(sq6);
daspect([1,1,1]);

end
