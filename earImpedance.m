%% Wideband sweep stimulus
f0 = 50;                   %Start frequency
f1 = 15000;                 %End frequency

%Sweep time
t = 5;      

nullTime = fs/4;

%Silent time, after sweep. Due to the fact, that there is an averaging
%process, without determining when the sweep is finished this is just very
%low.
t0 = 1/fs * nullTime;                  

% Generate sine sweep (chirp!)
sinesweep = sweeptone(t,t0,fs,'SweepFrequencyRange',[f0 f1]);
ZeroArray = zeros(nullTime,1);
sinesweep = vertcat(ZeroArray, sinesweep);

%% Record or load sweep to obtain impedance.
audioToDevice = [sinesweep zeros(length(sinesweep),1)]; 
recObj = playRecSig(aPR, audioToDevice); 

dummyArray = recObj(:,2); 

%% Filter data
data = dummyArray;
filteredData =  highpass(data, cutoffFrequency, fs);

%% Convert to pressure
pressureInPa = filteredData/probeConversionFactor; 

%% Convert to SPL dB
pressureInDb = 20*log10(pressureInPa./p0) - 0;

%% Reshape
data = pressureInPa(75020:253150);

%% Calculate and show FFT
FFTPressureInPa = 2.*abs(fft(data))/length(data);
FFTPressureInDB = 20*log10(FFTPressureInPa./p0) - 0; 

%% Ear Canal..
for f = 1:1:7499
    if f < 500
        ZearCanalArray(f) = 0; 
    else
        P = FFTPressureInPa(f);
        P_src = real(Psrc(f+1));
        Z_src = Zsrc(f);
        ZearCanalArray(f) = ((Z_src+1)*P)/(P_src-P);
    end
end

earCanalPath = filePath + "EarImpedance\"
saveZearAs =  earCanalPath + SaveTestDataAs + "_earCanal.mat";
save(saveZearAs, "ZearCanalArray");