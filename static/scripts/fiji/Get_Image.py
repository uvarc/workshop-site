from ij import IJ						# find the IJ class

imp = IJ.getImage()						# get active Image Window and assign to imp variable
print "\nTitle:", imp.getTitle()		# output image title

# output image dimensions
print "Channels:", imp.getNChannels()
print "Focal Planes (Z):", imp.getNSlices()
print "Timepoints (Frames):", imp.getNFrames()
print "Width x Height:", imp.getWidth(), "x", imp.getHeight()
