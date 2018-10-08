function number_of_temp(X1, YMatrix1)
%CREATEFIGURE(X1, YMATRIX1)
%  X1:  x 
%  YMATRIX1:  y 

%   MATLAB  28-Apr-2016 17:46:41 

%  figure
figure1 = figure;

%  axes
axes1 = axes('Parent',figure1,...
    'XTickLabel',['2011-01-01';'2012-01-01';'2013-01-01'],...
    'XTick',[734504 734869 735235]);

% xlim(axes1,[734504 735235]);
box(axes1,'on');
hold(axes1,'all');


plot1 = plot(X1,YMatrix1,'Parent',axes1);
set(plot1(1),'DisplayName','magnified temp');
set(plot1(2),'DisplayName','count');

%  xlabel
xlabel('date');

%  ylabel
ylabel('number of riders');

%  legend
legend1 = legend(axes1,'show');
set(legend1,...
    'Position',[0.131622244159261 0.827073552425666 0.140177690029615 0.0985915492957747]);

