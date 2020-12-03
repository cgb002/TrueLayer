#!/bin/sh
#
#
#CGB	Thu  3 Dec 10:33:55 GMT 2020
#
#	Truelayer technical test

# Objective:
# Create Truelayer dir
# Create file
# Add timestamp to file

#CGB	Succint 1 line solution

#[ -d Truelayer ] || mkdir Truelayer && touch Truelayer/TLTest.txt && echo "`date`" > Truelayer/TLTest.txt

#-------------------------------------------------------------------------------

################################################################################

CMDNAME=$0

################################################################################

#CGB	Functions

display_usage()
{
echo "Usage:  ${CMDNAME} [options] "
echo ""
echo "Help"
echo ""
echo "  options:"
echo ""
echo "		directory-name filename"
echo ""
echo ""
echo "    -h                   Display help. Currently not implmented"
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
}


default_settings()
{
	echo "$0 : No arguments provided so using default settings of ..."
	echo ""
	echo "Directory to be set : TrueLayer"
	echo "Filename to be set : TLTest.txt"
	DIR="TrueLayer"
	FILE="TLTest.txt"
}

action()
{
[ -d ${DIR} ] || mkdir ${DIR} && touch ${DIR}/${FILE} && echo "`date`" > ${DIR}/${FILE} 
[ -d ${DIR} ] && echo "Directory already exists"
}

##########################################################################
#CGB
#
#	Interactive options

# if less than two arguments supplied, display usage 
case 	"$#" in
	0)	default_settings
		action
		;;
	1)	display_usage
		[ "$1" == "-h" ] && display_help
		exit 1
		;;
	2)	DIR=$1
		FILE=$2	
		action
		;;
	*)	display_usage
		exit 2
		;;
esac


################################################################################

exit 256

################################################################################


################################################################################
#EOF
################################################################################
