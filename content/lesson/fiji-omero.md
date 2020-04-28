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

### Check your Omero Database Account

1. If you are accessing the Omero Database from an off-Grounds location, you have to connect through a UVA Virtual Private Network (VPN).  Please follow these [instructions to set up your VPN](https://virginia.service-now.com/its?id=itsweb_kb_article&sys_id=f24e5cdfdb3acb804f32fb671d9619d0).

2. Open a webbrowser and go to http://omero.hpc.virginia.edu. Login to the OMERO web interface as described [here](/lesson/omero/#using-omero-web).

    * **Username:** Your computing ID
    
    * **Password:** Your personal password
    
If you are new to UVA's Omero Database, a temporary password had been emailed to you.  

**Please change your temporary password when you log in for the first time to the Omero database server as described in these [instructions](https://www.rc.virginia.edu/userinfo/omero/overview/#changing-your-omero-database-password).** 

If you cannot login, please submit a [support request](https://www.rc.virginia.edu/form/support-request/).  Select **Omero Image Analysis** as Support Category.  

---

# Workshop Projects and Datasets

### Sample Data

* Group: **omero-demo** (Group ID: `53`)

* Project: **Fiji Omero Workshop** (Project ID: `130`)


### Your Personal Dataset

Let's create a new dataset in the workshop project. 

1. Right click on the Blue folder icon labeled `Fiji Omero Workshop`. In the popup menu, select `Create new` > `Dataset`. 

2. Name the new Dataset`<YOUR_UID>_workshop`, for example `mst3k_workshop`. After the dataset is generated, your user interface should look like this:
    ![](/images/fiji-omero-dataset.png)
    
3. Click on the green folder icon of your new dataset and take note of the `Dataset ID`. We will need this to direct Fiji where to load data from or save data to.

---

# Scripting

## Getting the Basic OMERO dataset Info

OMERO organizes users in groups. Each user can be a member of multiple groups. Images are organized in Projects and Datasets, or in Screens and Plates. The following script, `Omero_Info.py`, connects a user to a remote OMERO instance and shows a list of:

* the groups that the user belongs to and the associated group ID. This ID is important when you want to access images stored for a particular group;
* the projects and datasets for a particular group (specified via unique grpup ID);
* and a list of images, organized by project and dataset, that the user has access to in a particular group.

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

	# Read datasets in all projects
	projects = containerService.loadContainerHierarchy("Project", None, None) # allowed: 'Project", "Dataset", "Screen", "Plate"
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

## Saving Images to the OMERO database

Let's try to export an image from Fiji to OMERO.

### Single Image

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

### Multiple Images

Scripting provides a convenient way to automatically export many images at once. For this exercise we utilize the output produced by the `Split_Stack.py` script.  We will take the `Simple_Batch` script as a template and modify it so that the create TIF image files are directly exported to OMERO instead of saving them to our local disk.

The modified script can be found as `Omero_Batch_Save.py` in the downloaded example folder.

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

## Retrieving Images from the OMERO database

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

## Local Batch Processing of an entire OMERO Dataset

The previous examples demonstrated how to export local images to OMERO, or how to import OMERO images to a local workstation. Let's explore how an entire dataset comprised of many images can be downloaded from the remote OMERO instance, processed locally with the processed images getting uploaded to the original dataset again.

The example script, `Omero_Processing.py`, consists of five key functions:

* **connect:** Establishes a connection to the OMERO server with specific user credentials. It returns an instance of the OMERO  `Gateway` class that is used later to upload processed images to the same OMERO server instance.
* **get_image_ids:** Gets a list of unique image IDs for a given dataset managed by the remote OMERO instance.
* **open_image:** Downloads the image associated with an image ID and shows it in Fiji.
* **process:** Applies a custom image processing routine to a given image.
* **upload_image:** Uploads an Image to a specific dataset managed by the remote OMERO instance.

**Remember that the gateway connection needs to be closed at the end of the script**.

```
#@ String (label="Omero User") username
#@ String (label="Omero Password", style="password") password
#@ String (label="Omero Server", value="omero.hpc.virginia.edu") server
#@ Integer (label="Omero Port", value=4064) server_port
#@ Integer (label="Omero Group ID", min=-1, value=-1) omero_group_id
#@ Integer (label="Omero Dataset ID", min=-1, value=-1) dataset_id

import os
from os import path

from java.lang import Long
from java.lang import String
from java.lang.Long import longValue
from java.util import ArrayList
from jarray import array
from java.lang.reflect import Array
import java

# Omero Dependencies
import omero
from omero.gateway import Gateway
from omero.gateway import LoginCredentials
from omero.gateway import SecurityContext
from omero.gateway.facility import BrowseFacility
from omero.log import Logger
from omero.log import SimpleLogger
from omero.model import Pixels

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
    """Omero Connect with credentials and simpleLogger."""
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


def open_image(username, password, host, server_port, group_id, image_id):
    """Downloads an image from the OMERO server"""
    command="location=[OMERO] open=[omero:"
    command+="server=%s\n" % server
    command+="user=%s\n" % username
    command+="port=%s\n" % server_port
    command+="pass=%s\n" % password
    if group_id > -1:
		command+="groupID=%s\n" % group_id
    command+="iid=%s] " % image_id
    command+="windowless=true view=\'%s\' " % ImporterOptions.VIEW_HYPERSTACK
    print "Opening image: id", image_id
    IJ.runPlugIn("loci.plugins.LociImporter", command)
    imp = IJ.getImage()
    return imp


def process_image(imp):
    """Invert pixels."""
    print "Processing", imp.getTitle()
    IJ.run(imp, "Invert", "");
    return imp


def upload_image(gateway, server, dataset_id, filepath):    
    """Uploads an image to a specific remote OMERO dataset."""
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
    return success


# Main code

gateway = connect(omero_group_id, username, password, server, server_port)
image_info = get_image_ids(gateway, dataset_id)
tmp_dir = os.path.join(os.path.expanduser('~'), 'omero_tmp')
if not os.path.exists(tmp_dir):
    os.makedirs(tmp_dir)

for info in image_info:
    imp = open_image(username, password, server, server_port, omero_group_id, info['Image Id'])
    imp = process_image(imp)

    # Save processed image locally in omero_tmp dir
    title = imp.getTitle().split('.')[:-1]
    title = '.'.join(title) + "_inverted.ome.tiff"
    filepath = os.path.join(tmp_dir, title)
    options = "save=" + filepath + " export compression=Uncompressed"
    IJ.run(imp, "Bio-Formats Exporter", options)

    #ignore changes & close
    imp.changes=False
    imp.close()

    # export to OMERO
    upload_image(gateway, server, dataset_id, [filepath])

gateway.disconnect()

print "Done.\n"
```
<br>