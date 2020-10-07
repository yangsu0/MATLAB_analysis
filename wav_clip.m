"load handle.mat"






[original_audio, FS] = audioread('SX438.WAV');
% audiowrite('SA1 4.WAV',original_audio, FS);
audiowrite('SX438.wav',original_audio,FS);
