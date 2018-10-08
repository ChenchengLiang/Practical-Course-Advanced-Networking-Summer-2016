function prediction_smoothing_spline(YMatrix1)
%CREATEFIGURE(YMATRIX1)
%  YMATRIX1:  y 

%   MATLAB  28-Apr-2016 19:37:50 

%  figure
figure1 = figure;

%  axes
axes1 = axes('Parent',figure1);

% xlim(axes1,[0 1800]);

% ylim(axes1,[0 1000]);
box(axes1,'on');
hold(axes1,'all');


plot1 = plot(YMatrix1,'Parent',axes1);
set(plot1(1),'DisplayName','preiction');
set(plot1(2),'DisplayName','number of riders');

%  legend
legend(axes1,'show');

