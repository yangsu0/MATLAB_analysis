"load handle.mat";

file_dir = dir('./data_set/*');
for cnt = 1:length(file_dir)
    target_dir = dir([file_dir(cnt).folder,'/',file_dir(cnt).name]);
    
    for cnt2 = 1:length(target_dir)
        if target_dir(cnt2).name(1) =='D'
            
                audio_path = [target_dir(cnt2).folder,'/',target_dir(cnt2).name];
                
                [original_data,FS] = audioread(audio_path);
%                 tmp = length(original_data);
%                 t = tmp/FS
%                 
%                 if cnt == 3 && cnt2 == 3 
%                 greatest = tmp;
%                 else
%                     if tmp >= greatest
%                        greatest = tmp;
%                     end    
%                 end             
                 y = original_data(1:length(original_data)).*tukeywin(length(original_data),0.1);
                 A = zeros(320,1); %0.01s
                 remain = 7019 - length(original_data) - 320;
                 B = zeros(remain,1);
                 C = [A ; original_data; B];             
                
                 write_path = ['./transformed_data/',file_dir(cnt).name,'/',target_dir(cnt2).name]
                 audiowrite(write_path,C,FS);
                
        end  
    end
end



% wav length same ----y----|max_audio_length|
%                 ----y----|shortest|--------


% tukey filter == only proccessing wav length