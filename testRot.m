clear all;
c = 50;
f = 30;
R(1,1) = f/sqrt(c^2+f^2);
R(1,2) = c/sqrt(c^2+f^2);
R(2,1) = -R(1,2);
R(2,2) = R(1,1);

xyz = [-c -40 -30 -20 -10;f f f f f];
K = R*xyz;

plot(-c,50,'+');
hold on;
a = plot(-40,50,'+');
set(a,'Color','red');
a = plot(-30,50,'+');
set(a,'Color','yellow');
a = plot(-20,50,'+');
set(a,'Color','green');
a = plot(-10,50,'+');
set(a,'Color','magenta');
plot(K(1,1),50,'*');
a = plot(K(1,2),50,'*');
set(a,'Color','red');
a = plot(K(1,3),50,'*');
set(a,'Color','yellow');
a = plot(K(1,4),50,'*');
set(a,'Color','green');
a = plot(K(1,5),50,'*');
set(a,'Color','magenta');

