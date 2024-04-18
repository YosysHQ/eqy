Installing
==========

Follow the instructions below to install EQY and its dependencies.

CAD suite(s)
************

EQY is part of the `Tabby CAD Suite
<https://www.yosyshq.com/tabby-cad-datasheet>`_ and the `OSS CAD Suite
<https://github.com/YosysHQ/oss-cad-suite-build>`_! The easiest way to use sby
is to install the binary software suite, which contains all required
dependencies, including Yosys, SBY, and all its solvers.

* `Contact YosysHQ <https://www.yosyshq.com/contact>`_ for a `Tabby CAD Suite
  <https://www.yosyshq.com/tabby-cad-datasheet>`_ Evaluation License and
  download link
* OR go to https://github.com/YosysHQ/oss-cad-suite-build/releases to download
  the free OSS CAD Suite
* Follow the `Install Instructions on GitHub
  <https://github.com/YosysHQ/oss-cad-suite-build#installation>`_

Make sure to get a Tabby CAD Suite Evaluation License for industry-grade
SystemVerilog and VHDL parsers!

For more information about the difference between Tabby CAD Suite and the OSS
CAD Suite, please visit https://www.yosyshq.com/tabby-cad-datasheet.

Installing from source
**********************

Prerequisites
-------------

EQY requires a matching version of `Yosys <https://github.com/YosysHQ/yosys>`_.
We use `GitHub tags <https://github.com/YosysHQ/eqy/tags>`_ to indicate that a
commit has been confirmed to work with that Yosys release version.

Parts of EQY are Yosys plugins. To be able to load the plugins, they must be
compiled in the same environment as the Yosys binary you are using. If you
would like to build EQY from source but use a precompiled Yosys binary, you can
use the `Tabby CAD Plugin Build docker environment 
<https://github.com/YosysHQ-GmbH/tabby-cad-plugin-build>`_ to compile the EQY
plugins (the environtment works for both Tabby and OSS CAD Suite Yosys).

To use ``[strategy sby]``, you also need to have a
`matching version <https://github.com/YosysHQ/sby/tags>`_ of
`SBY <https://github.com/YosysHQ/sby/>`_ installed, as well as the solvers you
want to use.

EQY
---

Use these commands to build and install EQY:

.. code-block:: text

   git clone https://github.com/YosysHQ/eqy.git eqy
   cd eqy
   make
   sudo make install

