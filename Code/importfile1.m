function tableout = importfile1(workbookFile,sheetName,startRow,endRow)



if nargin == 1 || isempty(sheetName)
    sheetName = 1;
end


if nargin <= 3
    startRow = 1;
    endRow = 732;
end


[~, ~, raw, dateNums] = xlsread(workbookFile, sheetName, sprintf('A%d:J%d',startRow(1),endRow(1)),'' , @convertSpreadsheetDates);
for block=2:length(startRow)
    [~, ~, tmpRawBlock,tmpDateNumBlock] = xlsread(workbookFile, sheetName, sprintf('A%d:J%d',startRow(block),endRow(block)),'' , @convertSpreadsheetDates);
    raw = [raw;tmpRawBlock]; %#ok<AGROW>
    dateNums = [dateNums;tmpDateNumBlock]; %#ok<AGROW>
end
raw(cellfun(@(x) ~isempty(x) && isnumeric(x) && isnan(x),raw)) = {''};


R = ~cellfun(@isequalwithequalnans,dateNums,raw) & cellfun('isclass',raw,'char'); 
raw(R) = dateNums(R);


R = cellfun(@(x) ~isnumeric(x) && ~islogical(x),raw); 
raw(R) = {NaN}; 


data = reshape([raw{:}],size(raw));


tableout = table;


tableout.date = data(:,1);
tableout.numberofdate = data(:,2);
tableout.holiday = data(:,3);
tableout.weekday = data(:,4);
tableout.count = data(:,5);
tableout.sumregister = data(:,6);
tableout.sumcasual = data(:,7);
tableout.windspeed = data(:,8);
tableout.temp = data(:,9);
tableout.hum = data(:,10);

