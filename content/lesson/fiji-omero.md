---
title: "Image Processing with Fiji and Omero"
author: "Karsten Siller"
output:
  pdf_document: default
  html_document: default
categories: ["Image Processing"]
toc: True
daft: false
---

# Introduction to OMERO

OMERO is an image management software package that allows you to organize, view, annotate, analyze, and
share your data from a single centralized database. With OMERO, you and your collaborators
can access your images from any computer without having to download the images directly to
your machine.

Images in OMERO can be manipulated and viewed interactively through desktop and web clients, or through scripting interfaces for Python, Java, shell scripts, Matlab, and Fiji/ImageJ.

For more details, review the [OMERO tutorial](/lesson/omero-hands-on) or visit the Research Computing website describing the [UVA Omero Database Service](https://www.rc.virginia.edu/userinfo/omero/overview/).

# Setup for this Workshop

### Installation of Fiji and the OMERO Plugin

1. Install the Fiji application on your computer as described in this [tutorial](http://localhost:1313/lesson/fiji-intro/#fiji-installation-a).

2. Start Fiji and go to `Help` > `Update`. This starts the updater which looks for plugin updates online.

3. In the `ImageJ Updater` dialog window, click on `Manage Update Sites`. Ensure that the boxes for the following plugins are checked:

    * Java-8
    
    * Bio-Formats
    
    * OMERO 5.4
    

4. Click `Close`. This will take you back to the `ImageJ Updater` window.

5. Click `Apply Changes`.

6. Restart Fiji.

---

### Check your OMERO Database Account

1. If you are accessing the OMERO Database from an off-Grounds location, you have to connect through a UVA Virtual Private Network (VPN).  Please follow these [instructions to set up your VPN](https://virginia.service-now.com/its?id=itsweb_kb_article&sys_id=f24e5cdfdb3acb804f32fb671d9619d0).

2. Open a webbrowser and go to http://omero.hpc.virginia.edu. Login to the OMERO web interface is described [here](/lesson/omero/#using-omero-web).

    * **Username:** Your computing ID
    
    * **Password:** Your personal password
    
	If you are new to UVA's OMERO Database, a temporary password had been emailed to you.  

	**Please change your temporary password when you log in for the first time to the Omero database server as described in these [instructions](https://www.rc.virginia.edu/userinfo/omero/overview/#changing-your-omero-database-password).** 

3. You may be a member of multiple groups. For this workshop we want to specify  `omero-demo ` as the default group.
 
If you cannot login, please submit a [support request](https://www.rc.virginia.edu/form/support-request/).  Select **Omero Image Analysis** as Support Category.  

---

# Working with the OMERO Web Client and Desktop Applications

OMERO provides a group of client software to work with your imaging data.

* [OMERO.web Client](https://docs.openmicroscopy.org/omero/5.6.1/users/clients-overview.html#omero-web): 

	OMERO.web is a web-based client for OMERO.  At UVA you can use it by connecting to http://omero.hpc.virginia.edu. The Web client can be used to view images and metadata, and manage image tags, results, annotations, and attachments. It cannot be used to import data or measure regions-of-interest (see OMERO.insight).
	
	* View Data
	
	* Import Data
	
	* View Image Metadata
	
	* Manage Image Tags
	
	* Manage Results and Annotations

* [OMERO.isight](https://docs.openmicroscopy.org/omero/5.6.1/users/clients-overview.html#omero-insight): 

	The two main additional features of OMERO.insight which are not available as yet for OMERO.web are:

	* The Measurement Tool, a sub-application of ImageViewer that enables size and intensity measurements of defined regions-of-interest (ROIs), and 
	
	* image import

* [OMERO.importer](https://docs.openmicroscopy.org/omero/5.6.1/users/clients-overview.html#omero-importer): 

	The OMERO Importer is part of the OMERO Desktop client but can also be run as a standalone application.

* [OMERO.cli](https://docs.openmicroscopy.org/omero/5.6.1/users/clients-overview.html#omero-cli): 

	The OMERO.cli tools provide a set of administration and advanced command line tools written in Python.


For this workshop we will be using the OMERO Web client.


# Projects, Datasets, Screens, Plates and Images

For this workshop we will be using prepared image sets and also upload new image data to your accounts.  Omero organizes images in nested hierarchies of `Projects` and `Datasets` or `Screens` and `Plates`. The hierarchical nature is visualized as tree structures in the OMERO.web and OMERO.insight clients.  

Images can be linked to individual projects, datasets, screens, or plates. A given image can be linked to multiple folders, allowing you to logically assign the same image to different folders without copying it. You can think of it like smart folders or symbolic links.

In addition, each group has a folder `Orphaned Images` that contains images that have not been linked to any projects, datasets, screens, or plates.

**Note:**
Each project, dataset, screen, plate, and image has a __unique numerical ID__ that unambiguously identifies the data artifact.  We use these numerical IDs rather than image, folder, or filenames to get access to these elements.

### Sample Data

Sample data has been added to the `Fiji Omero Workshop` project.  Inside the blue project folder you will find several dataset subfolders. 

* Group: **omero-demo** (Group ID: `53`)

* Project: **Fiji Omero Workshop** (Project ID: `130`)

**Take note of the Group ID and Project ID.**

### Your Personal Dataset

Let's create a new dataset in the workshop project. 

1. Right click on the Blue folder icon labeled `Fiji Omero Workshop`. In the popup menu, select `Create new` > `Dataset`. 

2. Name the new Dataset`<YOUR_UID>_workshop`, for example `mst3k_workshop`. After the dataset is generated, your user interface should look like this:
    ![](/images/fiji-omero-dataset.png)
    
3. Click on the green folder icon of your new dataset and take note of the `Dataset ID`. We will need this to direct Fiji where to load data from or save data to.

---

# Interactive Use of Fiji and OMERO

### Uploading Images with the OMERO.insight client

Here we will demonstrate, the upload of a set of image files via the OMERO.insight client. The import process is described in our [OMERO.insight Import Tutoril](/lesson/omero-hands-on). 

After the upload, the files are located in the following Project and Dataset: 

* **Project:** Fiji Omero Workshop (Project ID: `130`)

* **Dataset:** HeLa Cells (Dataset ID: `265``)

**Note that images cannot be uploaded with the web-based OMERO.web client.**

---

### Uploading Images with Fiji

Images that have been opened and are displayed in the Fiji graphical user interface can be uploaded to OMERO using the `File` > `Export` > `OMERO...` command. The naming of the tool can be confusing -- it's all a matter of perspective: **Export from Fiji** equates to an **Import in OMERO**.  To minimize possible confusion we avoid these terms for the purpose of this workshop and refer to **upload** for any process that sends data to OMERO and **download** for any process that retrieves data from OMERO.

Before you begin, you need to know the dataset ID that the image should be linked to in OMERO. You can use the OMERO.web, OMERO.insight, or OMERO.cli tools to look up an appropriate dataset ID for this. **Keep in mind that you can upload images only to those Projects and Datasets that you own.**

* If you choose a dataset ID -1, the image will be added to the `Orphaned Images` in your default OMERO group.  For this workshop, we have chosen the `omero-demo` group as default. 

* Alternatively, you can export the image to a specific dataset in your default group, you just need to provide the dataset ID when executing the upload command.

**Note: Image uploads via the built-in OMERO Export function is limited to your default group.** This is not an issue if you belong to a single group.  If you are a member of multiple groups, you can change your default group via the OMERO.web client. 

<br>

### Exercises

**Export RGB image**

1. File > Open Sample > Leaf (36k)

2. File > Export > OMERO...

	Since we chose `Dataset: -1`, the uploaded image will end up in `Orphaned Images` for your group. 

3. Go to OMERO webclient (http://omero.hpc.virginia.edu) and look for the uploaded image in `Orphaned Images`.

<p float="right">
  <img src="/images/fiji-omero/leaf.png" height="350" />
  <img src="/images/fiji-omero/fiji-omero-new-export.png" height="350" /> 
</p>


<br>

**Export image stack to a specific dataset**

1. In the OMERO webclient, create a new dataset under your personal workshop project. **Make note of the dataset ID.**

2. File > Open Samples > T1 Head (2.4M, 16-bit)

3. File > Export > OMERO...

**Question:** What happens when you repeatedly upload the same image to Omero

---

### Uploading Results and ROIs with Fiji

1. In the OMERO.web client, make note of a dataset ID where you would like to upload an new image and associated results file to.  You make pick the dataset ID from the previous exercise.

2. In Fiji, go to `File` > `Open Samples` > `Blobs (25K)`

3. Let's apply some basic filtering and simple image segmentation to identify all cellular outlines in the image:

	a. Go to `Process` > `Filter` > `Median`.  In the popup dialog enter a `Radius` of  `3.0` and click `OK`.  This will smooth out some of the image intrinsic noise without degrading the object outlines.

	b. Go to `Image` > `Adjust Threshold`.  In the popup dialog choose the `Default` thresholding algorithm, uncheck the `Dark Background` box and click `Apply`. The image should have been converted to a binary mask with white objects ona black background.
	<p float="right">
		<img src="/images/fiji-omero/fiji-omero-setthreshold.png" height="200" />
		<img src="/images/fiji-omero/fiji-omero-blobs-thresholded.png" height="200" />
	</p>

	c. Go to `Analyze` > `Set Measurements...`. In the popup dialog specify the parameters as shown in this screenshot. Click `OK`.

	d. Go to `Analyze` > `Analyze Particles` and set up the parameters as shown. Click `OK`.  
	
	<p float="right">	
  		<img src="/images/fiji-omero/fiji-omero-setmeasurements.png" height="350" /> 
  		<img src="/images/fiji-omero/fiji-omero-analyzeparticles.png" height="200" />
	</p>
	
	e. These steps should create a `Results` and a `Summary` table.

3. Go to `File` > `Export` > `OMERO...`.  Enter the dataset ID you chose under step 1 and click `OK`.

	<p float="right">	
  		<img src="/images/fiji-omero/fiji-omero-blobs-export.png" height="350" /> 
	</p>

---

# Scripting

### Getting the Basic OMERO Dataset Info

OMERO organizes users in groups. Each user can be a member of multiple groups. Images are organized in Projects and Datasets, or in Screens and Plates. The following script, `Omero_Info.py`, connects a user to a remote OMERO instance and shows a list of:

* the groups that the user belongs to and the associated group ID. This ID is important when you want to access images stored for a particular group;
* the projects and datasets for a particular group (specified via unique grpup ID);
* and a list of images, organized by project and dataset, that the user has access to in a particular group.

<details>
<summary>View `Omero_Info.py` script</summary>
```
#@ String (label="Omero User") username
#@ String (label="Omero Password", style="password") password
#@ String (label="Omero Server", value="omero.hpc.virginia.edu") server
#@ Integer (label="Omero Port", value=4064) server_port
#@ Integer (label="Omero Group ID", min=-1, value=-1) group_id


# Basic Java and ImageJ dependencies
from ij.measure import ResultsTable
from java.lang import Long
from java.lang import String
from java.util import ArrayList

# Omero dependencies
import omero
from omero.gateway import Gateway
from omero.gateway import LoginCredentials
from omero.gateway import SecurityContext
from omero.gateway.exception import DSAccessException
from omero.gateway.exception import DSOutOfServiceException
from omero.gateway.facility import BrowseFacility
from omero.log import SimpleLogger


def connect(group_id, username, password, host, port):    
    '''Omero Connect with credentials and simpleLogger'''
    cred = LoginCredentials()
    if group_id != -1:
    	cred.setGroupID(group_id)
    cred.getServer().setHostname(host)
    cred.getServer().setPort(port)
    cred.getUser().setUsername(username)
    cred.getUser().setPassword(password)
    simpleLogger = SimpleLogger()
    gateway = Gateway(simpleLogger)
    e = gateway.connect(cred)
    return gateway


def get_groups(gateway):
    currentGroupId = gateway.getLoggedInUser().getGroupId()
    ctx = SecurityContext(currentGroupId)
    adminService = gateway.getAdminService(ctx, True)
    uid = adminService.lookupExperimenter(username)
    groups = []
    for g in sorted(adminService.getMemberOfGroupIds(uid)):
        groupname = str(adminService.getGroup(g).getName().getValue())
        groups.append({
            'Id': g,
            'Name': groupname,
        })
        if g == currentGroupId:
            currentGroup = groupname     
    return groups, currentGroup


def get_projects_datasets(gateway):
    results = []
    proj_dict = {}
    ds_dict = {}
    groupid = gateway.getLoggedInUser().getGroupId()
    ctx = SecurityContext(groupid)
    containerService = gateway.getPojosService(ctx)

    # Read datasets in "Project", "Dataset", "Screen", "Plate"
    projects = containerService.loadContainerHierarchy("Project", None, None)
    for p in projects:                # omero.model.ProjectI
        p_id = p.getId().getValue()
        p_name = p.getName().getValue()
        proj_dict[p_id] = p_name
        for d in p.linkedDatasetList():
            ds_id = d.getId().getValue()
            ds_name = d.getName().getValue()
            results.append({
                'Project Id': p_id,
                'Project Name': p_name,
                'Dataset Id': ds_id,
                'Dataset Name': ds_name,
                'Group Id': groupid,
            })
            ds_dict[ds_id] = ds_name     

    # read datasets not linked to any project
    ds_in_proj = [p['Dataset Id'] for p in results]
    ds = containerService.loadContainerHierarchy("Dataset", None, None)
    for d in ds:                # omero.model.ProjectI
        ds_id = d.getId().getValue()
        ds_name = d.getName().getValue()
        if ds_id not in ds_in_proj:
            ds_dict[ds_id] = ds_name
            results.append({
                'Project Id': '--',
                'Project Name': '--',
                'Dataset Id': ds_id,
                'Dataset Name': ds_name,
                'Group Id': groupid,
            })
    return results, proj_dict, ds_dict         


def get_images(gateway, datasets, orphaned=True):
    '''Return all image ids and image names for provided dataset ids'''
    browse = gateway.getFacility(BrowseFacility)
    experimenter = gateway.getLoggedInUser()
    ctx = SecurityContext(experimenter.getGroupId())
    images = []
    for dataset_id in datasets:
        ids = ArrayList(1)
        ids.add(Long(dataset_id))
        j = browse.getImagesForDatasets(ctx, ids).iterator()
        while j.hasNext():
            image = j.next()
            images.append({
		        'Image Id': String.valueOf(image.getId()),
		        'Image Name': image.getName(),
		        'Dataset Id': dataset_id,
		        'Dataset Name': datasets[dataset_id],
            })
    if orphaned:
        orphans = browse.getOrphanedImages(ctx, ctx.getExperimenter()) # need to pass user id (long)
        for image in orphans:
            images.append({
                'Image Id': String.valueOf(image.getId()),
                'Image Name': image.getName(),
                'Dataset Id': -1,
                'Dataset Name': '<Orphaned>',
            })
     return images


def show_as_table(title, data, order=[]):
    table = ResultsTable()
    for d in data:
        table.incrementCounter()
        order = [k for k in order]
        order.extend([k for k in d.keys() if not d in order])
        for k in order:
            table.addValue(k, d[k])
    table.show(title)


# Main code

gateway = connect(group_id, username, password, server, server_port)

groups, current_group = get_groups(gateway)
show_as_table("My Groups", groups, order=['Id', 'Name'])

all_data,_,datasets = get_projects_datasets(gateway)
show_as_table("Projects and Datasets - Group: %s" % current_group, all_data, order=['Group Id', 'Dataset Id', 'Dataset Name', 'Project Name', 'Project Id'])

# created sorted list of unique dataset ids
image_ids = get_images(gateway, datasets, orphaned=True)
show_as_table("Images - Group: %s" % current_group, image_ids, order=['Dataset Id', 'Dataset Name', 'Image Id', 'Image Name'])

gateway.disconnect()
```
</details>

---

### Retrieving Images from the OMERO database

After exporting images to OMERO, let's try to download images from the database.

1. In the OMERO web interface, click on any image in your `xxx_workshop` dataset and note the Image ID displayed in the sidebar on the right side. **Image retrieval relies on these unique image identifiers**.

2. Go back to the Fiji Script Editor and open the `Omero_Open.py` script.

3. Run the script. A dialog window will open; enter these values:

    * **Omero User:** Your computing ID
    * **Omero Password:** Your OMERO Password
    * **Omero Server:** omero.hpc.virginia.edu
    * **Omero Port:** 4064
    * **Omero Group ID:** This is the ID for the `omero-demo` group.
    * **Image ID:** Enter the ID for an image that is part of your `xxx_workshop` dataset.

The script consists of the these core blocks:

* Lines 1-6 define user input to connect to OMERO.
* Lines 11-17 define a `command` variable that specifies OMERO connection and image parameters.
* Line 18 executes the OMERO importer plugin that retrieves the image.

```
# @ String (label="Omero User") user
# @ String (label="Omero Password", style="password") pwd
# @ String (label="Omero Server", value="omero.hpc.virginia.edu") server
# @ Integer (label="Omero Port", value=4064) server_port
# @ Integer (label="Omero Group ID", value=53) omero_group_id
# @ Integer (label="Image ID", value=2014) image_id

from ij import IJ

# Main code
command="location=[OMERO] open=[omero:"
command+="server=%s\n" % server
command+="user=%s\n" % user
command+="port=%s\n" % server_port
command+="pass=%s\n" % pwd
command+="groupID=%s\n" % omero_group_id
command+="iid=%s]" % image_id
IJ.runPlugIn("loci.plugins.LociImporter", command)
```

---

### Saving Images to the OMERO database

Let's try to export an image from Fiji to OMERO.

#### Single Image

1. Go back to Fiji and then to `File` > `Open Samples` > `Blobs`.

2. Go back to the Fiji Script Editor and open the `Omero_Open.py file`.

```
from ij import IJ

imp = IJ.getImage()
IJ.run(imp, "OMERO... ", "")
```

3. Run the script. The **Export to OMERO** dialog window will open. Enter the following values:

    * **Server**: omero.hpc.virginia.edu.
    * **Port:** 4064
    * **User:** Your computing ID
    * **Password:** Your OMERO password
    * **OMERO Dataset ID:** Enter the ___ID___ for the `xxx_workshop` dataset that you created in the OMERO web interface.
    * Check the **Upload new image** box.

    Click `OK`.

    If you see an error, make sure you entered the correct password and Dataset ID.

4. Go to the OMERO website and refresh the page. Double click on your `xxx_workshop` dataset icon to expand it. You should see the blobs.gif image.

#### Multiple Images

Scripting provides a convenient way to automatically export many images at once. For this exercise we utilize the output produced by the `Split_Stack.py` script.  We will take the `Simple_Batch.py` script as a template and modify it so that the create TIF image files are directly exported to OMERO instead of saving them to our local disk.

The modified script can be found as `Omero_Batch_Save.py` in the downloaded example folder.

<details>
<summary>View `Omero_Batch_Save.py` script</summary>
```
# @ File (label="Input directory", style="directory") inputdir
# @ Float (label="Gaussian blur radius", value=2.0) radius
# @ String (label="Omero User") user_id
# @ String (label="Omero Password", style="password") password
# @ String (label="Omero Server", value="omero.hpc.virginia.edu") host
# @ Integer (label="Omero Port", value=4064) server_port
# @ Integer (label="Omero Dataset ID", value=69) data_id

from ij import IJ
import os
from os import path

def process_file(f, radius):
    """Opens a file and applies a Gaussian filter."""
    print "Processing", f
    imp = IJ.openImage(f)
    IJ.run(imp, "Gaussian Blur...", "sigma=%s" % str(radius));
    return imp


# Main code
basecommand = "server=%s " % host
basecommand+= "port=%s " % server_port
basecommand+= "user=%s " % user_id
basecommand+= "password=%s " % password
basecommand+= "datasetid=%d " % data_id
basecommand+= "uploadimage=true uploadtables=false uploadrois=false updaterois=false tablenames= "

inputdir = str(inputdir)
if not path.isdir(inputdir):
    print inputdir, " does not exist or is not a directory."
else:
    filenames = os.listdir(inputdir)
    tif_files = [f for f in filenames if f.split(".")[-1] == "tif"]		# only .tif files
    for tif_file in tif_files:
        fullpath = path.join(inputdir, tif_file)
        imp = process_file(fullpath, radius)
        # need to show image for OMERO to pick it up
        imp.show()
        # export to OMERO
        IJ.run(imp, "OMERO... ", basecommand+"image=%s" % imp.getTitle())
        #ignore changes & close
        imp.changes=False
        imp.close()
        #save_as_tif(outputdir, imp)
print "Done.\n"
```
</details>

<br>
**The key changes to the script are:**

* Lines 1-7: collect OMERO connection info and Gaussian Blur parameter.
* Removal of the `save_as_tif` function.
* Creation of the `basecommand` string variable that defines the OMERO connection image export parameters.
* Insertion of `IJ.run(imp, "OMERO... ", basecommand+"image=%s" % imp.getTitle())` to export a single image to OMERO.

<br>

1. Run the `Omero_Batch_Save.py` file.

2. A dialog window will appear. Enter the following values:

    * **Input directory:** Browse to the directory that has the mitosis_xx.tif images produced by the `Split_Stack.py` script.
    * **Gaussian Blur:** Enter a number between 1.0 and 5.0.
    * **Omero User:** Your computing ID
    * **Omero Password:** Your OMERO Password
    * **Omero Server:** omero.hpc.virginia.edu
    * **Omero Port:** 4064
    * **Omero Dataset:** Enter the ID for the `xxx_workshop` dataset that you created in the OMERO web interface.

    Click `OK`.

4. The images should open and close one after another. If you receive any error messages, make sure that you entered the correct password and dataset ID.

5. Go to the OMERO web interface and refresh the page. Expand the `xxx_workshop` dataset icon and view the new content of your dataset.

6. In the top left area of the browser window, click on your name next to the `omero-demo` field. In the `MyGroups` drop-down go to `omero-demo` and select `All Members`. Now you should be able to see the datasets and image uploaded by your peers.

**Note: You can see datasets and images of other members in the `omero-demo` group, but you can only manipulate (e.g. delete) your own datasets and images.**

---

### Creating Key:Value Annotations

<details>
<summary>View `Omero_Map_Annotation.py` script</summary>
```
#@ String (label="Omero User") username
#@ String (label="Omero Password", style="password") password
#@ String (label="Omero Server", value="omero.hpc.virginia.edu") server
#@ Integer (label="Omero Port", value=4064) server_port
#@ Integer (label="Omero Group ID", min=-1, value=-1) group_id
#@ String (label="Target", value="Image", choices = ["Image", "Dataset", "Project"]) target_type
#@ Integer (label="Target ID", min=-1, value=-1) target_id

# Basic Java and ImageJ dependencies
from ij.measure import ResultsTable
from java.lang import Double
from java.util import ArrayList
from ij import IJ
from ij.plugin.frame import RoiManager
from ij.measure import ResultsTable

# Omero dependencies
import omero
from omero.log import SimpleLogger
from omero.gateway import Gateway
from omero.gateway import LoginCredentials
from omero.gateway import SecurityContext
from omero.gateway.model import ExperimenterData;

from omero.gateway.facility import DataManagerFacility
from omero.gateway.model import MapAnnotationData
from omero.gateway.model import ProjectData
from omero.gateway.model import DatasetData
from omero.gateway.model import ImageData
from omero.model import NamedValue
from omero.model import ProjectDatasetLinkI
from omero.model import ProjectI
from omero.model import DatasetI
from omero.model import ImageI


def connect(group_id, username, password, host, port):    
    '''Omero Connect with credentials and simpleLogger'''
    cred = LoginCredentials()
    if group_id != -1:
    	cred.setGroupID(group_id)
    cred.getServer().setHostname(host)
    cred.getServer().setPort(port)
    cred.getUser().setUsername(username)
    cred.getUser().setPassword(password)
    simpleLogger = SimpleLogger()
    gateway = Gateway(simpleLogger)
    e = gateway.connect(cred)
    return gateway


def create_map_annotation(ctx, annotation, target_id, target_type="Project"):
    # populate new MapAnnotationData object with dictionary
    result = ArrayList()
    for item in annotation:
        # add key:value pairs; both need to be strings
        result.add(NamedValue(str(item), str(annotation[item])))
    data = MapAnnotationData()
    data.setContent(result);
    data.setDescription("Demo Example");

    #Use the following namespace if you want the annotation to be editable in the webclient and insight
    data.setNameSpace(MapAnnotationData.NS_CLIENT_CREATED);
    dm = gateway.getFacility(DataManagerFacility);
    target_obj = None

    # use the appropriate target DataObject and attach the MapAnnotationData object to it
    if target_type == "Project":
        target_obj = ProjectData(ProjectI(target_id, False))
    elif target_type == "Dataset":	
        target_obj = DatasetData(DatasetI(target_id, False))
    elif target_type == "Image":	
        target_obj = ImageData(ImageI(target_id, False))
    result = dm.attachAnnotation(ctx, data, target_obj);
    return result


# Main code
gateway = connect(group_id, username, password, server, server_port)
currentGroupId = gateway.getLoggedInUser().getGroupId()
ctx = SecurityContext(currentGroupId)	

# create a dictionary with key:value pairs
annotation = {'Temperature': 25.3, 'Sample': 'control', 'Object count': 34}

result = create_map_annotation(ctx, annotation, target_id, target_type=target_type)
print "Annotation %s exported to Omero." % annotation

```
</details>

---

### Local Batch Processing of an OMERO Dataset

The previous examples demonstrated how to export local images to OMERO, or how to import OMERO images to a local workstation. Let's explore how an entire dataset comprised of many images can be downloaded from the remote OMERO instance, processed locally with the processed images getting uploaded to the original dataset again.

The example script, `Omero_Processing.py`, consists of five key functions:

* **connect:** Establishes a connection to the OMERO server with specific user credentials. It returns an instance of the OMERO  `Gateway` class that is used later to upload processed images to the same OMERO server instance.
* **get_image_ids:** Gets a list of unique image IDs for a given dataset managed by the remote OMERO instance.
* **open_image:** Downloads the image associated with an image ID and shows it in Fiji.
* **process:** Applies a custom image processing routine to a given image. In this case a basic segmentation and counting of cells.
* **create_map_annotation:** Uploads the cell count value to OMERO and links it to the original image.
* **upload_image:** Uploads an Image to a specific dataset managed by the remote OMERO instance.

**Remember that the gateway connection needs to be closed at the end of the script**.

<details>
<summary>View `Omero_Processing_Nuclei.py` script</summary>
```
#@ String (label="Omero User") username
#@ String (label="Omero Password", style="password") password
#@ String (label="Omero Server", value="omero.hpc.virginia.edu") server
#@ Integer (label="Omero Port", value=4064) server_port
#@ Integer (label="Omero Group ID", min=-1, value=-1) omero_group_id
#@ Integer (label="Omero Input Dataset ID", min=-1, value=-1) dataset_id
#@ String (label="Omero Output Dataset Name", value="Processed Images") target_ds_name
#@ Integer (label="Omero Output Project ID", min=-1, value=-1) project_id


import os
from os import path

from java.lang import Long
from java.lang import String
from java.lang.Long import longValue
from java.util import ArrayList
from jarray import array
from java.lang.reflect import Array
import java
from ij import ImagePlus
from ij.measure import ResultsTable

# Omero Dependencies
import omero
from omero.rtypes import rstring
from omero.gateway import Gateway
from omero.gateway import LoginCredentials
from omero.gateway import SecurityContext
from omero.gateway.facility import BrowseFacility
from omero.gateway.facility import DataManagerFacility
from omero.log import Logger
from omero.log import SimpleLogger
from omero.gateway.model import MapAnnotationData
from omero.gateway.model import ProjectData
from omero.gateway.model import DatasetData
from omero.gateway.model import ImageData
from omero.model import Pixels
from omero.model import NamedValue
from omero.model import ProjectDatasetLinkI
from omero.model import ProjectI
from omero.model import DatasetI
from omero.model import ImageI


from ome.formats.importer import ImportConfig
from ome.formats.importer import OMEROWrapper
from ome.formats.importer import ImportLibrary
from ome.formats.importer import ImportCandidates
from ome.formats.importer.cli import ErrorHandler
from ome.formats.importer.cli import LoggingImportMonitor
import loci.common
from loci.formats.in import DefaultMetadataOptions
from loci.formats.in import MetadataLevel
from loci.plugins.in import ImporterOptions
from ij import IJ


def connect(group_id, username, password, host, port):    
    '''Omero Connect with credentials and simpleLogger'''
    cred = LoginCredentials()
    if group_id != -1:
        cred.setGroupID(group_id)
    cred.getServer().setHostname(host)
    cred.getServer().setPort(port)
    cred.getUser().setUsername(username)
    cred.getUser().setPassword(password)
    simpleLogger = SimpleLogger()
    gateway = Gateway(simpleLogger)
    gateway.connect(cred)
    group_id = cred.getGroupID()
    return gateway


def open_image(username, password, host, server_port, group_id, image_id):
    command="location=[OMERO] open=[omero:"
    command+="server=%s\n" % server
    command+="user=%s\n" % username
    command+="port=%s\n" % server_port
    command+="pass=%s\n" % password
    if group_id > -1:
		command+="groupID=%s\n" % group_id
    command+="iid=%s] " % image_id
    command+="windowless=true " #view=\'%s\' " % ImporterOptions.VIEW_HYPERSTACK
    command+="color_mode=Default view=[Standard ImageJ] stack_order=Default"
    print "Opening image: id", image_id 
    IJ.runPlugIn("loci.plugins.LociImporter", command)
    imp = IJ.getImage()
    return imp


def upload_image(gateway, server, dataset_id, filepath):    
    user = gateway.getLoggedInUser()
    ctx = SecurityContext(user.getGroupId())
    sessionKey = gateway.getSessionId(user)
    
    config = ImportConfig()
    config.email.set("")
    config.sendFiles.set('true')
    config.sendReport.set('false')
    config.contOnError.set('false')
    config.debug.set('false')
    config.hostname.set(server)
    config.sessionKey.set(sessionKey)
    config.targetClass.set("omero.model.Dataset")
    config.targetId.set(dataset_id)
    loci.common.DebugTools.enableLogging("DEBUG")
    
    store = config.createStore()
    reader = OMEROWrapper(config)
    library = ImportLibrary(store,reader)
    errorHandler = ErrorHandler(config)
    
    library.addObserver(LoggingImportMonitor())
    candidates = ImportCandidates (reader, filepath, errorHandler)
    reader.setMetadataOptions(DefaultMetadataOptions(MetadataLevel.ALL))
    success = library.importCandidates(config, candidates)
    print "candidates", candidates
    print "success", success
    return success


def get_image_ids(gateway, dataset_id):
	"""Return all image ids for given dataset"""
	browse = gateway.getFacility(BrowseFacility)
	experimenter = gateway.getLoggedInUser()
	ctx = SecurityContext(experimenter.getGroupId())
	images = []
	ids = ArrayList(1)
	ids.add(Long(dataset_id))
	j = browse.getImagesForDatasets(ctx, ids).iterator()
	while j.hasNext():
	    image = j.next()
	    images.append({
	        'Image Id': String.valueOf(image.getId()),
	        'Image Name': image.getName(),
	        'Dataset Id': dataset_id,
	    })
	return images


def create_map_annotation(ctx, annotation, target_id, target_type="Project"):
    # populate new MapAnnotationData object with dictionary
    result = ArrayList()
    for item in annotation:
        # add key:value pairs; both need to be strings
        result.add(NamedValue(str(item), str(annotation[item])))
    data = MapAnnotationData()
    data.setContent(result);
    data.setDescription("Demo Example");

    #Use the following namespace if you want the annotation to be editable in the webclient and insight
    data.setNameSpace(MapAnnotationData.NS_CLIENT_CREATED);
    dm = gateway.getFacility(DataManagerFacility);
    target_obj = None

    # use the appropriate target DataObject and attach the MapAnnotationData object to it
    if target_type == "Project":
        target_obj = ProjectData(ProjectI(target_id, False))
    elif target_type == "Dataset":	
        target_obj = DatasetData(DatasetI(target_id, False))
    elif target_type == "Image":	
        target_obj = ImageData(ImageI(Long(target_id), False))
    result = dm.attachAnnotation(ctx, data, target_obj);
    return result


def process_file(imp):
	"""Run segmentation"""
	print "Processing", imp.getTitle()
	title = imp.getTitle().split('.')[:-1]
	title = '.'.join(title) + "_mask.ome.tiff"
	print title
	nimp = ImagePlus(title, imp.getStack().getProcessor(1))
	IJ.run(nimp, "Median...", "radius=3")
	IJ.run(nimp, "Auto Local Threshold", "method=Bernsen radius=15 parameter_1=0 parameter_2=0 white")
	IJ.run(nimp, "Watershed", "")

	IJ.run("Set Measurements...", "area mean standard centroid decimal=3")
	IJ.run(nimp, "Analyze Particles...", "size=50-Infinity summary exclude clear add")
	rt = ResultsTable.getResultsTable()
	rt.show("Results")
	annotation = {
		"Nuclei count":rt.size()
	}
	
	imp.close()
	return nimp, annotation 


def create_new_dataset(ctx, project_id, ds_name, ):
    dataset_obj = omero.model.DatasetI()
    dataset_obj.setName(rstring(ds_name))
    dataset_obj = gateway.getUpdateService(ctx).saveAndReturnObject(dataset_obj)
    dataset_id = dataset_obj.getId().getValue()

    dm = gateway.getFacility(DataManagerFacility)
    link = ProjectDatasetLinkI();
    link.setChild(dataset_obj);
    link.setParent(ProjectI(project_id, False));
    r = dm.saveAndReturnObject(ctx, link);
    return dataset_id 

	
# Main code
gateway = connect(omero_group_id, username, password, server, server_port)
currentGroupId = gateway.getLoggedInUser().getGroupId()
ctx = SecurityContext(currentGroupId)
#sessionKey = gateway.getSessionId(gateway.getLoggedInUser())

image_info = get_image_ids(gateway, dataset_id)
tmp_dir = os.path.join(os.path.expanduser('~'), 'omero_tmp')
if not os.path.exists(tmp_dir):
    os.makedirs(tmp_dir)
print tmp_dir

target_ds_id = create_new_dataset(ctx, project_id, target_ds_name)
for info in image_info:
	imp = open_image(username, password, server, server_port, omero_group_id, info['Image Id'])
	processed_imp, annotation = process_file(imp)

	# Save processed image locally in omero_tmp dir
	filepath = os.path.join(tmp_dir, processed_imp.getTitle())
	options = "save=" + filepath + " export compression=Uncompressed"
	IJ.run(processed_imp, "Bio-Formats Exporter", options)
	#ignore changes & close
	processed_imp.changes=False 
	processed_imp.close()

	# export to OMERO
	upload_image(gateway, server, target_ds_id, [filepath])
	create_map_annotation(ctx, annotation, info['Image Id'], target_type="Image")

gateway.disconnect()	

print "Done.\n"

```
<br>