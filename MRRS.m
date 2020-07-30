%% Ambiguity function calculation
% sampling rate in hertz
Fs= 16;
% pulse repetition frequency in hertz
PRF=1; 
% bandwidth in hertz
B=4; 
% Duraion of the waveform
T=0.25; 
% Pulsewidth <=1/PRF
PW=1;
LFMwaveform = phased.LinearFMWaveform('SampleRate',Fs,'SweepBandwidth',B,'PRF',PRF,'PulseWidth',T);
% bw_lfm = bandwidth(lfmwaveform);
% release(lfmwaveform);
LFMwaveform.NumPulses =4;
x = LFMwaveform();
figure(1);
ambgfun(x,LFMwaveform.SampleRate,LFMwaveform.PRF);
 
%dc_rect = dutycycle(lfmwaveform.PulseWidth,lfmwaveform.PRF);
figure(2);
ambgfun(x,LFMwaveform.SampleRate,LFMwaveform.PRF,'Cut','Delay');
figure(3);
ambgfun(x,LFMwaveform.SampleRate,LFMwaveform.PRF,'Cut','Doppler');
figure(4);
[afmag_lfm,delay_lfm,doppler_lfm] = ambgfun(x,LFMwaveform.SampleRate,LFMwaveform.PRF);
surf(delay_lfm*1e6,doppler_lfm/1e3,afmag_lfm,'LineStyle','none');
%xlim([-8,8]);
%ylim([-8,8]);
axis tight; 
grid on; 
%view([140,35]); 

colorbar;
xlabel('Delay \tau (us)');
ylabel('Doppler f_d (kHz)');
title('LFM Pulse Waveform Ambiguity Function');