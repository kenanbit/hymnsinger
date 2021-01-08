\version "2.20.0"
#(ly:set-option 'relative-includes #t)
\language "english"
\include "../../lib/clairnote.ly"
\include "../../lib/hymn_common.ly"
%\include "color_by_pitch.ly"
\header {
  title = \titleText "Brethren, we have met to worship"
  composer = \smallText "Music: The Columbian Harmony, 1825"
  poet = \smallText "Text: The Columbian Harmony, 1825"
  meter = \smallText "HOLY MANNA 87.87 D"
  copyright =\smallText "Public Domain. Free to distribute, modify, and perform. Typeset by Kenan Schaefkofer."
  tagline = \tagline
}

%% SETTINGS
hymnKey = \key a \major
hymnTime = \time 2/2
%% Adjust these to fix beaming
%hymnBaseMoment = \set Timing.baseMoment = #(ly:make-moment 1/4)
%hymnBeatStructure = \set Timing.beatStructure = 1,1,1,1
%hymnBeatExceptions = \set Timing.beamExceptions = #'()
globalParts = {
  \hymnKey
  \hymnTime
  \hymnBaseMoment
  \hymnBeatStructure
  \hymnBeamExceptions
}

%% NOTES
soprano = {
  \globalParts
  \relative g' {e4 8 fs a4 a | b4 b8 a  cs b a fs | e4 8 fs a4 a | cs b a2 |} \break
  \relative g' {e4 8 fs a4 a | b4 b8 a  cs b a fs | e4 8 fs a4 a | cs b a2 |} \break
  \relative g' {cs4 e e e | cs4 8 a b4 a | cs4 e e e | cs4 8 a b2 |} \break
  \relative g' {e4 8 fs a4 a | b4 b8 a  cs b a fs | e4 8 fs a4 a | cs b a2 |} \break
  \bar "|."
}
alto = {
  \globalParts
  \relative e' {cs4 8 d cs4 e | d d8 cs e4 e8 d | cs4 cs8 d e4 cs | e d cs2 |}
  \relative e' {cs4 8 d cs4 e | d d8 cs e4 e8 d | cs4 cs8 d e4 cs | e d cs2 |}
  \relative e' {e4 a a a | e e d cs | e a a a | e e e2 |}
  \relative e' {cs4 8 d cs4 e | d d8 cs e4 e8 d | cs4 cs8 d e4 cs | e d cs2 |}
}
tenor = {
  \globalParts
  \relative a {a4 a a a | gs gs8 a \pa a gs \pt a4 | a a a a | a gs a2 |}
  \relative a {a4 a a a | gs gs8 a \pa a gs \pt a4 | a a a a | a gs a2 |}
  \relative a {a4 cs cs cs | a a gs a | a cs cs cs | a a gs2 |}
  \relative a {a4 a a a | gs gs8 a \pa a gs \pt a4 | a a a a | a gs a2 |}
}
bass = {
  \globalParts
  \relative d {a4 a a cs | e e a8 e cs d | a4 a8 d cs4 a | e' e a,2}
  \relative d {a4 a a cs | e e a8 e cs d | a4 a8 d cs4 a | e' e a,2}
  \relative d {a'4 a a a | a a8 cs, e4 a, | a' a a a | a a,8 cs e2 |}
  \relative d {a4 a a cs | e e a8 e cs d | a4 a8 d cs4 a | e' e a,2}
}

%% LYRICS
verseA = \lyricmode {
  Breth -- ren _  we have met to _ wor -- _ ship _ and a -- _ dore the Lord our God.
  Will you _ pray with all your _ pow -- _ er _ while we _ try to preach the word?
  All is vain un -- less the _ Spir -- it of the ho -- ly One comes _ down.
  Breth -- ren _ pray, and ho -- ly _ man -- _ na _ will be _ show -- ered all a -- round.
}
verseB = \lyricmode {
  Sis -- ters, _ will you come and _ help  _ us? _ Mo -- ses' _ sis -- ters aid -- ed him.
  Will you _ help the trem -- bling _ mourn -- _ ers _ who are _ strug -- gling hard with sin?
  Tell them all a -- bout the _ Sav -- ior. Tell them that he will be _ found.
  Sis -- ters _ pray, and ho -- ly _ man -- _ na _ will be _ show -- ered all a -- round.
}
verseC = \lyricmode {
  Is there _ here a trem -- bling _ jail -- _ er, _ seek -- ing _ grace and filled with fears?
  Is there _ here a weep -- ing _ Ma -- _ ry _ pour -- ing _ forth  a flood of tears?
  Breth -- ren join your cries to _ help them, sis -- ters, let your prayers a -- _ bound!
  Pray, oh _ pray, that ho -- ly _ man -- _ na _ will be _ show -- ered all a -- round.
}
verseD = \lyricmode {
  Let us _ love our God su -- _ preme -- _ ly, _ let us _ love each oth -- er too.
  Let us _ love and pray for _ sin -- _ ners _ till our _ God makes all things new.
  Christ will call us home to _ heav -- en. At his ta -- ble we'll sit _ down.
  Christ will _ gird him -- self and _ serve _ us _ with sweet _ man -- na all a -- round.
}
verseE = \lyricmode { }
verseF = \lyricmode { }

all_verses = <<
  \new NullVoice = "soprano" \soprano
  % Add what you need. If more than 4, fill in the second argument as shown in 5 and 6
  \new Lyrics  \lyricsto soprano  { \globalLyrics "1" "" \verseA }
  \new Lyrics  \lyricsto soprano  { \globalLyrics "2" "" \verseB }
  \new Lyrics  \lyricsto soprano  { \globalLyrics "3" "" \verseC }
  \new Lyrics  \lyricsto soprano  { \globalLyrics "4" "" \verseD }
  \new Lyrics  \lyricsto soprano  { \globalLyrics "5" "5" \verseE }
  \new Lyrics  \lyricsto soprano  { \globalLyrics "6" "6" \verseF }
>>

%% If fillScore needs to be modified (usually for non-SATB standard songs), copy it here from hymn_common
%% The default fillscore combines the first two arguments into an upper staff and the last two arguments into
%% a lower staff.

%% Traditional notation
\book { \bookOutputSuffix "trad" \score { \fillTradScore \soprano \alto \tenor \bass \songChords } }

%% Traditional with shaped noteheads (broken on non-combined chords)
\book { \bookOutputSuffix "shapenote" \score { \fillTradScore {\aikenHeads \soprano} {\aikenHeads \alto} {\aikenHeads \tenor} {\aikenHeads \bass} \songChords } }

%% Clairnotes Notation
\book { \bookOutputSuffix "clairnote" \score { \fillClairScore \soprano \alto \tenor \bass } }

%% MIDI output
\score {
  <<
    \new Staff \with { midiMaximumVolume = #0.9 } \soprano
    \new Staff \with { midiMaximumVolume = #0.7  } \alto
    \new Staff \with { midiMaximumVolume = #0.8  } \tenor
    \new Staff \with { midiMaximumVolume = #0.9 } \bass
  >>
  \midi {
    \context { \Staff \remove "Staff_performer" }
    \context { \Voice \consists "Staff_performer" }
    \tempo  4 = 130
  }
}