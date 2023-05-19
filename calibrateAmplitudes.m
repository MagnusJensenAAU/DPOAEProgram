%%
if baseFrequency == 1000
    amplitude = 0.1483; 
elseif baseFrequency == 2000
    amplitude = 0.2553; 
elseif baseFrequency == 4000
    amplitude = .0560
elseif baseFrequency == 6000
    amplitude = .1944
end

if FPLCalibration == 1
    while (SPLForwardRMS < baseSPL-1 || SPLForwardRMS > baseSPL+1)
        run("f1Signal.m");
    end
    AmplitudeS1 = amplitude
else
    AmplitudeS1 = amplitude
    S1 = amplitude * S1_;
end

%%
if secondaryFrequency == 1000*1.22
    amplitude = 0.0318; 
elseif secondaryFrequency == 2000*1.22
    amplitude = 0.0373; 
elseif secondaryFrequency == 4000 * 1.22
    amplitude = 0.0140; 
elseif secondaryFrequency == 6000 * 1.22
    amplitude = 0.0614
end

if FPLCalibration == 1
    while (SPLForwardRMS < secondarySPL-1 || SPLForwardRMS > secondarySPL+1)
        run("f2Signal.m");
    end
    AmplitudeS2 = amplitude
else
    AmplitudeS2 = amplitude;
    S2 = amplitude * S;
end