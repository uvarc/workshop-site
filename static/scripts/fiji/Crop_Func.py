from ij.gui import Roi
from ij import IJ
from ij.plugin import Duplicator


def create_roi(imgwidth, imgheight, rel_size):
    """Create rectangular ROI centered in image"""
    roiwidth = int(rel_size * imgwidth)
    roiheight = int(rel_size * imgheight)
    top_left_x = int(0.5 * (imgwidth - roiwidth))
    top_left_y = int(0.5 * (imgheight - roiheight))
    roi = Roi(top_left_x, top_left_y, roiwidth, roiheight)
    return roi

def crop_image(imp, roi):
    """set ROI on image, crop, set title"""
    cropped_imp = Duplicator().run(imp)
    cropped_imp.setRoi(roi)
    IJ.run(cropped_imp, "Crop", "")					# modifies passed ImagePlus object!
    cropped_imp.setTitle("Cropped: " + imp.getTitle())
    return cropped_imp

imp = IJ.getImage()
for scale in [0.25, 0.5, 0.75]:
    roi = create_roi(imp.getWidth(), imp.getHeight(), scale)
    cropped_imp = crop_image(imp, roi)
    cropped_imp.show()
