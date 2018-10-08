function createfigure2(YMatrix1)
%CREATEFIGURE2(YMATRIX1)
%  YMATRIX1:  y 

%   MATLAB  29-Apr-2016 22:34:58 

% create figure
figure1 = figure;

% create axes
axes1 = axes('Parent',figure1);

% xlim(axes1,[535.232910057203 563.940606109781]);

% ylim(axes1,[-421.965965999219 694.229667217567]);
box(axes1,'on');
hold(axes1,'all');

% create title
title('Comparison between prediction data and real data (Model: TreeBagger )');

%  plot 
plot1 = plot(YMatrix1);
set(plot1(1),'DisplayName','prediction');
set(plot1(2),'DisplayName','real number of riders');

%  xlabel
xlabel('number of samples');

%  ylabel
ylabel('number of riders');

