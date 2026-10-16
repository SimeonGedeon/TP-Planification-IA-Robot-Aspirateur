(define (problem aspirateur-1)
  (:domain aspirateur)

  (:objects
    r1 - robot
    cuisine salon chambre sdb - room)

  (:init
    ;; Position initiale du robot
    (robot-at r1 salon)

    ;; Toutes les pièces sont sales
    (dirty cuisine)
    (dirty salon)
    (dirty chambre)
    (dirty sdb)

    ;; Passages (bidirectionnels)
    (connected salon cuisine)  (connected cuisine salon)
    (connected salon chambre)  (connected chambre salon)
    (connected salon sdb)      (connected sdb salon))

  (:goal (and
    (clean cuisine)
    (clean salon)
    (clean chambre)
    (clean sdb)))
)