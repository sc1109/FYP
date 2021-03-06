clear all;
%vanihsing point pixel
c = -10;
%focal length
f = 20;
%Rotation matrix
R(1,1) = f/sqrt(c^2+f^2);
R(1,2) = -c/sqrt(c^2+f^2);
R(2,1) = -R(1,2);
R(2,2) = R(1,1);

%depth of pixel to be moved to 0
z = floor(20*f/abs(c));
xz = [-20 80 80 -20 ; z z z z];
K = round(R*xz)+150;

%Tests rotation using points
%xyz = [10 20 30 40 50;z z z z z];
%a = figure;
%subplot(2,1,1);
%plot(xyz(1,:),xyz(2,:),'*');
%axis([-50 100 -200 100]);
%daspect([1 1 1]);
%subplot(2,1,2);
%plot(K(1,:),K(2,:),'*');
%axis([-50 100 -200 100]);
%daspect([1 1 1]);

xyz = [130 100 z; 230 100 z; 230 200 z; 130 200 z]';
genSquares(xyz,5,f);
xyz = [K(1,1) 100 K(2,1); K(1,2) 100 K(2,2); K(1,3) 200 K(2,3); K(1,4) 200 K(2,4)]';
genSquares(xyz,5,f);
