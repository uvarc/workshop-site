---
title: "Introduction to Scientific Image Processing with Fiji/ImageJ"
author: "Christina Gancayco"
# date: 2019-06-03T21:13:14-05:00
categories: ["Image Processing"]
weight: 1
draft: false
---

<p class="lead">This tutorial is an introduction to using Fiji, an open-source and enhanced 
version of the popular ImageJ program used for scientific image processing. Participants 
will be introduced to image processing filters, strategies for image background correction, 
as well as identification and analysis of image objects of interest using segmentation masks.</p>

# Table of Contents
* [**1) Fiji Installation**](#fiji-installation)
* [**2) What is Image Processing?**](#image-processing-overview)
* [What is the Goal of Image Processing?](#goals)
* [Image Processing Applications](#applications)
* [The Digital Representation of an Image](#digital-representation)
* [Types of Digital Images](#types-digital-images)
* [Image Processing & Image Analysis](#image-processing-analysis)
* [**3) Basic Operations in ImageJ/Fiji**](#basic-operations)
* [Handling Image Files](#handling-image-files)
* [Working with Image Channels](#image-channels)
* [Inspecting and Manipulating Image File Properties](#inspecting-and-manipulating)
* [Image Format Operations](#image-format-operations)
* [Useful ImageJ/Fiji Keyboard Shortcuts](#keyboard-shortcuts)
* [**4) Image Processing and Analysis in ImageJ/Fiji**](#image-processing-analysis-imagej-fiji)
* [Image Filtering/Enhancement](#image-filtering-enhancement)
* [Image Segmentation](#image-segmentation)
* [Image Object Measurements](#image-object-measurements)
* [3D Image Reconstruction](#3d-image-reconstruction)
* [**5) Fiji/ImageJ Tutorials and Resources**](#fiji-imagej-tutorials-resources)
* [**6) Exercises**](#exercises)

# <a name="fiji-installation">1) Fiji Installation</a>

Fiji is available on Windows, Mac, and Linux platforms and can be downloaded directly 
from the Fiji website: [https://fiji.sc/](https://fiji.sc/). Fiji is a portable application, 
meaning it doesn't require an installer. To use Fiji, simply download and unzip the application, 
and then you are able to start running it.

To follow along with the exercises, you will also need to download some example images which can be found 
at [https://workshops.somrc.virginia.edu/data/intro-fiji-images.zip](https://workshops.somrc.virginia.edu/data/intro-fiji-images.zip).

# <a name="image-processing-overview">2) What is the Goal of Image Processing?</a>


## <a name="goals">What is the Goal of Image Processing?</a>

* Image Filtering (removal of noise and artifacts)
* Image Enhancement (highlight features of interest)
* Image Segmentation (object recognition)
* Quantitative Image Feature Description (object measurements)

## <a name="applications">Image Processing Applications</a>

* Photography & cinematography
* Digitization of non-digital documents -> text mining
* Natural sciences, engineering
* Forensics, e.g. finger print matching
* Quality control, e.g. in semiconductor fabrication
* Satellite surveillance, e.g. weather forecasting, terrain usage analysis
* Autonomously operating machinery (cars, etc.)
* Automatic cataloging of pictures on the web

## <a name="digital-representation">The Digital Representation of an Image</a>

* 2D images are 2D arrays of numbers organized in rows and columns
* The intersection of row and column is a pixel
* Each pixel is represented as an intensity value (e.g. between 0-255)

<img src=/images/intro-fiji-1.png style="height:75%;width:75%"></img>

## <a name="types-digital-images">Types of Digital Images</a>

<img src=/images/intro-fiji-2.png style="height:75%;width:75%"></img>

## <a name="image-processing-analysis">Image Processing & Analysis</a>

<img src=/images/intro-fiji-3.png style="height:75%;width:75%"></img>

# <a name="basic-operations">3) Basic Operations in ImageJ/Fiji</a>

* [Handling Image Files](#handling-image-files)
* [Working with Image Channels (splitting, merging, LUTs)](#image-channels)
* [Inspecting and Manipulating Image File Properties](#inspecting-and-manipulating)
* [Image Format Operations (cropping, file format conversion...)](#image-format-operations)


## <a name="handling-image-files">Handling Image Files</a>

### Images and Image Stacks in Fiji

<img src=/images/intro-fiji-4.png style="height:75%;width:75%"></img>

## <a name="image-channels">Working with Image Channels</a>

### Manipulating Image Channel Colors

1) **File** > **Open Samples** > **Mitosis (26MB, 5D stack)**

2) **Image** > **Color** > **Channels Tool…**

3) Change from **Composite** to **Color**, move channel slider

4) Uncheck selected channels

5) Change from **Composite** to **Color**, move channel slider

6) Change to “**Grayscale**”

7) Change back to **Color**, Click **More >>**, select new color

8) Change to **Composite** mode

<img src=/images/intro-fiji-5.png style="height:40%;width:40%"></img>

### Manipulating multi-channel Composite and RGB Images: Splitting Channels

1) **File** > **Open Samples** > **Mitosis (26MB, 5D stack)**

2) Go to: **Image** > **Color** > **Split Channels**

<img src=/images/intro-fiji-6.png style="height:40%;width:40%"></img>

### Merging Channels

1) Go to **File** > **Open Samples** > **Fluorescent Cells**.

2) Go to **Image** > **Color** > **Split Channels**.

3) Go to **Image** > **Color** > **Merge Channels**.

4) Select channels as shown, click **OK**.

<img src=/images/intro-fiji-7.png style="height:75%;width:75%"></img>

### Changing Image Color Assignment and Merging Channels into Composite Images

The color representation in 8-bit and 16-bit images is defined by a color Lookup Table (LUT)

**Single channel image**:

* **Image** > **Color** > **Lookup Tables** 

* **Image** > **Lookup Tables**

**Multi-channel image**: 

* **Image** > **Color** > **Channels Tools**

Images displayed in different images can be ***merged*** into multi-channel composite images.  The input ***images need to be of the same type*** (either 8-bit or 16-bit pixel encoding).

## <a name="inspecting-and-manipulating">Inspecting and Manipulating Image File Properties</a>

### Extracting Channels and Creating a Montage

1) Close All Image Windows: **File** > **Close All**.

2) **File** > **Open Samples** > **Fluorescent Cells.**

3) **Image** > **Color** > **Split Channels.**

4) Close **Blue** Image.

5) Select **Red** Image.

6) **Image** > **Lookup Tables** > **Grays**.

7) Select **Green** Image.

8) **Image** > **Lookup Tables** > **Grays**.

9) **Image** > **Color** > **Merge Channels** (green and red channel) select **Keep Sources**.

10) For each of the three images: a) Select first grayscale image, b) **Image** > **Type** > **RGB Color**

11) **Image** > **Stacks** > **Images to Stack**.

12) **Image** > **Stacks** > **Make Montage**.(Columns: 3, Scale factor: 1.0)

<img src=/images/intro-fiji-8.png style="height:75%;width:75%"></img>

## <a name="image-format-operations">Image Format Operations</a>

### Image Size: Cropping

1) Click **Rectangular selection icon**, then draw rectangular box in image.

2) Menu: **Image** -> **Crop** (This crops image to size of rectangular selection box)

<img src=/images/intro-fiji-8.png style="height:75%;width:75%"></img>

### Defining Image Scale

1) Go to **Analyze** > **Set Scale...**

* If **Global** is checked, the new scale (or scale removal) operation is **applied to all open images**.

<img src=/images/intro-fiji-10.png style="height:75%;width:75%"></img>

### Adding a Scale Bar

* The **Overlay** ***will not affect the pixel values*** of the image region under the scale bar.  It is **non-destructive**.

* Saving the image in TIF format retains the non-destructive overlay.

* Saving the image in JPG format burns the overlay into the image.

1) Go to **Analyze** > **Tools** > **Scale Bar...**

2) Go to **Image** > **Overlay** > **Show Overlay/Hide Overlay**

<img src=/images/intro-fiji-11.png style="height:75%;width:75%"></img>

## <a name="keyboard-shortcuts">Useful ImageJ/Fiji Keyboard Shortcuts</a>

| Shortcut             | Operation                    |
| --------             |  --------                    |
| **Ctrl + I**         | Show image file info         |
| **Ctrl + Shift + D** | Duplicate current image      |
| **Ctrl + Shift + X** | Crop image                   |
| **Ctrl + Shift + I** | Invert image                 |
| **Ctrl + A**         | Select All (entire image)    |
| **Ctrl + Shift + A** | Deselect marked region       |
| **Ctrl + M**         | Measure (in selected region) |
| **Ctrl + T**         | Add selection to ROI Manager |

\*On a Mac, use the Command key instead of the Ctrl key.

# <a name="image-processing-analysis-imagej-fiji">4) Image Processing and Analysis in ImageJ/Fiji</a>

* [Image Filtering/Enhancement](#image-filtering-enchancement)

* [Image Segmentation](#image-segmentation)

* [Image Object Measurements](#image-object-measurements)

* [3D Image Reconstruction](#3d-image-reconstruction)

<img src=/images/intro-fiji-12.png style="height:75%;width:75%"></img>

## <a name="image-filtering-enhancement">Image Filtering/Enhancement</a>

### Applying Filters: Noise Removal

Image noise is an undesirable by-product of image capture that adds spurious and extraneous information.

<img src=/images/intro-fiji-13.png style="height:60%;width:60%"></img>

### Comparing Average, Median, Gaussian, and Unsharp Filters

1) Open image file **noisy_image.tif**.

2) Create three copies of the image file: **(Ctrl + Shift + D)**

3) Apply a different filter on each image: 	**(Process -> Filters)**

4) Experiment with settings and click **Preview**.

<img src=/images/intro-fiji-14.png style="height:30%;width:30%"></img>

<img src=/images/intro-fiji-15.png style="height:60%;width:60%"></img>


| Filter        | Effect                                          |
| ------        | ------                                          |
| Mean          | Smoothing, noise spills into neighboring pixels |
| Gaussian Blur | Smoothing, some edge preservation               |
| Median        | Removes outliers, not linear                    |
| Unsharp Mask  | Sharpens edges, amplifies noise                 |


### How Do Filters Work?

#### Comparing Average (Mean) and Median Filters
**Mean**: Replaces pixel value with average value in kernel region

**Median**: Replaces pixel value with median value in kernel region

<img src=/images/intro-fiji-16.png style="height:60%;width:60%"></img>

### Other Filter Options

| **Filter**                 | **Effect**                                                                    |
| ------                     | ------                                                                        |
| Convolve                   | Convolution with **custom** filter                                            |
| Gaussian Blur              | **Gaussian** filter, reasonable edge preservation                             |
| **Replace each pixel:**    |                                                                               |
| Median                     | **Median** of neighbors, non-linear, good for salt-and-pepper noise reduction |
| Mean                       | **Average** of neighbors, smoothing                                           |
| Minimum                    | **Smallest** value of neighbors, smoothing                                    |
| Maximum                    | **Largest** value of neighbors, smoothing                                     |
| Variance                   | **Variance** of neighbors, indicator of image textures, highlight edges       |

### Removing Periodic Noise (Advanced)

<img src=/images/intro-fiji-17.png style="height:60%;width:60%"></img>

### Applying Filters: Edge Detection

* Implemented by applying special convolution kernels

* Sensitive to noise, remove noise with filter first

<img src=/images/intro-fiji-18.png style="height:60%;width:60%"></img>

## <a name="image-segmentation">Image Segmentation</a>

* Image Segmentation is the process that groups individual image pixels that represent specific objects.

* It often involves the application of a variety of image pixel filters.

* It requires binary (black and white) image masks and object shape descriptors (*morphometric* parameters).

### Blob Analysis: *Quantification of the Number and Properties of Objects*

* Dark large spots resemble cells to be counted

* Dark small spots resemble debris that should be ignored

<img src=/images/intro-fiji-19.png style="height:20%;width:20%"></img>

#### Approach:

* Separate dark spots as individual objects from background

* Reject small objects (debris) by size exclusion

* Count total number of objects and compute average object size

* Measure size (2D surface area) of each object

### Segmentation: *Separating "Blobs" from Background*

1) Open image file **blobs_shaded.tif**

2) In menu, go to **Image** > **Adjust** > **Threshold…**

3) Click on image window, then click on **Auto** button in **Threshold** window.

4) Uncheck the **Dark Background** box.  In the drop-down boxes select **“Default”** and **“Red”**.

5) Move the sliders and observe the change of the red pattern overlaying the image. Click **Reset** to remove the overlay. ***Don’t click Apply yet!***

* What is the problem?

### Segmentation: Thresholding Separates *"Blobs" from Background*

**Thresholding:** Group all image pixels by intensity value into two bins.

<img src=/images/intro-fiji-20.png style="height:60%;width:60%"></img>

### Correction of Uneven Background Signal, Steps 1 and 2

#### Approach

1) **Image** > **Duplicate**, Title: **“Bg”**

2) **Process** > **Filters** > **Gaussian Blur…**

* Check **Preview** box.

* Try different **Sigma Radius** values: e.g. 1, 20, 100

* Finally, set **Sigma Radius** = 60.

* Click **OK**.

<img src=/images/intro-fiji-21.png style="height:60%;width:60%"></img>

### Correction of Uneven Background Signal, Step 3

#### Approach

1) **Image** > **Duplicate**, Title: **“Bg”**

2) **Process** > **Filters** > **Gaussian Blur…**

3) **Process** > **Image Calculator…**

* Set up options as shown

* Click OK

<img src=/images/intro-fiji-22.png style="height:30%;width:30%"></img>

### Correction of Uneven Background Signal, Steps 4 and 5

#### Approach

1) **Image** > **Duplicate**, Title: **“Bg”**

2) **Process** > **Filters** > **Gaussian Blur…**

3) **Process** > **Image Calculator…**

4) Click on the **resulting** window

5) **Image** > **Rename...**; enter **“Corr”**

<img src=/images/intro-fiji-23.png style="height:30%;width:30%"></img>

### Correction of Uneven Background Signal, Step 6

#### Approach

1) **Image** > **Duplicate**, Title: **“Bg”**

2) **Process** > **Filters** > **Gaussian Blur…**

3) **Process** > **Image Calculator…**

4) Click on the **resulting** window

5) **Image** > **Rename...**; enter **“Corr”**

6) **Image** > **Type** > **8-bit**

<img src=/images/intro-fiji-24.png style="height:50%;width:50%"></img>

### Correction of Uneven Background Signal, Preparation

* Go to **Process** > **Binary** > **Options**

* Check the **Black background** box.

This controls the display mode of **thresholded** images and also the mode that the **Particle Analyzer** uses to identify objects.

**In this case: objects of interest are displayed white on black background.**

<img src=/images/intro-fiji-25.png style="height:20%;width:20%"></img>

### Correction of Uneven Background Signal, Summary

#### Approach Summary

1) Duplicate **blobs-shaded.tif -> Bg**

2) Bg: apply **Gaussian Blur** (s=60)

3) Corr = **blob-shaded.tif / Bg**

4) Convert Corr to **8-bit**

5) Mask = Corr, apply **Threshold** (default)

<img src=/images/intro-fiji-26.png style="height:30%;width:30%"></img>

### Background Correction Improves Automatic "Blob" Segmentation

<img src=/images/intro-fiji-27.png style="height:60%;width:60%"></img>

### Binary Object Mask

<img src=/images/intro-fiji-28.png style="height:30%;width:30%"></img>

* If you see a message like: **“Convert to 8-bit mask or set background pixels to NaN”**, it means that you are running the thresholding on a 32-bit image.  Convert the Corr image to 8-bit first.

<img src=/images/intro-fiji-29.png style="height:60%;width:60%"></img>

* If you see black objects on white background, check **Process** > **Binary** > **Options**

* Redo the thresholding on **“Corr”** image.

<img src=/images/intro-fiji-30.png style="height:30%;width:30%"></img>

### Analyze Particles, Step 1

1) Go to **Image** > **Rename**: "Mask"

<img src=/images/intro-fiji-31.png style="height:40%;width:40%"></img>

#### Mask Refinement: Splitting Joined Objects

1) **Process** > **Binary** > **Watershed**

2) Save the image obtained after the watershed operation as **blobs-watershed.tif**.

* This only works on binary images, e.g. the black and white “blob” mask.

* It only works for objects that show significant opposing convex-to-concave curvature (neck regions).

<img src=/images/intro-fiji-32.png style="height:50%;width:50%"></img>

### Analyze Particles, Step 2

1) Go to **Image** > **Rename**: "Mask"

2) Go to **Analyze** > **Analyze Particles...**

<img src=/images/intro-fiji-33.png style="height:30%;width:30%"></img>

<img src=/images/intro-fiji-34.png style="height:60%;width:60%"></img>

### Analyze Particles: The ROI Manager

<img src=/images/intro-fiji-35.png style="height:60%;width:60%"></img>

#### ROI Import & Export

* Affects only **selected ROI**

* If **no ROIs selected**, new properties can be applied to all ROIs in Manager

#### More...

* **Save**: Export All Selected ROIs to File

* **Open**: Import ROIs from ROI file

## <a name="image-object-measurements">Image Object Measurements</a>

### Set Measurements

1) **Analyze** > **Set Measurements...**

* Settings affect future measurements, not existing ones.

* Quick measurement: **Ctrl + M**
      
**Measurements occur for current selected region in current image**

**For example:**

<img src=/images/intro-fiji-36.png style="height:15%;width:15%"></img>

* Create selection on image
* Use **Ctrl + M**
* Change Set Measurements Settings
* Use **Ctrl + M**

* Select ROI in ROI Manager
* Use **Ctrl + M**

<img src=/images/intro-fiji-37.png style="height:30%;width:30%"></img>

### Analyze Particles: Customize Particle Parameters and Measure All Particles

1) **Edit** > **Selection** > **Select None** (Ctrl + Shift + A)

2) **Analyze** > **Analyze Particles…**

<img src=/images/intro-fiji-38.png style="height:50%;width:50%"></img>

<img src=/images/intro-fiji-39.png style="height:50%;width:50%"></img>

### Measuring Pixel Intensities

1) **Analyze** > **Set Measurements...***

* Update options

* Click **OK.**
 
<img src=/images/intro-fiji-40.png style="height:30%;width:30%"></img>

#### Select all ROIs:
* **Window** > **Roi-Manager**
* Click on first ROI, **hold Shift** key, 
* scroll down, click last ROI in list.

#### Measure **mask** image
* Click on black/white **mask** image
* In **Roi-Manager**, click **Measure** -> **Results** window
* **File** > **Rename**: **Results** window -> **Mask-Results**
* If you don’t rename the window, the Results will be overwritten by new measurements.

#### Measure **original** image
* Click on **blobs-shaded.tif** image
* In **Roi-Manager**, select all ROIs, click **Measure** -> **Results** window

<img src=/images/intro-fiji-41.png style="height:50%;width:50%"></img>

### Additional ROI Manager Functions

* ROIs that are listed in the ROI Manager window can be saved to a file (single ROI or multiple ROIs).
* Conversely, ROIs can be loaded from file into the ROI Manager and (re-)applied to an image.
* Hand-drawn ROIs created with the ROI tools can be added to the ROI-Manager. 
* ROIs can be renamed and colored.
* ROIs can be combined to create ROIs with complex shapes.

-> See PDF with additional exercises. 


## <a name="3d-image-reconstruction">3D Image Reconstruction</a>

<img src=/images/intro-fiji-42.png style="height:50%;width:50%"></img>

### Isolating the Brain Segmentation

<img src=/images/intro-fiji-43.png style="height:50%;width:50%"></img>

### Creating the Brain Segmentation

1) Apply gaussian filter (0.5).

2) Apply local thresholding (Grey Median, Otsu).

3) Run particle analysis (1000-infinity particle size).

4) Manual clean up segmentation mask as needed.

5) Save brain segmentation mask as TIF image stack.

### Creating the Composite 3D Rendering

1) Go to **File** > **Open Samples** > **T1-Head**

2) Go to **Image** > **Type** > **8-bit**

3) Go to **File** > **Open** > brain-mask.tif 

4) Go to **Process** > **Image Calculator:** t1-head.tif **AND** brain-mask.tif -> brain

5) Go to **Image** > **Color** > **Merge Channels:** t1-head.tif (gray), brain (magenta)

6) Go to **Plugins** > **3D Viewer**

7) Select **Display as Volume**

8) In 3D Viewer, go to **Edit > Change Transparency:** Change skull transparency to 75%
	
9) Go to **View > Create 360 degree animation**

### 3D Rendering of Brain in Skull

<img src=/images/3d-brain-rendering.gif style="height:50%;width:50%"></img>

* Better: Export surfaces in Fiji to .stl files.

* Process .stl surfaces for high quality rendering in other software, e.g. Paraview, Blender, etc..

# <a name="fiji-image-j-tutorials-resources">5) Fiji/ImageJ Tutorials and Resources</a>

[https://imagej.nih.gov/ij/docs/examples/](https://imagej.nih.gov/ij/docs/examples/)

<img src=/images/intro-fiji-44.png style="height:50%;width:50%"></img>

# <a name="exercises">6) Exercises</a>

## 1) Saving files in different file formats
Fiji supports many different file formats.

1) Use **File** > **Open Samples** to open an image of your choosing

2) Go to **File** > **Save As** and pick a file format to export the current image to.

Note that some image file formats use compression algorithms that may reduce the pixel resolution or
dynamic range of an image’s intensity values. The TIF file format is very versatile because it can store
image data without resolution loss, it can handle multi-image files (i.e. image stacks or multi-page),
store image annotations as file internal metadata, and can be read by many programs.
File import/export functionality is further extended by the Bio-Formats plugin (Plugins > Bio-Formats).
See [https://docs.openmicroscopy.org/bio-formats/6.0.0/](https://docs.openmicroscopy.org/bio-formats/6.0.0/)

## 2) Image Channels

### 2.1 Splitting and Merging Channels

1) Go to **File** > **Open Samples** > **Mitosis** (26MB, 5D stack).

2) Go to **Image** > **Color** > **Split Channels.**

3) Go to **Image** > **Color** > **Merge**, merge the two channels but assign new colors to each channel.

What happens if you assign one of the images to multiple different colors?

### 2.2 Manipulating Color Lookup Tables

Color lookup tables (LUTs) can be used on 8-bit grayscale, 16-bit grayscale, and 8-bit Color images. Note that 8-
bit color is not the same as RGB color. LUTs for 16-bit grayscale will be resampled to 8-bit (256 colors).

1) Go to **File** > **Open Samples** > **Clown**

2) Go to **Image** > **Zoom** > **In**.

3) Go to **Image** > **Color** > **Edit LUT**.

Did this work? Look at the image information in the clown.jpg window. Alternatively, go to **Image > Show
information** and look at the **Bits per pixel** entry. What is the image format?

4) Click on the clown.jpg image and convert the image to 8-bit color (**Image > Type > 8-bit Color**) Keep 256
colors (the default). Click **OK**.

5) Go to **Image > Color > Edit LUT**. The window shows the LUT color palette

6) Double click on a LUT tile and edit its RGB values to pure blue. Click **OK** and repeat this for other LUT
entries, change the color representation as you wish.

What do you observe?

## 3) Image Montage

For this exercise we are creating a montage of RGB images, each image representing the center focal plane at a
single timepoint within an x-y-color-t timelapse series. Experiment with creating different image tile sizes and
border widths.

1) **Close** all images (**File** > **Close All**).

2) Go to **File** > **Open Samples** > **Mitosis** (26MB, 5D stack).

3) Go to **Image** > **Type** > **RGB Color**. Keep all slices and frames selected.

4) Go to **Image** > **Duplicate**. Check the **Duplicate Hyperstack** box, enter **Slices (z): 3** (central focal plane),
enter **Frames (t): 1-51**. Click **OK**.

5) Click on the newly created stack. It should contain images for a single focal plane over multiple
timepoints (frames).

6) Save this image stack as a TIF file to your hard drive so you can create new montage layouts without
having to go through steps 1-5 again.

7) Go to **Image** > **Stacks** > **Make Montage**. In the dialog box set the following values:
* **Columns**: 10
* **Rows**: 6
* **Scale factor**: 0.25
* **Border width**: 5
* Check **Use foreground color**

8) Click **OK**.

Select the image stack created in step 5 (or reopen the stack saved in step 6) and create new montages with
modified montage settings. To change the foreground color for the border, double click on the **Color Picker** in
the Fiji toolbar.

<img src=/images/intro-fiji-45.png style="width:5%;height:5%"></img>

## 4) Image Scale Bars

Scale bars can be added to any image. Before a scale bar can be drawn, the pixel size has to be defined.

1) Go to **File** > **Open Sample** and select an image.

2) Repeat step 1 and open a second image.

3) Go to **Analyze** > **Set Scale**.

4) If the image does not have a scale bar, the entries for **Distance in pixels** and **Known distance** will be set
to zero values and **Scale** label will show <no scale> at the bottom the dialog box.

5) Change the values for **Distance in pixels** and **Known distance** to non-zero values. Leave the **Global** box
unchecked.

6) Enter a value for **Unit of length**. This can be any character sequence. If you enter “**um**” (without the
quotes) the unit will be set to **μm**.

7) Click **Ok**.

Look at the active image window (currently in front). The scale is indicated below the window title. The scale of
the second window should remain unaltered.

8) Go to **Analyze** > **Set Scale** again.

9) Change the **Distance in pixels**, **Known distance**, and **Unit of length** values.

10) Check the **Global** box.

11) Click **Ok**.

Note that the scale has changed for all open images. To remove a scale bar from an image, go to **Analyze** > **Set
Scale** and press the **Click to Remove Scale** button. If the **Global box** is checked, it will remove the scale on all
open images, otherwise the scale will be removed for the current image only.

## 5) Custom Image Filters

To apply a filter to images, a convolution kernel has to be created. The built in filters have standardized
convolution kernels. You can create your own convolution kernels to create custom filters. In this example we
create a simple edge detector, called the Sobel operator.

1) Open the noisy.tif image.

2) Apply a filter to remove the salt-and-pepper noise, e.g. with the median filter.

3) Duplicate the image.

4) Go to **Process** > **Filters** > **Convolve**.

5) In the **textfield** of the dialog box, enter these numbers (**each number separated by a white space**).

-1 0 1

-2 0 2

-1 0 1

6) Check the **Preview** box. Experiment with changing the kernel values; make sure to keep the square
matrix format.

7) Click **OK**.
What edges are highlighted in the image? Can you modify the kernel to detect the missing vertical edges?
8) Create another kernel with these values and apply it to the copied image obtained in step 3:

-1 -2 -1

0 0 0

1 2 1

What edges are being detected now?

9) Go to **Process** > **Image Calculator**.

10) Select the output image from step 7 as Image 1.

11) Change **Operation** to **Max**.

12) Select the output image from step 8 as Image 2.

13) Check the **Create new window** box.

14) Check the **32-bit (float) result** box.

15) Click **OK**.

The resulting image should show a combination of edges detected in steps 7 and 8. Can you create four kernels
to detect all vertical and horizontal edges?

## 6. Image Segmentation & Object Measurements

For this exercise we assume that we already have a binary mask (thresholded) image, and we will use the
Particle Analyzer for image segmentation and object measurements.

1) Open the **blobs-watershed.tif** image. This should be a binary image.

2) Go to **Analyze** > **Set Measurements** and change the selection of measurement options.

3) Go to **Analyze** > **Analyze Particles** and modify the **Size (pixel^2)**, **Circularity** (1.0 refers to perfect circular
shaped objects), and **Show** options.

4) Click **OK**.

5) Repeat steps 2-4 and experiment with different settings.

Depending on your selection you will see a results table with data for each detected object (if **Display results** is
checked), a summary table for all results (if **Summarize** is checked), and the ROI-Manager (if **Add to Manager** is
checked) with a list of ROIs corresponding to the individual objects.

6) Go to **File** > **Open Samples** > **Blobs**.

7) Click on the **blobs-watershed.tif** image.

8) Go to **Analyze** > **Set Measurements**, check the Min & max gray value and the Mean gray value boxes,
and change the Redirect to option to blobs.gif. This means that object detection is performed on the
blobs-watershed.tif binary mask, but pixel intensity measurements will be performed on the blobs.gif
image due to the redirect.

9) Go to **Analyze** > **Analyze Particles**. Click **OK**.

Repeat the measurement results with and without redirect and compare the changes in the results for **Min &
max gray value** and the **Mean gray value.**

## 7. ROI Manager

The ROI Manager is very useful to handle multiple ROIs. It allows saving/loading ROIs and also to
combine simple shaped ROIs into more complex ones.

1) Open an image of your choice.

2) Use any of the selection tools from the Fiji toolbar to draw a selection area onto
the image.

3) Go to **Selection** > **Edit** > **Add to Manager**. This will add the current selection to the ROI
Manager.

4) Draw a new region of interest and go to **Selection** > **Edit** > **Add to Manager**.

### 7.1 Saving ROIs to file

The ROI Manager should show two ROIs.

5) In the ROI Manager, click on one of the ROIs.

6) In the ROI Manager, click **More>>** and then **Save**. In the dialog box enter a name for the ROI file and
click Save.

7) In the ROI Manager, hold the Shift key and select both ROIs.

8) Click **More>>** and then **Save**. In the dialog box enter a name for the ROI file and click **Save**. This will save
multiple ROI definitions into a single file.

**Notes:**

* For a single ROI, the default ROI file extension is **.roi**. For multiple ROIs, the default file extension is **.zip.**

* If none of the ROIs are selected, the operations in the ROI Manager are applied to all ROIs.

### 7.2 Opening ROIs from file.
1) In the ROI Manager, select all ROIs and click **Delete**.

2) Click on **More>>** and then click **Open**. Select the ROI file saved under exercise 7.1 step 8 (multiple ROIs).

3) Click on one of the ROIs in the ROI Manager. This should create corresponding selection in the current
image.

**Note:** You can open another image and reload saved ROIs to apply them to the new current image.

### 7.3 Changing ROI display properties
Each ROI has multiple properties, e.g. position, color, etc.

1) In the ROI Manager, select the first ROI (or reload from file).

2) Click on Properties.

3) Change the **Name** to ROI\_1, the **Stroke color** to blue, and the **width** to 2. Click **OK**.

4) Select the second ROI.

5) Click on Properties.

6) Change the **Name** to ROI\_2, the **Stroke color** to red, the **width** to 1, and the **Fill color** to cyan. Click **OK**.

7) Click **OK**.

If you have multiple ROIs selected OR none at all, the properties will be applied to all ROIs.

### 7.3 Combining ROIs

Simple ROI shapes can be combined into more complex ones.

1) In the current image, draw a new selection that partially overlaps the first ROI.

2) Add the selection to the ROI Manager. It should show as the last one in the ROI Manager list.

3) In the ROI Manager, hold the **Ctrl** (Windows) or **Command** (Mac) key and click on the first and
third ROI.

4) A context menu should pop up; if not, click on **More >>**. In the ROI Manager’s context menu,
select **OR (Combine)**. The menu will disappear. In the ROI Manager, click on **Add [t]** button. A
new ROI will appear at the bottom of the ROI Manager list.

5) Select the last ROI in the list (the one you just created). It encompasses the combined area of
the first and third ROI.

6) Repeat steps 3 and 4 but choose different ROI combination methods, e.g. **And, XOR**. The **And**
operation produces a new ROI that contains only the overlapping region of the selected ROIs,
while the **XOR** operation creates a combined ROI that excludes any overlap between the
selected ROIs.




