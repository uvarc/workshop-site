from ij import IJ
from ij import ImagePlus
import os
from os import path

imp = IJ.openImage("http://imagej.nih.gov/ij/images/Spindly-GFP.zip")

channel_no = imp.getNChannels()		# last channel
slice_no = 1 + imp.getNSlices() // 2	# center slice
stack = imp.getStack()
calibration = imp.getCalibration().copy()

# create output dir if it does not exist
outputdir = path.join(path.expanduser("~"), "workshop", "images")
print outputdir
if not path.isdir(outputdir):
    os.makedirs(outputdir)

# iterate over all frames and save central slice of last channel
for frame_no in range(1, imp.getNFrames() + 1):
	stack_index = imp.getStackIndex(channel_no, slice_no, frame_no)
	ip = stack.getProcessor(stack_index)
	# remove extension from image title and add frame no as suffix 
	title = imp.getTitle().split(".")[0] + "-" + str(frame_no)
	single_imp = ImagePlus(title, ip)
	single_imp.setCalibration(calibration)
	# create file name with absolute path (incl directory name) and save
	outputfile = path.join(outputdir, title)
	IJ.saveAs(single_imp, "Tiff", outputfile)