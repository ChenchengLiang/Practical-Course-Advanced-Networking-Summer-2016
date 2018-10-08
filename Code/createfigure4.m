function createfigure4(X1, Y1)
%CREATEFIGURE4(X1, Y1, S1, C1)
%  X1:  scatter x
%  Y1:  scatter y
%  S1:  scatter s
%  C1:  scatter c

%   MATLAB  30-Apr-2016 01:11:58 

%  figure
figure1 = figure;

%  axes
axes1 = axes('Parent',figure1);
hold(axes1,'all');

%  scatter
scatter(X1,Y1,'Marker','.');

%  title
title('The relation between windspeed and number of riders');

%  xlabel
xlabel('windspeed');

%  ylabel
ylabel('number of riders');

