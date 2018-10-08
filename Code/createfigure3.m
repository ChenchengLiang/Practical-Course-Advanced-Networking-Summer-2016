function createfigure3(YMatrix1)
%CREATEFIGURE3(YMATRIX1)
%  YMATRIX1:  y 

%   MATLAB  30-Apr-2016 00:22:58 

%  figure
figure1 = figure;

%  axes
axes1 = axes('Parent',figure1);
box(axes1,'on');
hold(axes1,'all');

%  plot 
plot1 = plot(YMatrix1,'Parent',axes1);
set(plot1(1),'DisplayName','real number of riders');
set(plot1(2),'DisplayName','prediction');

%  xlabel
xlabel('number of samples');

%  ylabel
ylabel('number of riders');

%  title
title('Comparison between prediction data and real data(Model: Neural net fitting)');

%  legend
legend(axes1,'show');

