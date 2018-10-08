function [fitresult, gof] = sum_of_sine(date, number_of_riders, temp)
%CREATEFIT(DATE,NUMBER_OF_RIDERS,TEMP)
%  Create a fit.
%
%  Data for 'sum of sine' fit:
%      X Input : date
%      Y Output: number_of_riders
%      Weights : temp
%  Output:
%      fitresult : a fit object representing the fit.
%      gof : structure with goodness-of fit info.
%
%   FIT, CFIT, SFIT.

%   MATLAB  28-Apr-2016 18:32:44 


%% Fit: 'sum of sine'.
[xData, yData, weights] = prepareCurveData( date, number_of_riders, temp );

% Set up fittype and options.
ft = fittype( 'sin5' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.Lower = [-Inf 0 -Inf -Inf 0 -Inf -Inf 0 -Inf -Inf 0 -Inf -Inf 0 -Inf];
opts.StartPoint = [6364.10668780989 0.00430355158025999 -0.60778152140808 2780.6384845465 0.00860710316051998 0.85062360177431 927.900899172587 0.01721420632104 2.00941724057109 382.466157431835 0.0344284126420799 -0.464166383939256 419.783377036484 0.0258213094815599 -0.376187374350713];
opts.Weights = weights;

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );

% Plot fit with data.
figure( 'Name', 'sum of sine' );
h = plot( fitresult, xData, yData );
datetick('x','yyyy-mm-dd');
legend( h, 'number_of_riders vs. date with temp', 'sum of sine', 'Location', 'NorthEast' );
% Label axes
xlabel( 'date' );
ylabel( 'number_of_riders' );
grid on


