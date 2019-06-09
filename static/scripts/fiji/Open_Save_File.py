from ij import IJ
from ij.io import FileSaver
import os
from os import path

# Open file from URL or storage device
filesource = "http://imagej.nih.gov/ij/images/blobs.gif"
imp = IJ.openImage(filesource)
imp.show()

# Save file in original format (interactive dialog)
fs = FileSaver(imp)
fs.save() # could also use fs.saveAsTiff(), fs.saveAsPng(), etc.

# Create new output directories and filename
homedir = path.expanduser("~")							# home directory
outputdir = path.join(homedir, "workshop", "images")	# full dir path
print outputdir
if not path.isdir(outputdir):
    os.makedirs(outputdir)		# create outputdir if it does not exist

outputfile = path.join(outputdir, "blobs-2.tif")
# Save file as .tif (non-interactive)
IJ.saveAs(imp, "tiff", outputfile)
print "Saved file:", outputfile