%Kayla Haines
%CSC 4630/6630 PC10
%Due Mar 28 2021

fs = 8000; %sampling frequency
myAudioObject = audiorecorder(fs, 16, 1);
%record
record(myAudioObject);
stop(myAudioObject); 
audioData = getaudiodata(myAudioObject);
%play and write audio to file
play(myAudioObject);
audiowrite('onetwothree.ogg',audioData,fs);

close all; clear; clc

%read sound file
[x, fs] = audioread('onetwothree.ogg');
sound(x,fs);

%part 2
plot(x);
%find begining and end of each word
one_start = 5200;
one_stop = 12100;
sound(x(one_start:one_stop), fs); 

two_start = 20300;
two_stop = 25000;
sound(x(two_start:two_stop), fs);

three_start = 35000;
three_stop = 41000;
sound(x(three_start:three_stop), fs);

%reverse order
one = x(one_start:one_stop);
two = x(two_start:two_stop);
three = x(three_start:three_stop);

y = [three; two; one];
sound(y, fs);
audiowrite('threetwoone.ogg',y,fs);

