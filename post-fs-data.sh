#!/system/bin/sh

# --- Set module directory ---
MODDIR=${0%/*}

# --- Choose system binary directory (xbin or bin) ---
SDIR=/system/xbin/
if [ ! -d $SDIR ]; then
	SDIR=/system/bin/
fi

# --- Create directory for BusyBox installation ---
BBDIR=$MODDIR$SDIR
mkdir -p $BBDIR
cd $BBDIR
pwd

# --- Initialize BusyBox variables ---
BB=busybox
BBN=busybox_nh
BBBIN=$MODDIR/$BB

# --- Check if local BusyBox binary exists and is valid ---
if [ -f $BBBIN ]; then
	chmod 755 $BBBIN

	# --- Ensure binary is valid and has enough applets ---
	if [ $($BBBIN --list | wc -l) -ge 128 ] && [ ! -z "$($BBBIN | head -n 1 | grep -i $BB)" ]; then
		chcon u:object_r:system_file:s0 $BBBIN
		Applets=$BB$'\n'$($BBBIN --list)
	else
		rm -f $BBBIN
	fi
fi

# --- Fallback to KernelSU's BusyBox if local is invalid or missing ---
if [ ! -x $BBBIN ]; then
	BBBIN=/data/adb/ksu/bin/$BB
	$BBBIN --list | wc -l
	Applets=$BB$'\n'$($BBBIN --list)
fi

# --- Create symbolic link for custom BusyBox binary ---
ln -s $BBBIN $SDIR$BBN

# --- Create symbolic links for each BusyBox applet ---
for Applet in $Applets; do
	if [ ! -x $SDIR/$Applet ]; then
		# --- Link applet to BusyBox binary ---
		ln -s $BBBIN $Applet
	fi
done

# --- Set permissions and SELinux context ---
chmod 755 *
chcon u:object_r:system_file:s0 *

# --- Clean up file descriptors ---
set +x
exec 1>&3 2>&4 3>&- 4>&-
