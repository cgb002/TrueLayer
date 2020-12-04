#!/bin/sh
#
#
#CGB	Thu  3 Dec 10:33:55 GMT 2020
#
#	Version: 1.0
#
#	Truelayer technical test

# Objective:
# Create Truelayer dir
# Create file
# Add timestamp et al to file

set -x

#CGB	Succint 1 line solution

#[ -d Truelayer ] || mkdir Truelayer && touch Truelayer/TLTest.txt && echo "`date`" > Truelayer/TLTest.txt

#-------------------------------------------------------------------------------

################################################################################

CMDNAME=$0

################################################################################

#CGB	Functions

display_usage()
{
echo "Usage:  ${CMDNAME} [h|x] directory-name filename"
echo ""
echo "Help"
echo ""
echo "  options:"
echo ""
echo "		directory-name filename"
echo ""
echo ""
echo "    -h                   Display help"
echo "    -x                   Display example"
echo ""
	return 0
}

display_help()
{
	echo "Help is at hand"
	echo ""
	echo ""
	echo "First argument shold be the directory name to be created."
	echo ""
	echo "Second argument shold be the filename to be created."
	echo ""
	echo "If no arguments are supplied then the defaults will be used."
	echo ""
}


default_settings()
{
	echo "$0 directory-name filename"
	echo ""
	echo "No arguments provided so using default settings of ..."
	echo ""
	echo "Directory to be set : TrueLayer"
	echo "Filename to be set : TLTest.txt"
	DIR="TrueLayer"
	FILE="TLTest.txt"
}

old_update_file()
{
[ -d ${DIR} ] || mkdir ${DIR} && touch ${DIR}/${FILE} && echo "`date`" > ${DIR}/${FILE} 
[ -d ${DIR} ] && echo "Directory already exists"
}

actions()
{
	DT=`date`
	NM=`echo "$0"`
	DIR=`ls -ab "$PWD"| tr '\n' ' '`
	IP=`curl -s checkip.amazonaws.com`
	MEM=`grep MemTotal /proc/meminfo| tr -s " " | cut -d " " -f 2`
	MB=`expr ${MEM} / 1000`
	PID="$$"
	ID=`id -un`
	echo "${DT}|${NM}|${DIR}|${IP}|${MB}|${PID}|${ID}"
	echo "#COMMENT : CGB"
}

##########################################################################
#CGB
#
#	Interactive options


[ -d ${DIR} ] || mkdir ${DIR} && touch ${DIR}/${FILE}

OUTPUT=${DIR}/${FILE} 

case 	"$#" in
	0)	default_settings
		actions >> ${OUTPUT}
		;;
	1)	display_usage
		[ "$1" == "-h" ] && display_help
		[ "$1" == "-x" ] && default_settings
		exit 1
		;;
	2)	DIR=$1
		FILE=$2	
		actions >> ${OUTPUT}
		;;
	*)	display_usage
		exit 2
		;;
esac


################################################################################

exit 256

################################################################################

set +x

################################################################################
#EOF
################################################################################
