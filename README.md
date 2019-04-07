# M-CyPhySe
Intrusion Detection system for SAP CPS.


Update Logs of the code and the invariants:

Model-1 (invariants extraction) (25th March, 2019)

1) Assuming that openAPS is up and running on the rig. We can use this script "invex.sh" to obtain the safety properties or the invariants which must hold for the system.

2) We can use these invariants in two ways, a) to attack the system and b) to detect intrusions

prototype-1 (5th April, 2019)

1) Open-loop implementation of the CPS.
2) Not taking any background patient data into consideration.
3) Generates the amount to be injected based on the current inputs.


Running KLEE (7th April, 2019)

1) To explore all the states.
2) To know if there is a state  being reached which goes against the safety invariant.
