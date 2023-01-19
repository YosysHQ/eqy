
Equivalence and X-Propagation
==============================

For a circuit described without any don't-care values and with all flip-flops
initialized to a fixed value, an equivalence check can be expressed as
safety-property using a miter circuit that compares the output of the "gold"
and "gate" circuit, each receiving the same inputs.

Safe-Replacement Equivalence
............................

The situation is not as simple when flip-flops start with an unknown initial
value or when synthesis is allowed to turn don't-care bits into arbitrary
values. There are different notions of circuit equivalence in such a setting.
EQY implements a form of safe-replacement equivalence. This means that every
output sequence that can be observed for the "gate" circuit for some input
sequence must correspond to a compatible output sequence of the "gold" circuit
when using the same input sequence.

It makes sense to think of this as a refinement as it is not a symmetric
equivalence. Requireing that any behavior of the "gate" circuit is present for
the "gold" circuit ensures that properties validated for the "gold" circuit
also hold for the "gate" circuit. This does not hold when reversing the roles
of "gate" and "gold" as chosing different initial values for uninitialized
flip-flops or making different choices for don't-care values within the "gold"
circuit may result in an output sequence that cannot occur for a given
equivalent "gate" circuit.


Equivalence using Formal X-Propagation
.......................................................

EQY's strategies interpret the "gold" circuit using Yosys's 3-valued (0, 1 and
x) semantics (essentially the SystemVerilog x-propagation rules with the
exception that ``if`` statements behave like ``s ? a : b`` expressions,
producing x-bits when the two branches produce incompatible assignments). The
"gate" circuit is interpreted using 2-valued semantics where any x-bit is
replaced with an arbitrary unconstrained value (matching SBY's formal
verification flows). The outputs are then compared using a miter that considers
an x output on the "gold" side equal to any value of the "gate" side.

Using a 3-valued interpretation for the "gold" side makes it possible to check
an indivudal "gate" trace against a single "gold" trace, turning the
equivalence check with don't-cares and uninitialized flip-flops into a
safety-property which in turn makes it possible to have EQY strategies
integrating a large number of well performing solvers. This would not be
possible when using a 2-valued interpretation of the "gold" side which would
require an extra level of quantification to capture the possible choices for
uninitialized or don't-care bits.

When using EQY with a design that is not fully initialized or contains
don't-care values, it is important to keep in mind that the "gold" circuit is
interpreted using 3-valued semantics. Properties of the "gold" circuit that are
expected to hold for equivalent "gate" circuit should be verified against a
3-valued interpretation of the "gold" circuit.

Avoiding X-Bits
...............

When a 3-valued interpretation of the "gold" circuit exhibits unwanted
behavior, it is possible to use Yosys's passes to fully or partially replace
some x-bits with defined values in the ``[gate]``, ``[gold]`` or ``[script]``
section of an ``.eqy`` file. The ``setundef`` pass (`setundef help`_) replaces
x-bits with constant, random or unconstrained values while the ``sim -r`` pass
(`sim help`_) can simulate a reset sequence, writing back the resulting state
as new initial state.

.. _`setundef help`: https://yosyshq.readthedocs.io/projects/yosys/en/latest/cmd/setundef.html
.. _`sim help`: https://yosyshq.readthedocs.io/projects/yosys/en/latest/cmd/sim.html
