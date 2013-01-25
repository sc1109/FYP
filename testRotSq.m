clear all;
c = 50;
f = 30;
R(1,1) = f/sqrt(c^2+f^2);
R(1,2) = c/sqrt(c^2+f^2);
R(2,1) = -R(1,2);
R(2,2) = R(1,1);

z = floor((140*R(1,1))/R(1,2));
xyz = [-140 -130 -120 -110 -100;z z z z z];
K = floor(R*xyz);

figure
subplot(2,1,1);
a = plot(linspace(-140,-100,5),50,'*');
axis([-145 25 49 51]);
%set(a,'Color','blue');
subplot(2,1,2);
a = plot(K(1,:),50,'*');
axis([-145 25 49 51]);
%set(a,'Color','red');

genSquares(linspace(c+150,140,5),linspace(100,140,5),[z z z],5,30);
genSquares(K(1,:)+150,linspace(100,140,5),[K(2,1),K(2,5),K(2,1)],5,30);
