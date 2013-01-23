% I1 = rgb2gray(imread('trisquare.png'));
% I2 = imresize(I1, 1.1, 'OutputSize', [648 1152]);
% I2 = cat(2, I2, zeros(648, 140));
I1 = rgb2gray(sq1);
I2 = rgb2gray(sq2);
w = 70;
 
points1 = detectSURFFeatures(I1);
points2 = detectSURFFeatures(I2);

[f1, vpts1] = extractFeatures(I1, points1);
[f2, vpts2] = extractFeatures(I2, points2);
         
index_pairs = matchFeatures(f1, f2);
proper_pairs = index_pairs;
proper_pairs(:, :) = 0;
z1 = zeros(size(index_pairs, 1));
z2 = zeros(size(index_pairs, 1));

points1 = vpts1(index_pairs(:, 1)).Location;
points2 = vpts2(index_pairs(:, 2)).Location;

diff1 = points1(:,1) - points2(:,1);
diff2 = points1(:,2) - points2(:,2);

diffs = (diff1.^2 + diff2.^2)-ones(size(diff1))*(0.4*size(I1,1))^2;
ind = find(diffs>0);
diff1(ind) = [];
diff2(ind) = [];
points1(ind,:) = [];
points2(ind,:) = [];

ind = find(diffs<0);
proper_pairs(ind,1) = index_pairs(ind, 1);
proper_pairs(ind,2) = index_pairs(ind, 2);
n = 1:size(proper_pairs(ind,1),1);

z1 = -w*(points2(:,1)/diff1);
z2 = -w*(points2(:,2)/diff2);

proper_pairs = proper_pairs(~all(proper_pairs == repmat([0,0],size(proper_pairs,1),1),2),:);
z1 = z1(z1~=0);
z2 = z2(z2~=0);

matched_pts1 = vpts1(proper_pairs(:, 1));
matched_pts2 = vpts2(proper_pairs(:, 2));

z1bar = median(z1);
z2bar = median(z2);
zall = cat(1,z1bar,z2bar);
zallbar = mean(zall);

cvexShowMatches(I1,I2,matched_pts1,matched_pts2);
hold on;

crossx = (points1(:,1)+diff1*2);
crossy = (points1(:,2)+diff2*2); 

%[dmin, d]=min(abs(linecrossx-linecrossy));

plot(crossx, crossy, '*');
linex = zeros(max(n), 2, 100);
c = zeros(max(n),1);
m = zeros(max(n),1);
B = zeros(max(n),1);
cross = zeros;
for i=n
    plot([crossx(i) points1(i,1)], [crossy(i) points1(i,2)]);
    a = linspace(crossx(i), points1(i,1), 100);
    b = linspace(crossy(i), points1(i,2), 100);
    linex(i, 1, :) = a;
    linex(i, 2, :) = b;
end
for i=n
    B(i) = interp1([crossx(i) points1(i,1)], [crossy(i) points1(i,2)], 0, 'linear', 'extrap');
    m(i) = (crossy(i)-points1(i,2))/(crossx(i)-points1(i,1));
    A = [-1.*m ones(max(n),1)];
end
for i=n
    for j=1:max(n)+1-i
        cross = cat(1, (A([i j],:))\B([i j]),cross);
    end
end
%plot([crossx(n); points1(ind,1)], [crossy(n); points1(n,2)], '*');
daspect([1,1,1]);
