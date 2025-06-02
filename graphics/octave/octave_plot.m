clear;clc;close all;
graphics_toolkit("gnuplot");

set (0, "defaultaxesfontname", "Helvetica") 
set (0, "defaultaxesfontsize", 10) 
set (0, "defaulttextfontname", "Helvetica") 
set (0, "defaulttextfontsize", 12) 

x=linspace(-4, 2);
y=x.^2 + 3.*x ;
h=figure(1)
plot(x,y, 'linewidth', 1.5);

#FN = findall(h,'-property','FontName');
#set(FN,'FontName','/usr/local/share/fonts/cm-regular.ttf');
#FS = findall(h,'-property','FontSize');
#set(FS,'FontSize',8);

xlabel('\theta_0', 'fontsize', 15);
ylabel('J(\theta_0)', 'fontsize', 15);

print(h,'-dpng','-color', 'octave_plot.png')
