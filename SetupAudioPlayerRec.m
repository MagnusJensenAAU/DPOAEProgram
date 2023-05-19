aPR = audioPlayerRecorder('SampleRate', fs);
aPR.SupportVariableSize = true;
aPRDeviceListe = aPR.getAudioDevices;
aPRDevice = aPRDeviceListe{3};          %%% FILLOUT
OutChanList = [1 2];
InChanList = [1 2]; 
aPR.Device = aPRDevice;
aPR.SampleRate = fs;
aPR.PlayerChannelMapping = OutChanList;
aPR.RecorderChannelMapping = InChanList;
aPR.BufferSize = 256;                   %%% FILOUT
            