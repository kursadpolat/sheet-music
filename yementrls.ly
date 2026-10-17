\version "2.24.0"

\paper {
  #(set-paper-size "a4")
  top-margin = 15\mm
  bottom-margin = 15\mm
  left-margin = 15\mm
  right-margin = 15\mm
}

\header {
  title = \markup { \fontsize #3 \bold "Yemen Türküsü" }
  subtitle = "Tenor & Perküsyon (Tek Satır Birleşik Partisyon)"
  composer = "Düz. F. Cesur Özdemir"
  tagline = ##f
}

% --- TENOR MOTİFLERİ (Orijinal Partisyon) ---
tA = { a4 r8 r8 a4 r8 r4. }
tB = { g4 r8 r8 bes4 r8 r4. }
tC = { g4 r8 r8 a4 r8 r4. }
tD = { a4 r4 r8 bes4 r4 r8 }
tE = { a4 r4 r8 bes8 a4 bes8 }
tF = { d'4 r8 r8 c'4 r8 r4. }

% --- PERKÜSYON MOTİFLERİ (Alt Ses / Çarpı Kafa) ---
pStd = { 
  \override NoteHead.style = #'cross
  f4 b,8_\markup{\tiny "t"} b,8_\markup{\tiny "kh"} r8 f8 b,8_\markup{\tiny "kh"} r4. 
}
pBrA = { 
  \override NoteHead.style = #'cross
  f4 r4 r8 f4 r4 r8 
}
pBrB = { 
  \override NoteHead.style = #'cross
  ees4 r4 r8 d4 r4 r8 
}

\score {
  \new Staff \with {
    instrumentName = \markup { \column { "Tenor" "Perk." } }
    \consists "Span_arpeggio_engraver"
  } {
    \clef "treble_8"
    \time 10/8
    \tempo 8 = 152
    
    <<
      % ================= TENOR (Saplar Yukarı) =================
      \new Voice = "tenor" {
        \voiceOne
        % 1 - 4
        \tA^\markup{\dynamic mp} | \tB | \tA | \tB | \break
        % 5 - 10
        \tA | \tB | \tA | \tC | \tD | \tE | \break
        % 11 - 16
        \tA | \tB | \tA | \tC | \tD | \tE | \break
        % 17 - 25
        \tA | \tA | \tF |
        \tA | \tA | \tF |
        \tA | \tA | \tF | \break
        % 26 - 31
        \tA | \tB | \tA | \tC | \tD | \tE | \break
        % 32 - 37
        \tA | \tB | \tA | \tC | \tD | \tE | \break
        % 38 - 46
        \tA | \tA | \tF |
        \tA | \tA | \tF |
        \tA | \tA | \tF | \break
        % 47 - 52
        \tA | \tB | \tA | \tC | \tD | \tE | \break
        % 53 - 57
        \tA | \tB | \tA | \tC |
        a4^\markup{\italic "subito" \dynamic p}( a4.) bes4( bes4.) \bar "|."
      }
      
      % ================= SÖZLER =================
      \new Lyrics \with { alignBelowContext = "tenor" } \lyricmode {
        dm dm dm dm dm dm dm dm
        dm dm dm dm dm dm dm dm dm dm dm dm dm d
        dm dm dm dm dm dm dm dm dm dm dm dm dm d
        dm dm dm dm dm dm dm dm dm dm dm dm dm dm dm dm dm dm
        dm dm dm dm dm dm dm dm dm dm dm dm dm d
        dm dm dm dm dm dm dm dm dm dm dm dm dm d
        dm dm dm dm dm dm dm dm dm dm dm dm dm dm dm dm dm dm
        dm dm dm dm dm dm dm dm dm dm dm dm dm d
        dm dm dm dm dm dm dm dm dm __ _
      }

      % ================= PERKÜSYON (Saplar Aşağı) =================
      \new Voice = "perk" {
        \voiceTwo
        % 1 - 8
        \repeat unfold 8 { \pStd }
        % 9 - 10
        \pBrA | \pBrB |
        % 11 - 14
        \repeat unfold 4 { \pStd }
        % 15 - 16
        \pBrA | \pBrB |
        % 17 - 29
        \repeat unfold 13 { \pStd }
        % 30 - 31
        \pBrA | \pBrB |
        % 32 - 35
        \repeat unfold 4 { \pStd }
        % 36 - 37
        \pBrA | \pBrB |
        % 38 - 50
        \repeat unfold 13 { \pStd }
        % 51 - 52
        \pBrA | \pBrB |
        % 53 - 56
        \repeat unfold 4 { \pStd }
        % 57
        \override NoteHead.style = #'cross
        f4 r4 r8 r4 r4 r8
      }
    >>
  }
}