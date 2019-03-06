#!/bin/sh

echo 
echo ... helloworld autogen ...
echo 

MISSING=""

env aclocal --version >/dev/null 2>&1
if [ $? -eq 0 ];then
	ACLOCAL=aclocal
else
	MISSING="$MISSING aclocal"
fi

env autoconf --version > /dev/null 2>&1
if [ $? -eq 0 ];then
	AUTOCONF=autoconf
else
	MISSING="$MISSING autoconf"
fi

env autoheader --version > /dev/null 2>&1
if [ $? -eq 0 ]; then
	AUTOHEADER=autoheader
else
	MISSING="$MISSING autoconf"
fi

env automake --version > /dev/null 2>&1
if [ $? -eq 0 ];then
	AUTOMAKE=automake
else
	MISSING="$MISSING automake"
fi

env libtoolize --version > /dev/null 2>&1
if [ $? -eq 0 ];then
	TOOL=libtoolize
else 
	env glibtoolize --version > /dev/null 2>&1
	if [$? -eq 0 ];then
		TOOL=glibtoolize
	else
		MISSING="$MISSING libtoolize/glibtoolize"
	fi
fi

env tar -cf /dev/null /dev/null > /dev/null 2>&1
if [ $? -ne 0 ];then
	MISSING="$MISSING tar"
fi

if [ "x$MISSING" != "x" ];then
	echo "ABORTING."
	echo 
	echo "The following build tools are missing:"
	echo 
	
	for pkg in $MISSING;do
		echo " *  $pkg"
	done
	
	echo 
	echo "please install them and try again."
	echo 
fi

echo Running $ACLOCAL
$ACLOCAL

echo Running $AUTOHEADER
$AUTOHEADER
	
echo Running $TOOL
$TOOL
	
echo Running $AUTOCONF
$AUTOCONF

echo Running $AUTOMAKE
$AUTOMAKE --add-missing --force-missing --copy --foreign

echo 
echo "Please proceed with configuring, compiling and installing"

		
	
