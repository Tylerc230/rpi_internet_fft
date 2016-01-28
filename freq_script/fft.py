import alsaaudio as aa
#device = "hw:sndrpiwsp"
device = "pcm.dsnoop"
data_in = aa.PCM(aa.PCM_CAPTURE, aa.PCM_NORMAL, device)
data_in.setchannels(2)
data_in.setrate(48000)
data_in.setformat(aa.PCM_FORMAT_S16_LE)
data_in.setperiodsize(1)
print("cardname " + data_in.cardname())
data = data_in.read()
print(data)


