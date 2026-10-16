(define (domain aspirateur)
  (:requirements :strips :typing)
  (:types robot room)

  (:predicates
    (robot-at ?r - robot ?p - room)
    (dirty ?p - room)
    (clean ?p - room)
    (connected ?p1 - room ?p2 - room))

  ;; ---------- Action : se déplacer ----------
  (:action move
    :parameters (?r - robot ?from - room ?to - room)
    :precondition (and
        (robot-at ?r ?from)
        (connected ?from ?to))
    :effect (and
        (robot-at ?r ?to)
        (not (robot-at ?r ?from))))

  ;; ---------- Action : nettoyer ----------
  (:action clean
    :parameters (?r - robot ?p - room)
    :precondition (and
        (robot-at ?r ?p)
        (dirty ?p))
    :effect (and
        (clean ?p)
        (not (dirty ?p))))
)