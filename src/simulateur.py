"""
Simulateur Python du robot aspirateur.
Rejoue le plan produit par Fast Downward et vérifie qu'il est valide.
"""

# ------------------------------------------------------------------
# 1. Configuration du monde (identique au problem.pddl)
# ------------------------------------------------------------------
ROOMS = ["cuisine", "salon", "chambre", "sdb"]

CONNECTIONS = {
    ("salon", "cuisine"), ("cuisine", "salon"),
    ("salon", "chambre"), ("chambre", "salon"),
    ("salon", "sdb"),     ("sdb", "salon"),
}

# ------------------------------------------------------------------
# 2. État initial (identique à (:init ...))
# ------------------------------------------------------------------
state = {
    "robot": "salon",
    "dirty": {"cuisine", "salon", "chambre", "sdb"},
    "clean": set(),
}

# ------------------------------------------------------------------
# 3. Plan produit par Fast Downward
# ------------------------------------------------------------------
plan = [
    ("move",  "salon", "chambre"),
    ("clean", "chambre"),
    ("move",  "chambre", "salon"),
    ("move",  "salon", "cuisine"),
    ("clean", "cuisine"),
    ("move",  "cuisine", "salon"),
    ("clean", "salon"),
    ("move",  "salon", "sdb"),
    ("clean", "sdb"),
]

# ------------------------------------------------------------------
# 4. Application d'une action (avec vérification des préconditions)
# ------------------------------------------------------------------
def apply(state, action):
    if action[0] == "move":
        _, src, dst = action
        assert state["robot"] == src, \
            f"❌ move: robot en '{state['robot']}' au lieu de '{src}'"
        assert (src, dst) in CONNECTIONS, \
            f"❌ move: pas de passage {src} → {dst}"
        state["robot"] = dst

    elif action[0] == "clean":
        _, room = action
        assert state["robot"] == room, \
            f"❌ clean: robot en '{state['robot']}' au lieu de '{room}'"
        assert room in state["dirty"], \
            f"❌ clean: '{room}' n'est pas sale"
        state["dirty"].remove(room)
        state["clean"].add(room)

    else:
        raise ValueError(f"Action inconnue : {action}")

# ------------------------------------------------------------------
# 5. Simulation pas à pas
# ------------------------------------------------------------------
print("=" * 60)
print("SIMULATION DU PLAN")
print("=" * 60)
print(f"[INIT] robot={state['robot']:8s} clean={sorted(state['clean'])}")
print()

for i, action in enumerate(plan, 1):
    apply(state, action)
    print(f"[{i:02d}] {action[0]:5s} {action[1:]}  "
          f"-> robot={state['robot']:8s} clean={sorted(state['clean'])}")

# ------------------------------------------------------------------
# 6. Vérification du but
# ------------------------------------------------------------------
print()
print("=" * 60)
if state["clean"] == set(ROOMS):
    print("✅ PLAN VALIDE : toutes les pièces sont propres.")
else:
    print(f"❌ BUT NON ATTEINT. Manquent : {set(ROOMS) - state['clean']}")
print("=" * 60)