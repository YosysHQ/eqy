#!/bin/bash
#
# Utility script for finding the right fragments to amend to a partition.
# Add lines with "{tag}" prefixes to picorv32_vivado.eqy, for example:
#    {foo} amend foo_reg
#    {bar} amend bar_reg
#
# This script will create a derivative .eqy config file for each unique
# tag, with the lines for this tag removed. And it creates a makefile for
# running tests on those derivative .eqy files.
#
# Usage example:
#    bash tryamend.sh decoder_trigger 12

set -ex

rm -rf tryamend_*.eqy tryamend_*/ tryamend.mk
variants=$(echo $(grep '^{' picorv32_vivado.eqy | sed -e 's/^.//; s/. .*//;' | sort -u))

{
	echo -n "all:"
	for v in $variants; do
		echo -n " tryamend_${v}/tryamend.done"
	done; echo
} > tryamend.mk

for v in $variants; do
	awk "/^{/ {if (\$1 == \"{$v}\") next; \$1=\"\"; } { print; }" picorv32_vivado.eqy > tryamend_${v}.eqy
	{
		echo; echo "tryamend_${v}/tryamend.done:"
		echo "	-eqy -fm tryamend_${v}.eqy"
		echo "	sed -i 's/ --keep-going / /; /^depth / s/.*/depth ${2:-20}/;' tryamend_${v}/partitions/picorv32.${1}.sby"
		echo "	-cd tryamend_${v}/partitions; sby -f -d tryamend_${v} picorv32.${1}.sby | tee ../tryamend.log"
		echo "	touch tryamend_${v}/tryamend.done"
	} >> tryamend.mk
done

make -j6 -f tryamend.mk
tail -n4 tryamend_*/tryamend.log
