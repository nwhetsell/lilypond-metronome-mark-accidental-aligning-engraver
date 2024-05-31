\version "2.24.0"

#(define (Metronome_mark_accidental_aligning_engraver context)
  (let (
      (accidentals '())
      (metronome-mark '())
      (time-signature '()))

    (make-engraver
      (acknowledgers
        ((accidental-interface engraver grob source-engraver)
          (set! accidentals (cons grob accidentals)))
        ((metronome-mark-interface engraver grob source-engraver)
          (set! metronome-mark grob))
        ((time-signature-interface engraver grob source-engraver)
          (set! time-signature grob)))

      ((stop-translation-timestep engraver)
        (when (and (not (null? accidentals))
                   (not (null? metronome-mark))
                   (null? time-signature))
          (let ((min-accidental-X +inf.0))
            (for-each
              (lambda (accidental)
                (set! min-accidental-X (min min-accidental-X (car (ly:grob-extent accidental (ly:grob-parent accidental X) X)))))
              accidentals)
            (ly:grob-set-property! metronome-mark 'extra-offset `(,min-accidental-X . 0))))

        (set! accidentals '())
        (set! metronome-mark '())
        (set! time-signature '())))))
