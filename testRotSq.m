clear all;
c = 50;
f = 30;
R(1,1) = f/sqrt(c^2+f^2);
R(1,2) = c/sqrt(c^2+f^2);
R(2,1) = -R(1,2);
R(2,2) = R(1,1);

xyz = [-c -40 -30 -20 -10;f f f f f];
K = R*xyz;

figure
subplot(2,1,1);
a= plot(linspace(-c,-10,5),50,'*');
axis([-50 55 49 51]);
%set(a,'Color','blue');
subplot(2,1,2);
a = plot(K(1,:),50,'*');
axis([-50 55 49 51]);
%set(a,'Color','red');
