(define (problem aspirateur-2)
  (:domain aspirateur)

  (:objects
    r1 - robot
    cuisine salon chambre sdb - room)

  (:init
    (robot-at r1 salon)

    ;; La cuisine est déjà propre, les autres sont sales
    (clean cuisine)
    (dirty salon) (dirty chambre) (dirty sdb)

    (connected salon cuisine)  (connected cuisine salon)
    (connected salon chambre)  (connected chambre salon)
    (connected salon sdb)      (connected sdb salon))

  (:goal (and
    (clean cuisine)
    (clean salon)
    (clean chambre)
    (clean sdb)))
)