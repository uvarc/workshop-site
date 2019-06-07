from ij.gui import Roi
from ij import IJ
from ij.plugin import Duplicator

imp = IJ.getImage()
# duplicate all channels, all slices, and all frames
cropped_imp = Duplicator().run(imp)

# create rectangular ROI centered in image
rel_size = 0.5								# 0.0 < rel_size < 1.0
width = int(rel_size * imp.getWidth())
height = int(rel_size * imp.getHeight())
top_left_x = int(0.5 * (imp.getWidth() - width))
top_left_y = int(0.5 * (imp.getHeight()- height))
roi = Roi(top_left_x, top_left_y, width, height)

# set ROI on image, crop, set title and show image
cropped_imp.setRoi(roi)
IJ.run(cropped_imp, "Crop", "")				# modifies passed ImagePlus object!
cropped_imp.setTitle("Cropped")
cropped_imp.show()
