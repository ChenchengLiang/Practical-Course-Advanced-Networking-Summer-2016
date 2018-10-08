function createfigure5(X1, Y1)
%CREATEFIGURE5(X1, Y1, S1, C1)
%  X1:  scatter x
%  Y1:  scatter y
%  S1:  scatter s
%  C1:  scatter c

%   MATLAB  30-Apr-2016 01:17:36 

%  figure
figure1 = figure;

%  axes
axes1 = axes('Parent',figure1);
hold(axes1,'all');

%  scatter
scatter(X1,Y1,'Marker','.');

% title
title('The relation between the number of riders and hours');

%  xlabel
xlabel('hours');

% ´´½¨ ylabel
ylabel('the numbe rof riders');

