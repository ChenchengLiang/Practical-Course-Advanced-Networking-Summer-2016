function train1 = importfile13(filename, startRow, endRow)

delimiter = ',';
if nargin<=2
    startRow = 1;
    endRow = inf;
end


formatSpec = '%*s%*s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%[^\n\r]';


fileID = fopen(filename,'r');

dataArray = textscan(fileID, formatSpec, endRow(1)-startRow(1)+1, 'Delimiter', delimiter, 'HeaderLines', startRow(1)-1, 'ReturnOnError', false);
for block=2:length(startRow)
    frewind(fileID);
    dataArrayBlock = textscan(fileID, formatSpec, endRow(block)-startRow(block)+1, 'Delimiter', delimiter, 'HeaderLines', startRow(block)-1, 'ReturnOnError', false);
    for col=1:length(dataArray)
        dataArray{col} = [dataArray{col};dataArrayBlock{col}];
    end
end


fclose(fileID);


raw = repmat({''},length(dataArray{1}),length(dataArray)-1);
for col=1:length(dataArray)-1
    raw(1:length(dataArray{col}),col) = dataArray{col};
end
numericData = NaN(size(dataArray{1},1),size(dataArray,2));

for col=[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]
   
    rawData = dataArray{col};
    for row=1:size(rawData, 1);
   
        regexstr = '(?<prefix>.*?)(?<numbers>([-]*(\d+[\,]*)+[\.]{0,1}\d*[eEdD]{0,1}[-+]*\d*[i]{0,1})|([-]*(\d+[\,]*)*[\.]{1,1}\d+[eEdD]{0,1}[-+]*\d*[i]{0,1}))(?<suffix>.*)';
        try
            result = regexp(rawData{row}, regexstr, 'names');
            numbers = result.numbers;
            
            
            invalidThousandsSeparator = false;
            if any(numbers==',');
                thousandsRegExp = '^\d+?(\,\d{3})*\.{0,1}\d*$';
                if isempty(regexp(thousandsRegExp, ',', 'once'));
                    numbers = NaN;
                    invalidThousandsSeparator = true;
                end
            end
           
            if ~invalidThousandsSeparator;
                numbers = textscan(strrep(numbers, ',', ''), '%f');
                numericData(row, col) = numbers{1};
                raw{row, col} = numbers{1};
            end
        catch me
        end
    end
end



R = cellfun(@(x) ~isnumeric(x) && ~islogical(x),raw); 
raw(R) = {NaN};


train1 = table;
train1.season = cell2mat(raw(:, 1));
train1.yr = cell2mat(raw(:, 2));
train1.mnth = cell2mat(raw(:, 3));
train1.hr = cell2mat(raw(:, 4));
train1.holiday = cell2mat(raw(:, 5));
train1.weekday = cell2mat(raw(:, 6));
train1.workingday = cell2mat(raw(:, 7));
train1.weathersit = cell2mat(raw(:, 8));
train1.temp = cell2mat(raw(:, 9));
train1.atemp = cell2mat(raw(:, 10));
train1.hum = cell2mat(raw(:, 11));
train1.windspeed = cell2mat(raw(:, 12));
train1.casual = cell2mat(raw(:, 13));
train1.registered = cell2mat(raw(:, 14));
train1.cnt = cell2mat(raw(:, 15));
