pause(.5);

saveData = []; 

for i = 1:1:noOfRuns
audioToDevice = [S1.' S2.']; 
recObj = playRecSig(aPR, audioToDevice); 

    clear data; 

    data = recObj(:, 2); 
    saveData = [saveData data]; 

    filteredData =  highpass(data, 500, fs);
    pressureInPa = filteredData/probeConversionFactor; 
    pressureInDb = 20*log10(pressureInPa./p0) - 0;

    data = pressureInPa(8000:1.175*fs);

    AllData = data; 
    FFTPressureInPa = 2.*abs(fft(AllData))/length(AllData);
    FFTPressureInDB = 20*log10(FFTPressureInPa./p0) - 0;
    
    semilogx(FFTPressureInDB); 
    hold on; 
    ax = gca;
    ax.XLim = [f3-100, secondaryFrequency+100];
    %ax.YLim = [7, 35];
    title("DPOAE FFT")
    xlabel("f (Hz)")
    ylabel("|dBSPL(f)|")
    pause(1)
end

%%
save(SaveFileAs, "saveData", "probeConversionFactor");

clear saveData;