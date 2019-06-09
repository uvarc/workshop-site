from ij.process import ByteProcessor, ShortProcessor, FloatProcessor, ColorProcessor
from ij import ImagePlus

width = 200									# in pixel
height = 100								# in pixel
bp = ByteProcessor(width, height)			# create ImageProcessor
imp_bp = ImagePlus("New 8-bit image", bp)	# create ImagePlus
imp_bp.show()								# show image window

sp = ShortProcessor(width, height)
imp_sp = ImagePlus("New 16-bit image", sp)
imp_sp.show()

fp = FloatProcessor(width, height)
imp_fp = ImagePlus("New 32-bit image", fp)
imp_fp.show()

cp = ColorProcessor(width, height)
imp_cp = ImagePlus("New RGB image", cp)
imp_cp.show()
