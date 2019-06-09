from ij import IJ

imp = IJ.openImage("http://imagej.nih.gov/ij/images/boats.gif")
IJ.run(imp, "Gaussian Blur...", "sigma=5")
IJ.saveAs(imp, "Tiff", "/Users/khs3z/workshop/images/blurry_boats.tif")
