clear;clc;close all;
graphics_toolkit("gnuplot");


#color_light = [0.667, 0.667, 0.667];
#color_dark  = [0.2, 0.2, 0.2];


x = linspace(-2, 2, 40);
y = linspace(-2, 2, 40);
[xx,yy] = meshgrid(x, y);
h=figure(1)
# mesh(xx, yy, (xx.^2 + yy.^2));
contour(xx, yy, (xx.^2 + yy.^2));

hidden("off");
#plot(x, y, "linewidth", 2, "color", color_light);

#set(gcf, "color", color_dark);
#set(gca, "fontsize", 14);
#set(gca, "color", color_dark);
#set(gca, "xcolor", color_light);
#set(gca, "ycolor", color_light);
#set(gca, "zcolor", color_light);
#set(gca, "fontname", "cmr10"); 

xlabel('\theta_0');
ylabel('\theta_1');
zlabel('J(\theta_1, \theta_0)');
#title("experiment", color, color_light);
grid on;

#print(gcf,'-dpngalpha', '~/test.png');
print(h,'-dpng','-color', 'octave_plot.png')
