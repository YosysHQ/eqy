
EQY Strategies
==============

When proving partitions equal, EQY can use different strategies. Strategies are
configured using strategy sections in an ``.eqy`` file. This page documents the
currently supported strategies and the corresponding strategy specific options.
See :doc:`the .eqy file format reference <config>` for general information on
how to specify the strategies to use for each partition.


The ``sat`` Strategy
--------------------

The ``sat`` strategy uses Yosys's builtin ``sat`` command in the
``-tempinduct`` mode to perform a k-induction proof (see the `Yosys command
reference`_ for more details).

.. _Yosys command reference: https://yosyshq.readthedocs.io/projects/yosys/en/latest/cmd/sat.html

This strategy can be quite fast for small and simple partitions, but is less
effective for larger or more complex partitions. Being limited to k-induction
means that this strategy is unable to prove some partitions equal.

Yosys's ``sat`` command also lacks support for memories, and therefore this
startegy will not apply to any partitions that contain memory. This is done
automatically and does not require excluding these partitions using the
``noapply`` option.

Strategy Options
................

``depth <int>``
    The maximal depth to try. The ``sat`` strategy will only be able to prove
    partitions equivalent if the partitions produce equal outputs for the
    initial depth steps and also produce equal outputs in any step for
    which the depth preceding steps did so. (default value: 5)

Example Configuration
.....................

.. code-block:: text

    [strategy simple]
    use sat
    depth 10

The ``sby`` Strategy
--------------------

The ``sby`` strategy uses SBY_, the front-end for Yosys-based formal
verification flows. SBY provides a common interface for using different
backend-tools. This makes the ``sby`` stratagy a very versatile strategy and a
good default choice.

The ``sby`` strategy always uses SBY's ``prove`` mode. The partitions it can
prove equal and the runtime it takes to do so depend on which engine and solver
are used. See the `SBY reference`_ for details on the supported engines and
solvers in ``prove`` mode.

.. _SBY: https://yosyshq.readthedocs.io/projects/sby
.. _SBY reference: https://yosyshq.readthedocs.io/projects/sby

Strategy Options
................

``engine <engine-config>``
    The SBY engine to use. This can include the solver to be used by the engine
    as well as engine and solver options. Here ``<engine-config>`` is used
    verbatim in the generated ``.sby`` files. (default value: ``smtbmc``)

``depth <int>``
    The depth to use for engine configurations that require a depth bound.
    Ignored by engines that do not take a depth bound. (default value: 5)

``timeout <seconds>``
    Limits the amount of time spent trying to prove a partition equivalent. If
    the timout is reached before a proof was found, the next strategy is tried.
    (not enabled by default)

``xprop <on|off>``
    Do not use formal x-propagation. Disabling this avoids using the Yosys
    ``xprop`` pass, but may prevent proving partitions equivalent when they
    contain uninitialized state or don't-care values. (default value: on)

``option <option_name> <option_value>``
    Set arbitrary option in the generated ``.sby`` files. Can be used multiple
    times.

Example Configurations
......................

Using the ``smtbmc`` engine with the ``bitwuzla`` solver to perform a depth 10
k-induction equivalence proof:


.. code-block:: text

    [strategy induction]
    use sby
    engine smtbmc bitwuzla
    depth 10

Using the ``abc`` engine with the ``pdr`` solver to prove equivalence using the
PDR/IC3 algorithm:

.. code-block:: text

    [strategy induction]
    use sby
    engine abc pdr

The ``dummy`` Strategy
----------------------

The dummy strategy does not try to prove partitions equivalent and instead
immediately gives up, falling through to the next strategy or failing the
equivalence prove if no other strategy remains.
