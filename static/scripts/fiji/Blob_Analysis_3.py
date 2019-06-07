# @ Float (label="Min particle size", value=50) min_size
# @ Float (label="Max particle size", value=200) max_size
# @ Boolean (label="Save ROIs", value=false) save_rois
# @ File (label="Output directory", style="directory") outputdir 

from ij import IJ
from ij.plugin import Duplicator
from ij.plugin.frame import RoiManager
from ij.measure import ResultsTable
from ij.process import ImageStatistics as IS 
from os import path

# open image and create copy
original = IJ.openImage("http://imagej.nih.gov/ij/images/blobs.gif")
original.show()
imp = Duplicator().run(original)
imp.setTitle("Mask")							# rename the copy			

IJ.run(imp, "Median...", "radius=2");
IJ.run(imp, "Options...", "iterations=1 count=1 black")
IJ.setAutoThreshold(imp, "Default")
IJ.run(imp, "Convert to Mask", "")
IJ.run(imp, "Watershed", "")					# break up particle clumps
IJ.run(imp, "Set Measurements...", "area mean min centroid integrated display redirect=None decimal=3")
# hardcoded: "size=50-Infinity display exclude clear summarize add"
moptions = "size=" \
	+ str(min_size) + "-" + str(max_size) \
	+ " display exclude clear summarize add"
IJ.run(imp, "Analyze Particles...", moptions)
imp.show()

# get default instance of RoiManager(used by ParticleAnalyzer)
rm = RoiManager.getInstance2()
# get list of all ROIs     
rois = rm.getRoisAsArray()
# set measurement options
options = IS.MEAN | IS.AREA | IS.CENTROID
# create Results Table
rt = ResultsTable()

# iterate over all ROIs
for roi in rois:
	original.setRoi(roi)
	stats = original.getStatistics(options)		# measure
	rt.incrementCounter()						# advance row counter
	# add values to various columns
	rt.addValue("Label", original.getTitle())
	rt.addValue("Mean", stats.mean)
	rt.addValue("Area", stats.area)
	rt.addValue("Centroid X", stats.xCentroid)
	rt.addValue("Centroid Y", stats.yCentroid)
rt.show("Blob Results")							# show custom table

# save contents of ResultsTable object as .csv file
outputdir = str(outputdir)
resultsfile = path.join(outputdir, "blobs.csv")
print "Results file:", resultsfile
rt.saveAs(resultsfile)

if save_rois:
    roifile = path.join(outputdir, "blobs-rois.zip")
    rm.deselect()						# ensure all ROIs rather than selected are saved
    rm.runCommand("Save", roifile)

	