---
title: "Logging into Your VM with Duo"
author: "Christina Gancayco"
date: 2019-08-05T21:13:14-05:00
categories: ["Secure Computing"]
draft: false
toc: true
---

<p class="lead">
Ivy is a secure computing environment where researchers can manipulate and analyze their 
highly sensitive data (e.g. HIPAA, FERPA, CUI, ITAR) without removing any identifiers. 
Previously, logging in to Ivy required users to have a JointVPN identity token. <b>As of 
August 1, 2019, users can now log in with Duo 2-Step Login.</b>
</p>

# 1. Complete the Information Security Awareness Training (ISAT).

### 1. Log into Workday to complete the ISAT.

The security awareness training is located at [https://www.myworkday.com/uva/d/inst/1$17816/17816$202.htmld](https://www.myworkday.com/uva/d/inst/1$17816/17816$202.htmld). The training takes approximately ten minutes to complete.

\* If you are a student without a Workday account, please send an email to it-policy@virginia.edu to receive an alternate link to the security training.


### 2. Send a screenshot of your completed training.

Once you have completed the training, take a screenshot of your completed training and send a copy to 
accounts@virginia.edu and ivy-support@virginia.edu.

# 2. Installing/Updating the VPN Client

To connect to your Ivy VM, you first need to connect to the High Security Virtual Private 
Network (HSVPN). You can connect to the HSVPN using the Cisco AnyConnect Secure Mobility Client, 
which can be installed by following the instructions below.

### 1. Install a current personal digital certificate.

Instructions on how to do this can be found at the [UVa Information Technology Services website](https://virginia.service-now.com/its?id=itsweb_kb_article&sys_id=58aafbcfdbf6c744f032f1f51d961927).

\*You can skip this step if you already have a current digital certificate.
    
### 2.  Uninstall the old VPN Client

If you have previously installed the Cisco VPN Client, you will need to uninstall it before installing the latest version. 
If you have never installed the client you can skip this step.

**Uninstall for Windows**

1. Click the **Start** menu and enter *Add or Remove Programs* in the Search Bar.
    
2. Select **Cisco AnyConnect Secure Mobility Client** and click **Uninstall**.

**Uninstall for Mac**

1. Go to **Finder** > **Applications** > **Cisco**.
    
2. Run **Uninstall AnyConnect**.
    
### 3. Download the VPN

1. Go to <a href="https://virginia.service-now.com/its?id=sg_catalog&sys_id=d66f4fd4db29274c2192e665059619d6&sysparm_category=06d7db5bdbfcab00cebc550a48961963" target="_blank">UVa Software Gateway</a>.

2. Select the VPN client for your OS, either **VPN Client HS 4.6 for Mac** or **VPN Client HS 4.6 for Windows**.

3. Accept the Terms & Conditions and download the installer files.

### 4. Run the Installer

**Install for Windows**

1. Run the installer file you downloaded to complete the install.

**Install for Mac**

1. Open the new UVa VPN disk image and run the **UVa VPN Install**.

2. If you get a message saying **"ciscod" is not optimized for your Mac and needs to be updated**, click **OK**.

3. A dialog box may open saying **Cisco System Extension Blocked**. If so, click the **Open Preferences** button to open the Security Preferences menu. Toward the bottom of the screen you will see a message saying **System software from developer "Cisco" was blocked from loading**. Click the **Allow** button to allow the VPN client to run on your computer.


# 3. Connecting to the High Security VPN

1. Open the Cisco AnyConnect Secure Mobility Client.

2. From the drop-down menu, select **High Security VPN**.

3. Click the **Connect** button.

4. You will be prompted to enter a Duo password. Open the Duo app on your mobile device, and select **UVA** from the main menu. Enter the 6-digit code that appears into the Cisco VPN client and click **Ok**.

5. Accept the Terms of Use in the pop-up window that appears.


# 4. Meeting the High Security VPN Requirements

In order to connect to the HSVPN, your computer must meet certain security requirements. 

Instructions for making your device compliant can be found on the <a href="https://virginia.service-now.com/its?id=itsweb_kb_article&sys_id=471fc126db16ebc0a6ddc19115961991" target="_blank">UVa ITS website</a>.

# 5. Logging into Your VM

Once you have installed the VPN Client and your computer is compliant, you can log in to your 
Ivy VM. You will need Microsoft Remote Desktop Client, which is available for both Windows and Mac (available in the App Store).

1. Using Cisco Anyconnect Secure Mobility Client, connect to the High Security VPN.

2. Open Microsoft Remote Desktop.

**Connecting via Windows**

1. Click on the **Show Options** button at the bottom of the window.

2. In the **Computer** field, enter the IP address of your Ivy Virtual Machine (emailed to your PI).

3. In the **User name** field, enter the ESERVICES domain and your computing ID (e.g. `ESERVICES\mst3k`).

4. Click the **Connect** button and enter your ESERVICES password when prompted.

**Connecting via Mac**

1. Click the **Connections** tab in the top menu bar and click **Add Desktop**. This will open a new window.

2. In the **PC name** field, enter the IP address of your Ivy VM (emailed to your PI).

3. Click the **Add** button at the bottom of the "Add Desktop" window. This will return you to the main Remote Desktop menu, where you will see a new tile labeled with the IP address you entered.

4. Double-click the new tile, and you will be prompted to enter your username and password. In the **Username** field, enter the ESERVICES domain and your computing ID (e.g. `ESERVICES\mst3k`). Enter your ESERVICES password in the **Password** field. Click **Continue**.

5. A pop-up may appear saying "The certificate couldn't be verified back to a root certificate." Click the **Continue** button.
