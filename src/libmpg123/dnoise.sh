#!/bin/sh

# A script to generate dnoise.c from a plain text file with the noise numbers.
# In future, the plain text file (or a binary version) may be used by mpg123 at runtime instead of compiling it in.

# copyright 2006-8 by the mpg123 project - free software under the terms of the LGPL 2.1
# initially written by Thomas Orgis

echo '/*
	dnoise: Noise for dithered output.

	copyright 2006-8 by the mpg123 project - free software under the terms of the LGPL 2.1
	see COPYING and AUTHORS files in distribution or http://mpg123.org
	initially written by (in assembler) Adrian Bacon
*/

#include "mpg123lib_intern.h"

float dithernoise[DITHERSIZE] =
{'

# If sed is there, use it.
# not using echo -n, not portable -- the extra empty line does not matter
if echo | sed '' >&2; then 
  sed -e 's/$/f,/' < "$1"
else
# Plain sh... very slow, but works.
  while read i
  do
    echo "${i}f,"
  done < "$1"
fi

echo '};';
