%폴더 열기
%폴더 열어서 있는 파일 다 가져오기 
%phn파일 열기
%특정 문자 있을 때 wav열기
"load handle.mat";

list = dir('*.PHN');
N = size(list,1);
for i=1:N
    fn = list(i).name
    filetext = fileread(fn);
    expr = '[^\n]*ae[^\n]*';
    
    matches = regexp(filetext,expr,'match');
    
    for j=1:size(matches)
    str1 = extractBefore(matches{j},'ae');
    C = strsplit(str1);
    
    readfile = extractBefore(fn,'.');
    target = strcat('/Users/yangsuyeong/Documents/MATLAB/TRAIN/DR1/FCJF0/',readfile,'.WAV')
    target_path = dir(target)
    c_new = str2double(C)
    [original_audio, FS] = audioread(target_path.name,[c_new(1),c_new(2)]);
    audiowrite(target_path.name,original_audio,FS);
    end  
end
