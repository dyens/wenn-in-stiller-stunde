\version "2.23.82"

\include "soprano.ly"
\include "alt.ly"
\include "bass.ly"
\include "tenor.ly"
\include "lyrics.ly"

leadVoice = {
   \set Staff.midiMinimumVolume = #0.8
   \set Staff.midiMaximumVolume = #1.0
   % \set Staff.midiInstrument = "lead 3 (calliope)"
   % \set Staff.midiInstrument = "choir aahs"
   \set Staff.midiInstrument = "lead 4 (chiff)"
   % \set Staff.midiInstrument = "fx 6 (goblins)"

}

backVoice = {
   \set Staff.midiMinimumVolume = #0.3
   \set Staff.midiMaximumVolume = #0.4
   \set Staff.midiInstrument = "pad 1 (new age)"
}



\header {
  title = "Title"
  composer = "Composer"
  arranger = "Arranger"
  tagline = "Библиотека Adeptus Chorus"
}




\book {
  \bookOutputSuffix "Choir"
  \paper {
     indent = 0     % don't indent first system
  }
  % \markup \vspace #3


  \score {
    \midi {
      \tempo 4 = 140
    }
    \layout {
      \context {
        \Staff
        \RemoveAllEmptyStaves
        \consists Keep_alive_together_engraver
      }
    }

  \new ChoirStaff <<
    \new Staff = "S" \with {
     instrumentName = "S"
     shortInstrumentName = "S"
    } <<
      \new Voice = "S" << { \soprano }  >>
    >>
    \new Lyrics \lyricsto "S" { \Lyric }

    \new Staff = "A" \with {
     instrumentName = "A"
     shortInstrumentName = "A"
    } <<
      \new Voice = "A" << { \alt }  >>
    >>
    \new Lyrics \lyricsto "A" { \Lyric }


    \new Staff = "T" \with {
     instrumentName = "T"
     shortInstrumentName = "T"
    } <<
      \new Voice = "T" << { \tenor }  >>
    >>
    \new Lyrics \lyricsto "T" { \Lyric }

    \new Staff = "B" \with {
     instrumentName = "B"
     shortInstrumentName = "B"
    } <<
      \new Voice = "B" << {\bass}  >>
    >>
    \new Lyrics \lyricsto "B" { \Lyric }



  >>
  }
}

\book {
  \bookOutputSuffix "Tenor"
  \score {
    \midi { 
    }
    \new StaffGroup <<
      \new Voice = "Soprano" << {
        \global
        \backVoice
        \soprano
      } >>
      \new Voice = "alt" << {
        \global
        \backVoice
        \alt
      } >>
      \new Voice = "tenor" << {
        \global
        \leadVoice
        \tenor
      } >>
      \new Voice = "bass" << {
        \global
        \backVoice
        \bass
      } >>
    >>
  }
}



