from ij import IJ, ImagePlus  
from ij.process import FloatProcessor  
from array import zeros  
from random import random  
from ij.gui import Roi, OvalRoi  
  
# Create a new ImagePlus filled with noise  
width = 1024  
height = 1024  
pixels = zeros('f', width * height)  
for i in xrange(len(pixels)):  
    pixels[i] = random()  
  
fp = FloatProcessor(width, height, pixels)  
imp = ImagePlus("Random", fp)  
  
# Fill a rectangular region of interest with a value of 2.0  
roi = Roi(40, 100, 400, 300)  
fp.setRoi(roi)  
fp.setValue(2.0)  
fp.fill()  
  
# Fill a oval region of interest with a value of -2.0  
oroi = OvalRoi(500, 300, 150, 550)  
fp.setRoi(oroi)  
fp.setValue(-2.0)  
fp.fill(oroi.getMask())  # Attention! Required for non-rectangular ROIs  
  
imp.show()  