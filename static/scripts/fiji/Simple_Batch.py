# @ File (label="Input directory", style="directory") inputdir 
# @ File (label="Output directory", style="directory") outputdir 

from ij import IJ
import os
from os import path

def process_file(f):
	"""Opens a file and applies a Gaussian filter."""
	print "Processing", f
	imp = IJ.openImage(f)
	IJ.run(imp, "Gaussian Blur...", "sigma=2");
	return imp

def save_as_tif(directory, image):
	"""Saves an ImagePlus object in a specific directory."""
	title = image.getTitle().split(".")[0] + "-blurred.tif"
	outputfile = path.join(outputdir, title)
	IJ.saveAs(image, "TIFF", outputfile)
	print "Saved", outputfile 

	 
# Main code
inputdir = str(inputdir)
outputdir = str(outputdir)
if not path.isdir(inputdir):
    print inputdir, " is does not exist or is not a directory."
else:
	if not path.isdir(outputdir):
		os.makedirs(outputdir)
	filenames = os.listdir(inputdir)
	tif_files = [f for f in filenames if f.split(".")[-1] == "tif"]		# only .tif files
	for tif_file in tif_files:
		fullpath = path.join(inputdir, tif_file)
		imp = process_file(fullpath) 
		save_as_tif(outputdir, imp)
	print "Done.\n"