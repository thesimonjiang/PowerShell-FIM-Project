# Simple PowerShell File Integrity Monitor
## Project Overview

The "[CIA Triad]([Executive Summary &mdash; NIST SP 1800-26 documentation](https://www.nccoe.nist.gov/publication/1800-26/VolA/index.html))" is the fundamental basis of information security. In any modern system we employ, to ensure its security, it needs to cover the three areas in the CIA Triad: Confidentiality, Integrity, and Availability. Confidentiality entails that the data is kept private and only readable by entities that are authorized to access them. Integrity dictates that data must be accurate, trustworthy, and tamper-free. Availability means that the systems, networks and applications associated with the data must be functioning properly and ready to serve the data at any time.



This project deals with the Integrity part of the CIA Triad. In the world of cybersecurity, the hashing of the object is a common way to ensure its integrity. The hash value of an object changes dramatically with even the slightest deviation. We are going to make a simple proof-of-concept Film Integrity Monitor using PowerShell script. We are going to make a folder with some dummy files in it; calculate the hash values for all the dummy files; monitor the folder for any change: new file created, content of existing file modified, or deletion of any existing file; if change is detected in the folder, alert the Administrator via E-mail.



![](https://github.com/thesimonjiang/PowerShell-FIM-Project/blob/d3844f3bdadb3646818c5b24ac2274cb0139260f/Graphics/SHA-256%20Hash.drawio.jpg)

## Project Architecture



![](https://github.com/thesimonjiang/PowerShell-FIM-Project/blob/d3844f3bdadb3646818c5b24ac2274cb0139260f/Graphics/FIM%20Flowchart.drawio.jpg)



The concept is simple:

- Ask the user to set a directory for integrity monitoring

- Ask the user on what they would like to do next. They can choose to either:
  
  - Create a new baseline for integrity monitoring
  
  - Start the monitoring session with the existing baseline

- If the user choose to create a new baseline, then calculate all the hash of the files inside the directory using SHA-256 algorithm and store them in a text file.

- If the user choose to start the integrity monitoring session, then load the previously saved baseline text file and use it to compare

- If any change in the directory is detected, send an E-mail notification to the Administrator.

## Project Process

All the files and PowerShell script files used in this project are in this repository. To use them for yourself, you will need to change the file paths and email server information to match that of your own.



##### Folder Structure

Here's the simple folder structure for this project.



![](https://github.com/thesimonjiang/PowerShell-FIM-Project/blob/d3844f3bdadb3646818c5b24ac2274cb0139260f/Graphics/File%20Folder%20Structure.gif)

##### Ask User to Perform an Action

Let's start simple. We are just going to write the code to ask the user to either

- Create a new baseline

- Start monitoring with existing baseline



![](https://github.com/thesimonjiang/PowerShell-FIM-Project/blob/d3844f3bdadb3646818c5b24ac2274cb0139260f/Graphics/Choice%20Selection.gif)

##### Create the Baseline

Now we are going to create the baseline.



![](https://github.com/thesimonjiang/PowerShell-FIM-Project/blob/d3844f3bdadb3646818c5b24ac2274cb0139260f/Graphics/Create%20Baesline.gif)

##### Testing for Integrity Monitoring

Now let's test our script for integrity monitoring.

![](https://github.com/thesimonjiang/PowerShell-FIM-Project/blob/d3844f3bdadb3646818c5b24ac2274cb0139260f/Graphics/Monitoring%20File%20Directory.gif)

##### Allow User to Set the Monitoring Directory

Now let's enhance the functionality a little bit by allowing the user to choose the directory for monitoring.

![](https://github.com/thesimonjiang/PowerShell-FIM-Project/blob/d3844f3bdadb3646818c5b24ac2274cb0139260f/Graphics/User%20Choice%20Folder.gif)

##### E-mail Notification Function

Let's kick it up a notch by adding the function to email the administrator.

![](https://github.com/thesimonjiang/PowerShell-FIM-Project/blob/d3844f3bdadb3646818c5b24ac2274cb0139260f/Graphics/Email%20Notification%20Function.gif)

##### Final Result

Finally, let's put everything together. Here's the final result!

![](https://github.com/thesimonjiang/PowerShell-FIM-Project/blob/d3844f3bdadb3646818c5b24ac2274cb0139260f/Graphics/Final%20Result.gif)
