from ij import IJ


def print_info(imp):
	"""This function prints basic image info."""
	print "\nTitle:", imp.getTitle()
	
	# output image dimensions
	print "Channels:", imp.getNChannels()
	print "Focal Planes (Z):", imp.getNSlices()
	print "Timepoints (Frames):", imp.getNFrames()
	print "Width x Height:", imp.getWidth(), "x", imp.getHeight()


# Main code block
imp = IJ.getImage()
print_info(imp)
