# Script Collection

This repository contains a collection of utility scripts for various purposes. Below is a description of each script and instructions on how to use them.

## Prerequisites

Before you run these scripts, ensure you have the necessary environment, permissions, and dependencies set up. Some scripts may require additional packages or software to be installed on your system.

## Script Descriptions

### 1. `gen_pass`
A Bash script that generates a strong password consisting of a mix of upper-case letters, lower-case letters, digits, and special characters. The user specifies the desired length of the password.

**Usage:**
```shell
./gen_pass <password_length>
```

### 2. `img_ocr`
This script utilizes Tesseract OCR to extract text from a specified image file. The extracted text is subsequently copied to the clipboard.

**Usage:**
```shell
./img_ocr <path-to-image>
```

### 3. `kill_port`
A utility script designed to terminate the process currently using a specified port, freeing it up for other uses.

**Usage:**
```shell
./kill_port <port-number>
```

### 4. `merge_pr`
A script that automates the process of merging pull requests, useful in collaborative development environments.

**Usage:**
```shell
./merge_pr
```

### 5. `run_auto_click`
This script automates mouse clicks, though the specific details and usage context are unclear from the script itself.

**Usage:**
```shell
./run_auto_click
```

### 6. `setup`
A general setup or installation script, possibly used for configuring environments, installing software, or prepping systems.

**Usage:**
```shell
./setup
```

### 7. `timer`
Implements a Pomodoro timer, promoting efficient time management by delineating work and break periods.

**Usage:**
```shell
./timer
```

### 8. `wkdir`
Changes the working directory to a specific path and initiates a new shell (Z shell).

**Usage:**
```shell
./wkdir
```

### 9. `xmp`
Controls the XAMPP server, providing options to start, stop, or reload the server.

**Usage:**
```shell
./xmp [option]
Options:
    -s: Stop the server
    -r: Reload the server
    No option: Start the server
```

### 10. `all_files`
This script creates a text file that consolidates the names and contents of all files within the current directory and its subdirectories into a single file.

**Usage:**
```shell
./all_files
```

### 11. `auto_click.py`
A Python script that performs automatic mouse clicks at the current cursor position.

**Usage:**
```shell
python auto_click.py
```

### 12. `convert_images_to_pdf.py`
This Python script converts images located in a specified folder into a single PDF document. The images can be in various formats, including PNG, JPG, JPEG, and GIF.

**Usage:**
```shell
python convert_images_to_pdf.py
```

### 13. `create_pr`
This script's functionality isn't entirely clear without context. It could potentially be related to creating pull requests in a version control system like git.

**Usage:**
```shell
./create_pr
```

### 14. `down_song` and `down_song.py`
These scripts appear to be related to downloading songs, possibly from YouTube. The exact functionality isn't clear from the script contents alone.

**Usage:**
```shell
./down_song  # or 'python down_song.py' depending on the script's requirements
```

### 15. `gen_html`
This Bash script creates a set of starter HTML, CSS, and JavaScript files for a new web project. It initializes a standard project structure with basic files and starter code.

**Usage:**
```shell
./gen_html
```

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.