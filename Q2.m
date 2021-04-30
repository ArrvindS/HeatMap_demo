clc;
clear all;
close all;

img=imread('USA_MAp.png');
heatmap=ones(1351,3000);
x_coor=[675 1000 1059 385 930 582 800 750 550 775 1055 490 970 542 605 870 400 655 350 342 545 542 280 985 500 100 823 850 520 600 635 635 635 370 500 315 300 850 355 375 200 ....
    550 630 600 200 1250 270 1095 405 185 245 600 1109];
y_coor=[255 1300 2300 2525 2220 1850 600 2400 2590 2020 1710 2400 2050 2200 2470 2360 2050 1700 2700 1800 2509 2000 1550 1870 1605 370 1438 1708 420 685 1000 2100 1350 2670 1280 600 305 950 2800 1290 1260 ...
    2600 2300 2545 850 959 2735 400 900 2800 2700 2545 2675];
Population=[425904 698587 363513 398615 110576 210576 35696 184422 172831 183533 154163 132252 67948 137038 17810 72952 99521 23211 113768 107004 7653 96845 93148 89737 71598 43444 77606 78358 59306 57392 32494 12121 46977 42374 34613 22930 5752 17270 2346 19902 19497 10806 11982 12299 9597 10446 7655 4704 5160 4782 1622 13653 2252];
for i=1:53
heatmap(x_coor(i),y_coor(i))=Population(i);
end
gaussian_kernel = fspecial('gaussian', [500 500], 60);
density = imfilter(heatmap, gaussian_kernel, 'replicate');

omask = heatmap_overlay(img, density, 'jet');
imshow(omask,[]);


