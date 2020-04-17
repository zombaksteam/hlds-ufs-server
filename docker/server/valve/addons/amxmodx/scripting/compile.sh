#!/bin/bash

# AMX Mod X
#
# by the AMX Mod X Development Team
#  originally developed by OLO
#
# This file is part of AMX Mod X.

# new code contributed by \malex\

# Edited by Zombak
# Can compile single file
# Example: ./compile.sh plugin.sma

test -e ../plugins || mkdir ../plugins
rm -f temp.txt

# Choose compiler binary
if test `uname` = "Darwin"; then
	pc=./amxxpc_osx
else
	pc=./amxxpc
fi

if [[ ${1} == "" ]]; then
	for sourcefile in *.sma
	do
		amxxfile="`echo $sourcefile | sed -e 's/\.sma$/.amxx/'`"
		echo -n "Compiling $sourcefile ..."
		$pc $sourcefile -o../plugins/$amxxfile >> temp.txt
		echo "done"
	done
else
	amxxfile="`echo ${1} | sed -e 's/\.sma$/.amxx/'`"
	$pc ./${1} -o../plugins/$amxxfile
	exit
fi

cat temp.txt
rm temp.txt
