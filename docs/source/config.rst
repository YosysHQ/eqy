
Reference for .eqy file format
==============================

A ``.eqy`` file consists of sections. Each section start with a single-line
section header in square brackets.

Options section
---------------

The optional ``[options]`` section contains one config setting per line, in the
form of key-value pairs.

.. code-block:: text

   [options]
   awesome yes
   foobar 15

Gold and gate sections
----------------------

The mandatory ``[gold]`` and ``gate`` sections contains the Yosys script that
reads and elaborates the "gold" and "gate" versions of the design under test.
For example, for a simple project contained in a single design file
``mytest.sv``, and a synthesis output file ``synth.v``, with the
top-module ``mytest``:

.. code-block:: text

   [gold]
   read -sv mytest.sv
   prep -top mytest

   [gate]
   read -sv synth.v
   prep -top mytest

Run ``yosys`` in a terminal window and enter ``help`` on the Yosys prompt
for a command list. Run ``help <command>`` for a detailed description of the
command, for example ``help prep``.

Recode sections
---------------

Recode sections contain encodings for FSM state registers, for the cases when
the sythesis tool changes those encodings. (Alternatively the state registers
can be excluded as match points and strategies for sequential equivalence
checking can be employed for proving equivalence of the FSM as a whole.)

These sections start with a header that contains two arguments: A module
name from the (gold) design and the name of a wire within that module. (Those
arguments are actually both regular expressions, but are rarely used to match
more than one entity.)

The section itself listst binary representation of values in the gold design
and their corresponding gate encodings. Values not listed should never be
produced by the gold design.

.. code-block:: text

   [recode mytest state]
   00 001
   01 010
   10 100

Match sections
--------------

Match sections contain rules for matching net names in the gold design to net
names in the gate design. The match section header contains an optional regex
matching module names. The lines within the match section are only applied to
modules matching that regex, or all modules if the regex is omitted.

.. code-block:: text

   [match axi_xbar_.*]
   gate-match (.*)_ff \0

TBD: gold-match, gate-match, gold-nomatch, gate-nomatch

Partition sections
------------------

Partition sections contain rules for creating matching partitions in the gold
and gate designs.  The partition section header contains an optional regex
matching module names. The lines within the partition section are only applied
to modules matching that regex, or all modules if the regex is omitted.

.. code-block:: text

   [match axi_xbar_.*]
   name (reader|buffer|arbiter|writer)_([0-7]) pipeline_\1

TBD Primitive grouping: [no-]autogroup, group, nostop

TBD: Partition merging and naming: name, merge, nosplit, sticky, path

Strategy sections
-----------------

Each strategy section creates a verification strategy used to prove
partitions to be equal. The section header contains the name of the
strategy as an argument.

.. code-block:: text

   [strategy simple]
   match axi_xbar_.*
   use satseq
   depth 10

TBD: use, match, nomatch

TBD: strategy types (in its own chapter)

