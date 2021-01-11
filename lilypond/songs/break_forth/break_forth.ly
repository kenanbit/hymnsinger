\version "2.20.0"
#(ly:set-option 'relative-includes #t)
\language "english"
\include "../../lib/clairnote.ly"
\include "../../lib/hymn_common.ly"
%\include "color_by_pitch.ly"
tags = "christian 4part acapella 1verse musicbyother textbyother"
\header {
  title = \titleText "Break forth, O beauteous heavenly light"
  %subtitle = \smallText "Optional"
  composer = \smallText "Music: Johann Schop, 1641"
  arranger = \smallText "Harmonized by J. S. Bach, 1734"
  poet = \smallText "Text: Johann Rist, 1641, tr. John Troutbeck ca. 1885"
  meter = \smallText "ERMUNTRE DICH 87.87.88.77"
  copyright =\smallText "Public Domain. Free to distribute, modify, and perform. Typeset by Kenan Schaefkofer."
  tagline = \tagline
}

%% SETTINGS
hymnKey = \key f \major
hymnTime = \time 4/4
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
  \relative g' { \partial 4 f4 | f g a8 b c4 | c b c a | bf a g a | \partial 2. g2 f4\fermata | } \break
  \relative g' { \partial 4 f4 | f g a8 b c4 | c b c a | bf a g a | \partial 2. g2 f4\fermata | } \break
  \relative g' { \partial 4 g4 | g a bf bf | a8 g a4 g a | a a bf8 c d4 | \partial 2. d cs d | } \break
  \relative g' { \partial 4 e'4 | f a, bf a | g2 g4 c | d c bf a8 bf | \partial 2. g2 f4\fermata | }
  \bar "|."
}
alto = {
  \globalParts
  \relative e' { c4 | d e c8 d e4 | d8 e f4 e e | d c8 d e4 f~ | f e c | }
  \relative e' { c4 | d e c8 d e4 | d8 e f4 e e | d c8 d e4 f~ | f e c | }
  \relative e' { e8 f | g4. fs8 g fs g4 | g fs d d8 cs | d4 d d8 e f e | e f g4 f | }
  \relative e' { g4 | f8 g a4~ a8 g~ g f | f2 e4 f8 e | d4 e f8 g c,4 | d( c) c | }
}
tenor = {
  \globalParts
  \relative a { a4 | a8 b~ b c a g g4 | g g g a8 g | f g a bf c4 c | c4. bf8 a4\fermata \bar " "| }
  \relative a { a4 | a8 b~ b c a g g4 | g g g a8 g | f g a bf c4 c | c4. bf8 a4\fermata \bar " "| }
  \relative a { c8 d | e d c4 d e | a, d8 c bf4 f8 g | a bf c d bf4 b | a a a \bar " " | }
  \relative a { c4 | c f f,8 g a4 | d8 c d b c4 c | c8 bf bf a a g f4 | f8( e16 d e4) a\fermata |}
}
bass = {
  \globalParts
  \relative d { f8 e | d4 c f e8 f | g4 g, c cs | d8 e f bf, bf' a g f | c'4 c, f | }
  \relative d { f8 e | d4 c f e8 f | g4 g, c cs | d8 e f bf, bf' a g f | c'4 c, f | }
  \relative d { c4 | c'8 bf a4 g cs, | d d g, d'8 e | f4 fs g gs | a a, d | }
  \relative d { c'8 bf | a g f e d e f d | b a b g c4 a | bf c d8 e f4 | bf,( c) f, | }
}
songChords = \chords {
  \set chordChanges = ##t
}

%% LYRICS
verseA = \lyricmode {
    Break forth, O beau -- _ teous heav'n -- ly light, and ush -- er in the morn -- ing.
    O shep -- herds, shrink _ not with af -- fright, but hear the an -- gel's warn -- ing.
    This child, now weak in in -- _ fan -- cy, our con -- fi -- dence _ and joy shall be,
    the power of Sa -- tan break -- ing, our peace e -- ter -- nal _ mak -- ing.
}
verseB = \lyricmode { }
verseC = \lyricmode { }
verseD = \lyricmode { }
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
    \tempo  4 = 70
  }
}
