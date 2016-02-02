import alsaaudio as aa
import numpy as np
from struct import unpack
from time import sleep
device = "hw:sndrpiwsp"
#device = "pcm.dsnoop"
chunk = 512
sample_rate = 48000
data_in = aa.PCM(aa.PCM_CAPTURE, aa.PCM_NORMAL, device)
data_in.setchannels(2)
data_in.setrate(sample_rate)
data_in.setformat(aa.PCM_FORMAT_S16_LE)
data_in.setperiodsize(chunk)
print("cardname " + data_in.cardname())

def calculate_levels(data, frames, sample_rate):
    data = unpack("%dh"%(len(data)/2), data)
    data = np.array(data, dtype='h')
    fourier = np.fft.rfft(data)
    fourier = np.delete(fourier, len(fourier)-1)
    power = np.log10(np.abs(fourier))**2
    power = np.reshape(power, (8, frames/8))
    matrix = np.int_(np.average(power, axis=1)/4)
    print(matrix)

while True:
    l,data = data_in.read()
    data_in.pause(True)
    print("frames: %u data length: %u" % (l, len(data)) )
    calculate_levels(data, l, sample_rate) 
    sleep(.1)
    data_in.pause(False)




