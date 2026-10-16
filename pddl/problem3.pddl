(define (problem aspirateur-3)
  (:domain aspirateur)

  (:objects
    r1 - robot
    cuisine salon chambre sdb - room)

  (:init
    (robot-at r1 salon)
    (dirty cuisine) (dirty salon) (dirty chambre) (dirty sdb)

    ;; ⚠️ Passage salon↔sdb SUPPRIMÉ
    (connected salon cuisine)  (connected cuisine salon)
    (connected salon chambre)  (connected chambre salon))

  (:goal (and
    (clean cuisine)
    (clean salon)
    (clean chambre)
    (clean sdb)))
)