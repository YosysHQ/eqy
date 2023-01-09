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
#    bash tryamend.sh check-partition decoder_trigger 12
#    make -j6 -f tryamend.mk
#    tail tryamend_*/tryamend.log
#
# Other useful commands:
#    eqy -fmj6 picorv32_vivado.eqy; grep -A18 Partition.Matrix: picorv32_vivado/partition.log
#    ( cd picorv32_vivado/partitions; sby -f picorv32.decoder_trigger.sby; )
#    ( cd picorv32_vivado/strategies/picorv32.decoder_trigger/pdr; sby -f picorv32.decoder_trigger.sby; )

set -ex

rm -rf tryamend_*.eqy tryamend_*/ tryamend.mk
variants=$(echo $(grep '^{' picorv32_vivado.eqy | sed -e 's/^.//; s/. .*//;' | sort -u))
{ echo -n "all:"; for v in $variants; do echo -n " tryamend_${v}/tryamend.done"; done; echo; } >> tryamend.mk

for v in $variants; do
	awk "/^{/ {if (\$1 == \"{$v}\") next; \$1=\"\"; } { print; }" picorv32_vivado.eqy > tryamend_${v}.eqy
	echo "tryamend_${v}/tryamend.done:" >> tryamend.mk
	echo "	-eqy -fm tryamend_${v}.eqy" >> tryamend.mk
	case "$1" in
		check-partition)
			echo "	sed -i 's/ --keep-going / /; /^depth / s/.*/depth ${3:-20}/;' tryamend_${v}/partitions/picorv32.${2}.sby"
			echo "	-cd tryamend_${v}/partitions; sby -f -d tryamend_${v} picorv32.${2}.sby | tee ../tryamend.log"
			;;
	esac >> tryamend.mk
	echo "	touch tryamend_${v}/tryamend.done" >> tryamend.mk
done
