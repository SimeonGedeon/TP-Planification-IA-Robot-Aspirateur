#!/bin/bash
# Lance les 3 scénarios avec Fast Downward et sauvegarde les plans

FD="python3 $HOME/Master_1/Semestre_2/Planification_ia/downward/fast-downward.py"
PDDL="../pddl"
PLANS="../plans"

echo "=== Scénario 1 : base ==="
$FD $PDDL/domain.pddl $PDDL/problem.pddl --search "astar(blind())" > $PLANS/plan1.txt
echo "→ plan1.txt"

echo "=== Scénario 2 : cuisine propre ==="
$FD $PDDL/domain.pddl $PDDL/problem2.pddl --search "astar(blind())" > $PLANS/plan2.txt
echo "→ plan2.txt"

echo "=== Scénario 3 : sdb isolée (insoluble attendu) ==="
$FD $PDDL/domain.pddl $PDDL/problem3.pddl --search "astar(blind())" > $PLANS/plan3.txt
echo "→ plan3.txt (échec attendu)"

echo "=== Simulation Python ==="
python3 ../src/simulateur.py