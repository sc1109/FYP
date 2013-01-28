clear all;
c = 5;
f = 30;
R(1,1) = f/sqrt(c^2+f^2);
R(1,2) = c/sqrt(c^2+f^2);
R(2,1) = -R(1,2);
R(2,2) = R(1,1);

z = floor(10*f/c);
xyz = [10 20 30 40 50;z z z z z];
K = round(R*xyz);

a = figure;
subplot(2,1,1);
plot(xyz(1,:),xyz(2,:),'*');
%axis([-50 100 -200 100]);
daspect([1 1 1]);
subplot(2,1,2);
plot(K(1,:),K(2,:),'*');
%axis([-50 100 -200 100]);
daspect([1 1 1]);


%xyz = [140 100 z; c+150 100 z; 140 140 z]';
%genSquares(xyz,5,30);
%xyz = [K(1,1) 100 K(2,1); K(1,5) 100 K(2,5); K(1,1) 140 K(2,1)]';
%genSquares(xyz,5,30);
