# lilypond-metronome-mark-accidental-aligning-engraver

You can use the file [metronome-mark-accidental-aligning-engraver.ily](metronome-mark-accidental-aligning-engraver.ily) in this repository with LilyPond v2.24.0 or later to align metronome (tempo) marks to accidentals as recommended in [Elaine Gould, _Behind Bars_ (London: Faber Music, 2011)](https://www.fabermusic.com/shop/behind-bars-the-definitive-guide-to-music-notation-p6284), p 183. For example, running:

```sh
lilypond --output=metronome-mark-accidental-aligning --svg - <<EOS
\version "2.24.0"
\include "metronome-mark-accidental-aligning-engraver.ily"
\paper {
  page-breaking = #ly:one-line-auto-height-breaking
  top-margin = 0
  left-margin = 0
  right-margin = 0
  oddFooterMarkup= ##f
}
\pointAndClickOff
\relative {
  \tempo "Tempo I"
  R1
  \tempo "Tempo II"
  <aes' cis e>
}
\layout {
  \context { \Score \consists #Metronome_mark_accidental_aligning_engraver }
}
EOS
```

will output:

<img src="metronome-mark-accidental-aligning.svg">
