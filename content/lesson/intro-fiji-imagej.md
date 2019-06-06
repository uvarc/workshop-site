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
* [**1. Fiji Installation**](#fiji-installation)
* [**2. What is Image Processing?**](#image-processing-overview)
* [What is the Goal of Image Processing?](#goals)
* [Image Processing Applications](#applications)
* [The Digital Representation of an Image](#digital-representation)
* [Types of Digital Images](#types-digital-images)
* [Image Processing & Image Analysis](#image-processing-analysis)
* [**3. Basic Operations in ImageJ/Fiji**](#basic-operations)
* [Handling Image Files](#handling-image-files)
* [Working with Image Channels](#image-channels)
* [Inspecting and Manipulating Image File Properties](#inspecting-and-manipulating)
* [Image Format Operations](#image-format-operations)
* [Useful ImageJ/Fiji Keyboard Shortcuts](#keyboard-shortcuts)
* [**4. Image Processing and Analysis in ImageJ/Fiji**](#image-processing-analysis-imagej-fiji)
* [Image Filtering/Enhancement](#image-filtering-enhancement)
* [Image Segmentation](#image-segmentation)
* [Image Object Measurements](#image-object-measurements)
* [3D Image Reconstruction](#3d-image-reconstruction)
* [**5. Fiji/ImageJ Tutorials and Resources**](#fiji-imagej-tutorials-resources)
* [**6. Exercises**](#exercises)

# <a name="fiji-installation">1. Fiji Installation</a>

Fiji is available on Windows, Mac, and Linux platforms and can be downloaded directly 
from the Fiji website: [https://fiji.sc/](https://fiji.sc/). Fiji is a portable application, 
meaning it doesn't require an installer. To use Fiji, simply download and unzip the application, 
and then you are able to start running it.


# <a name="image-processing-overview">2. What is the Goal of Image Processing?</a>


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

# <a name="basic-operations">3. Basic Operations in ImageJ/Fiji</a>

* [Handling Image Files](#handling-image-files)
* [Working with Image Channels (splitting, merging, LUTs)](#image-channels)
* [Inspecting and Manipulating Image File Properties](#inspecting-and-manipulating)
* [Image Format Operations (cropping, file format conversion...)](#image-format-operations)


## <a name="handling-image-files">Handling Image Files</a>

### Images and Image Stacks in Fiji

<img src=/images/intro-fiji-4.png style="height:75%;width:75%"></img>

## <a name="image-channels">Working with Image Channels</a>

### Manipulating Image Channel Colors

1. **File** > **Open Samples** > **Mitosis (26MB, 5D stack)**

2. **Image** > **Color** > **Channels Tool…**

3. Change from **Composite** to **Color**, move channel slider

4. Uncheck selected channels

5. Change from **Composite** to **Color**, move channel slider

6. Change to “**Grayscale**”

7. Change back to **Color**, Click **More >>**, select new color

8. Change to **Composite** mode

<img src=/images/intro-fiji-5.png style="height:40%;width:40%"></img>

### Manipulating multi-channel Composite and RGB Images: Splitting Channels

1. **File** > **Open Samples** > **Mitosis (26MB, 5D stack)**

2. Go to: **Image** > **Color** > **Split Channels**

<img src=/images/intro-fiji-6.png style="height:40%;width:40%"></img>

### Merging Channels

1. Go to **File** > **Open Samples** > **Fluorescent Cells**.

2. Go to **Image** > **Color** > **Split Channels**.

3. Go to **Image** > **Color** > **Merge Channels**.

4. Select channels as shown, click **OK**.

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

1. Close All Image Windows: **File** > **Close All**.

2. **File** > **Open Samples** > **Fluorescent Cells.**

3. **Image** > **Color** > **Split Channels.**

4. Close **Blue** Image.

5. Select **Red** Image.

6. **Image** > **Lookup Tables** > **Grays**.

7. Select **Green** Image.

8. **Image** > **Lookup Tables** > **Grays**.

9. **Image** > **Color** > **Merge Channels** (green and red channel) select **Keep Sources**.

10. For each of the three images: a) Select first grayscale image, b) **Image** > **Type** > **RGB Color**

11. **Image** > **Stacks** > **Images to Stack**.

12. **Image** > **Stacks** > **Make Montage**.(Columns: 3, Scale factor: 1.0)

<img src=/images/intro-fiji-8.png style="height:75%;width:75%"></img>

## <a name="image-format-operations">Image Format Operations</a>

### Image Size: Cropping

1. Click **Rectangular selection icon**, then draw rectangular box in image.

2. Menu: **Image** -> **Crop** (This crops image to size of rectangular selection box)

<img src=/images/intro-fiji-8.png style="height:75%;width:75%"></img>

### Defining Image Scale

1. Go to **Analyze** > **Set Scale...**

* If **Global** is checked, the new scale (or scale removal) operation is **applied to all open images**.

<img src=/images/intro-fiji-10.png style="height:75%;width:75%"></img>

### Adding a Scale Bar

* The **Overlay** ***will not affect the pixel values*** of the image region under the scale bar.  It is **non-destructive**.

* Saving the image in TIF format retains the non-destructive overlay.

* Saving the image in JPG format burns the overlay into the image.

1. Go to **Analyze** > **Tools** > **Scale Bar...**

2. Go to **Image** > **Overlay** > **Show Overlay/Hide Overlay**

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

# <a name="image-processing-analysis-imagej-fiji">4. Image Processing and Analysis in ImageJ/Fiji</a>

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

1. Open image file **noisy_image.tif**.

2. Create three copies of the image file: **(Ctrl + Shift + D)**

3. Apply a different filter on each image: 	**(Process -> Filters)**

4. Experiment with settings and click **Preview**.

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

## <a name="image-segmentation">Image Segmentation</a>

## <a name="image-object-measurements">Image Object Measurements</a>

## <a name="3d-image-reconstruction">3D Image Reconstruction</a>

# <a name="fiji-image-j-tutorials-resources">5. Fiji/ImageJ Tutorials and Resources</a>

# <a name="exercises">6. Exercises</a>

















