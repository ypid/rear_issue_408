#!/bin/bash

LogPrint "Start system layout restoration."

mkdir -p /mnt/local
if create_component "vgchange" "rear" ; then
    lvm vgchange -a n >&8
    component_created "vgchange" "rear"
fi

set -e
set -x

if create_component "/dev/sdc" "disk" ; then
# Create /dev/sdc (disk)
Log "Erasing MBR of disk /dev/sdc"
dd if=/dev/zero of=/dev/sdc bs=512 count=1
sync
LogPrint "Creating partitions for disk /dev/sdc (msdos)"
parted -s /dev/sdc mklabel msdos >&2
sleep 1
parted -s /dev/sdc mkpart '"primary"' 32768B 499154943B >&2
sleep 1
parted -s /dev/sdc set 1 boot on >&2
parted -s /dev/sdc mkpart '"primary"' 499159040B 2498793471B >&2
sleep 1
parted -s /dev/sdc mkpart '"primary"' 2498797568B 120034123775B >&2
sleep 1
partprobe -s /dev/sdc >&2
# Wait some time before advancing
sleep 10

# Make sure device nodes are visible (eg. in RHEL4)
my_udevtrigger
my_udevsettle
component_created "/dev/sdc" "disk"
else
    LogPrint "Skipping /dev/sdc (disk) as it has already been created."
fi

if create_component "/dev/sdc1" "part" ; then
# Create /dev/sdc1 (part)
component_created "/dev/sdc1" "part"
else
    LogPrint "Skipping /dev/sdc1 (part) as it has already been created."
fi

if create_component "/dev/sdc2" "part" ; then
# Create /dev/sdc2 (part)
component_created "/dev/sdc2" "part"
else
    LogPrint "Skipping /dev/sdc2 (part) as it has already been created."
fi

if create_component "/dev/sdc3" "part" ; then
# Create /dev/sdc3 (part)
component_created "/dev/sdc3" "part"
else
    LogPrint "Skipping /dev/sdc3 (part) as it has already been created."
fi

if create_component "/dev/mapper/sda3_crypt" "crypt" ; then
# Create /dev/mapper/sda3_crypt (crypt)
Log "Creating luks device sda3_crypt on /dev/sdc3"
LogPrint "Please enter the password for sda3_crypt(/dev/sdc3):"
cryptsetup luksFormat -q --cipher aes-xts-plain64 --hash sha1 --uuid 2be2e1ec-c91f-464f-a296-28ff54c49a77 /dev/sdc3
LogPrint "Please re-enter the password for sda3_crypt(/dev/sdc3):"
cryptsetup luksOpen /dev/sdc3 sda3_crypt

component_created "/dev/mapper/sda3_crypt" "crypt"
else
    LogPrint "Skipping /dev/mapper/sda3_crypt (crypt) as it has already been created."
fi


set +x
set +e

LogPrint "Disk layout created."

