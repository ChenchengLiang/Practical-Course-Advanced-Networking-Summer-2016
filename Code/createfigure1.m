function createfigure1(YMatrix1)
%CREATEFIGURE1(YMATRIX1)
%  YMATRIX1:  y 

%   MATLAB  29-Apr-2016 22:32:01 

% create figure
figure1 = figure;

% create axes
axes1 = axes('Parent',figure1);
box(axes1,'on');
hold(axes1,'all');

% create title
title('Comparison between prediction data and real data(Model: Regression tree)');


plot1 = plot(YMatrix1,'Parent',axes1);
set(plot1(1),'DisplayName','prediction');
set(plot1(2),'DisplayName','real number of riders');

% create xlabel
xlabel('number of samples');

% create ylabel
ylabel('number of riders');

% create legend
legend(axes1,'show');

