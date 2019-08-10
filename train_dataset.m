
"load handle.mat";

dir1 = dir('./TRAIN/DR*');
str = ["aa", "ae", "aw", "ay", "el", "ey", "iy", "m" , "ow", "sh", "z"];



for cnt = 1:length(dir1)
    dir2 = dir([dir1(cnt).folder, '/', dir1(cnt).name]);
        
    
    for cnt2 = 1:length(dir2)
        if dir2(cnt2).name(1) == 'F' || dir2(cnt2).name(1) == 'M'        
            
            list = dir([dir2(cnt2).folder, '/', dir2(cnt2).name, '/*.PHN']);
            N = size(list,1);
            
            for i=1:N
                fn = [list(i).folder,'/',list(i).name]
                filetext = fileread(fn)
                
                for k=1:size(str, 2)
                    expr = strcat('[^\n]*',str{k},'[^\n]*');     
                    matches = regexp(filetext,expr,'match');

                    for j=1:size(matches, 2)
                        str_new = extractBefore(matches{j},str{k});
                        C = strsplit(str_new);

                        readfile = extractBefore(fn,'.');            
                        
                        target_path = [readfile, '.WAV']
                        c_new = str2double(C);
                        [original_audio, FS] = audioread(target_path, [c_new(1),c_new(2)]);


                        write_path = ['./data_set/', str{k}, '/', dir1(cnt).name, '_', dir2(cnt2).name, '_', num2str(i), '_', num2str(j), '.wav'];
                        audiowrite(write_path,original_audio,FS);            
            
                    end  
                end
            end
        end
    end
end

