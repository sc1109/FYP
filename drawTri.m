clear all;

sq1 = ones(300, 300, 3);
sq1(100:200,100:200,1:2) = 0;
figure;
image(sq1);
daspect([1,1,1])
sq2 = ones(300, 300, 3);
sq2(50:250,50:250,1:2) = 0;
figure;
image(sq2);
daspect([1,1,1])
