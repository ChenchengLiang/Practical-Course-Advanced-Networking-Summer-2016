%% Import Data
%Data for Analysis
traindata  = importfile1('train-based on date.xlsx','Sheet1',2,732);
date = traindata{:,1};
number_of_riders = traindata{:,5};
temp = traindata{:,9};
analysis_data = importfile13('train.csv', 2, 15630);


%% Analysis

%createfigure(traindata.numberofdate,[traindata.windspeed*2000,traindata.temp*2000,traindata.count,traindata.hum*2000]);
%plot(traindata.numberofdate,traindata.windspeed*2000,'DisplayName','windspeed');hold all;plot(traindata.numberofdate,traindata.temp*2000,'DisplayName','temp');plot(traindata.numberofdate,traindata.count,'DisplayName','count');plot(traindata.numberofdate,traindata.hum*2000,'DisplayName','hum');datetick('x','yyyy-mm-dd');hold off;
%plot(traindata.numberofdate,traindata.temp*2000,'DisplayName','temp');hold all;plot(traindata.numberofdate,traindata.count,'DisplayName','count');datetick('x','yyyy-mm-dd');hold off;
number_of_temp(traindata.numberofdate,[traindata.temp*2000,traindata.count]);
%This picture shows the relations between the number of riders and
%magnified average temperature every day from 2011-01-01 to 2013-01-01. The temperatures are magnified
%2000 times, that allows us to observate how the changes of temparature influents the
%number of riders. A simple result is bike sharing become more and more
%popular, more people took part in it in 2013 than 2011. The temperature
%affected the number of riders as well, when it is winter, the temperature
%is low, the number of riders decreaced,when it is summer, the number of
%riders keeped in a high level.
%There are some outliers such as in 2012-10-29, it is the red point I marked in the figure, there were only 22 riders,
%because in 2012-10-29 Washington DC had a hurricane sandy.
%Note that because not every day has the
%same number of hours in this dataset, which means there are some data are missed, so this figure only can represent a trend but some
%specific information.

%The following figure show us the relation between the number of riders and
%windspeed:
createfigure4(analysis_data.windspeed, analysis_data.cnt);
%We can see that the faster windspeed the less riders.

%The following figure show us the relation between the number of riders and
%different hours in days:
createfigure5(analysis_data.hr, analysis_data.cnt);


%We can see that in working hours the riders are more than that in midnight.

%By repeating these similar analysis, We gain some useful attributes that
%influnence the number of riders a lot. These attributes are season, hours
%in days, months, holidays, weekdays, weathersit, temperatures, humidity
%and windspeed.
%

%% Import data for machine learning.
%Train data
train = importtrain('train.csv', 2, 15630);
dteday = importfile8('train.csv',2, 15630);
train(:,1)=datenum(dteday,'yyyy-mm-dd');
train_target = importfile9('train.csv',2, 15630);
%Test data
dteday1 = importfile10('test.csv',2, 1751);
test = importfile11('test.csv', 2, 1751);
test=[datenum(dteday1,'yyyy-mm-dd'),test];
test_target = importfile12('test.csv', 2, 1751);
%% Model 1 TreeBagger
 %MSE = mean((truedata - prediction).^2);
%First the TreeBagger is used to predict the number of riders according all the attributes I mentioned before. the following figure shows the prediction data and the real data. 
%MSE=1.235973371428571e+04
treebagger = TreeBagger(10,train,train_target);
pre_treebagger=predict(treebagger,test);
pre_treebagger = char(pre_treebagger);
pre_treebagger = str2num(pre_treebagger);
MSE_treebagger = mean((test_target - pre_treebagger).^2);
%upperbound_treebagger=pre_treebagger+mean(abs(pre_treebagger-test_target));
%lowerbound_treebagger=pre_treebagger-mean(abs(pre_treebagger-test_target));
createfigure2([pre_treebagger,test_target]);
%plot(pre_treebagger,'DisplayName','pre');hold all;plot(test_target,'DisplayName','number of riders');hold off;

%Then I used differen models to get the predictions, and the results are in
%the following figures.
 %% Model 2 Classification Trees
 %MSE=8.328904000000000e+03
classification_tree = fitctree(train,train_target);
pre_classification_tree=predict(classification_tree,test);
MSE_classification_tree = mean((test_target - pre_classification_tree).^2);
upperbound_classification_tree=pre_classification_tree+mean(abs(pre_classification_tree-test_target));
lowerbound_classification_tree=pre_classification_tree-mean(abs(pre_classification_tree-test_target));
createfigure([pre_classification_tree,test_target]);
%plot(pre_classification_tree,'DisplayName','pre');hold all;plot(test_target,'DisplayName','number of riders');hold off;
 %% Model 3 regression tree
 %MSE=2.881297658776601e+03
regression_tree = fitrtree(train,train_target);
pre_regression_tree=predict(regression_tree,test);
MSE_regression_tree = mean((test_target - pre_regression_tree).^2);
createfigure1([pre_regression_tree,test_target]);
%plot(pre_regression_tree,'DisplayName','pre');hold all;plot(test_target,'DisplayName','number of riders');hold off;

%% Model 4 Neural net fitting
%MSE=3.737311373399506e+03
[pre_Neural_net_fitting] = myNeuralNetworkFunction(test');
pre_Neural_net_fitting=pre_Neural_net_fitting';
MSE_Neural_net_fitting= mean((test_target - pre_Neural_net_fitting).^2);
createfigure3([test_target,pre_Neural_net_fitting]);

%% Conclusion
%According to the values of MSE, the results of predictions seem not good.
%The reason might be that I did not deal with outliers or I ignore some
%important attributes and added some unimportant into the training.
%I am a beginner of dealing with them, I hope I can improve my results in
%next task by learning more knowledge about it.


