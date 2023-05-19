%% Simple P controller to adjust the gain
error = real(secondarySPL) - SPLForwardRMS;
error = 10^(error/20);
P = K_p * error;
amplitude = amplitude*P

if amplitude > 1
    amplitude = 1; 
    S2 = amplitude * S;
    SPLForwardRMS = secondarySPL; 
else
    S2 = amplitude * S; 


%% Play or load the sine wave recorded.
audioToDevice = [S2.' zeros(length(S2),1)]; 
recObj = playRecSig(aPR, audioToDevice); 

dummyArray = recObj(:,2);   % To only use 1 channel, as signal is 2.

%% Calculate ear canal pressure
pressureInPa = (dummyArray/probeConversionFactor);

%% reshape data (remove zero sound)
pressureInPa = pressureInPa(8000:1.2*fs); 
    
%% highpass filter on the data..
filteredData =  highpass(pressureInPa, cutoffFrequency, fs);

%% Calculate RMS of measured data, in PA.
RMS = rms(filteredData);

%% Calculate SPL
SPL = 20*log10(filteredData/p0); 

SPLrms = rms(real(SPL));

%% Calculate forwardSPL
PaForward = 1/2*filteredData*(1+Z0/ZearCanalArray(secondaryFrequency));
SPLForward = 20*log10(PaForward/p0);

SPLForwardRMS = rms(real(SPLForward))
end
