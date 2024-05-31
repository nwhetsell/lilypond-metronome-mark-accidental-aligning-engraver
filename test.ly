\version "2.24.0"

\include "metronome-mark-accidental-aligning-engraver.ily"

\relative {
  \tempo "Tempo I"
  R1
  \tempo "Tempo II"
  <aes' cis e>
}

\layout {
  \context {
    \Score
    \consists #Metronome_mark_accidental_aligning_engraver
  }
}
