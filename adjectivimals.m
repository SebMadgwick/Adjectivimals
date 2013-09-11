clc;
clear;

% -------------------------------------------------------------------------
% Import files

% http://rickcreation.com/rickwalton/curricul/lanimals.htm
% http://grammar.yourdictionary.com/parts-of-speech/adjectives/list-of-adjective-words.html

fid = fopen('animals.txt');
an = textscan(fid, '%s');
an = an{1};
fclose(fid);

fid = fopen('adjectives.txt');
ad = textscan(fid, '%s');
ad = ad{1};
fclose(fid);

% -------------------------------------------------------------------------
% Generate names

maxSize = 32;   % maximum number of charcters in name

names = {};

for ani = 1:length(an)
    for adi = 1:length(ad)
        name = strcat(ad{adi}, {' '}, an{ani}); 
        if(length(name{1}) < maxSize)
            names{length(names)+1} = name;
        end
    end
end

total = length(names)

% -------------------------------------------------------------------------
% Write to file

order = randperm(length(names))';

fid = fopen('names.txt', 'w');
fprintf(fid, 'max length = %d\n', maxSize);
fprintf(fid, 'total number of names = %d\n\n', length(names));
for i = 1:length(names);
    fprintf(fid, '%s\n', names{order(i)}{1});
end
fclose(fid);
