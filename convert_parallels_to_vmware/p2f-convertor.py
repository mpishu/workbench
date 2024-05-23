#!/bin/bash

# Function to display error messages and exit
function error_exit {
    echo "Error: $1" >&2
    exit 1
}

# Check if the required arguments are provided
if [ "$#" -ne 3 ]; then
    echo "Usage: $0 <parallels_hds_file> <output_vmdk_file> <vmware_fusion_vm_directory>"
    exit 1
fi

# Assign arguments to variables
parallels_hds_file="$1"
output_vmdk_file="$2"
vmware_fusion_vm_directory="$3"

# Check if qemu-img is installed
command -v qemu-img >/dev/null 2>&1 || { echo >&2 "qemu-img is not installed. Aborting."; exit 1; }

# Check if the Parallels .hds file exists
[ -f "$parallels_hds_file" ] || error_exit "Parallels .hds file not found: $parallels_hds_file"

# Convert Parallels hard drive to VMware Fusion format (.vmdk)
echo "Converting Parallels hard drive to VMware Fusion format..."
qemu-img convert -O vmdk "$parallels_hds_file" "$output_vmdk_file" || error_exit "Failed to convert Parallels hard drive to VMware Fusion format"

# Check if VMware Fusion VM directory exists
[ -d "$vmware_fusion_vm_directory" ] || error_exit "VMware Fusion VM directory not found: $vmware_fusion_vm_directory"

# Copy the converted .vmdk file to VMware Fusion VM directory
echo "Copying the converted .vmdk file to VMware Fusion VM directory..."
cp "$output_vmdk_file" "$vmware_fusion_vm_directory" || error_exit "Failed to copy the converted .vmdk file to VMware Fusion VM directory"

echo "Conversion completed successfully."

