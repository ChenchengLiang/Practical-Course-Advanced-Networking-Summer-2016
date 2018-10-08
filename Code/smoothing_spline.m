function [fitresult, gof] = smoothing_spline(date1, cnt1)
%CREATEFIT(DATE1,CNT1)
%  Create a fit.
%
%  Data for 'smoothing spline' fit:
%      X Input : date1
%      Y Output: cnt1
%  Output:
%      fitresult : a fit object representing the fit.
%      gof : structure with goodness-of fit info.
%
%   FIT, CFIT, SFIT.

%   MATLAB  28-Apr-2016 19:32:00 


%% Fit: 'smoothing spline'.
[xData, yData] = prepareCurveData( date1, cnt1 );

% Set up fittype and options.
ft = fittype( 'smoothingspline' );
opts = fitoptions( 'Method', 'SmoothingSpline' );
opts.SmoothingParam = 0.998049050351539;

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );

% Plot fit with data.
figure( 'Name', 'smoothing spline' );
h = plot( fitresult, xData, yData );
datetick('x','yyyy-mm-dd');
legend( h, 'cnt1 vs. date1', 'smoothing spline', 'Location', 'NorthEast' );
% Label axes
xlabel( 'date1' );
ylabel( 'cnt1' );
grid on


