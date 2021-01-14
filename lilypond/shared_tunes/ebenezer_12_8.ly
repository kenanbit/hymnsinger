\version "2.20.0"
\include "../lib/hymn_common.ly"
\language "english"

%% SETTINGS
hymnKey = \key g \minor
hymnTime = \time 12/8
globalParts = {
  \hymnKey
  \hymnTime
  \hymnBaseMoment
  \hymnBeamExceptions
}

%% NOTES
soprano = {
  \globalParts
  \relative g' { g4. 8( a bf) a4. g | a4. 8( bf c) bf4( a8) g4. | d'4. c8( d ef) d4( c8) bf4. | c4( bf8) a4. g2. | } \break
  \relative g' { g4. 8( a bf) a4. g | a4. 8( bf c) bf4( a8) g4. | d'4. c8( d ef) d4( c8) bf4. | c4( bf8) a4. g2. | } \break
  \relative g' { d'4. bf8( c d) c4. c | bf4. g8( a bf) a4. a | g4. g8( a bf) c4. c | bf4. c8( bf c) d2. | } \break
  \relative g' { g4. 8( a bf) a4. g | a4. 8( bf c) bf4( a8) g4. | d'4. c8( d ef) d4( c8) bf4. | c4( bf8) a4. g2. | } \break
  \bar "|."
}
alto = {
  \globalParts
  \relative e' { d4. d fs g | fs fs8( g a) g4( fs8) g4. | f4. f f4( fs8) g4. | g4. fs g2. | }
  \relative e' { d4. d fs g | fs fs8( g a) g4( fs8) g4. | f4. f f4( fs8) g4. | g4. fs g2. | }
  \relative e' { bf'4. bf a a | g g fs fs | g g8( a bf) a4. a | bf a8( g a) bf2. | }
  \relative e' { d4. d fs g | fs fs8( g a) g4( fs8) g4. | f4. f f4( fs8) g4. | g4. fs g2. | }
}
tenor = {
  \globalParts
  \relative a { bf4. bf8( a g) d'4( c8) bf4. | d4. d d4( c8) bf4. | bf4. a8( bf c) bf4( c8) d4. | ef4( d8) c4( d8) bf2. | }
  \relative a { bf4. bf8( a g) d'4( c8) bf4. | d4. d d4( c8) bf4. | bf4. a8( bf c) bf4( c8) d4. | ef4( d8) c4( d8) bf2. | }
  \relative a { f'4. f f ef | d d d c | bf g8( a bf) f'4. ef | d f f2. | }
  \relative a { bf4. bf8( a g) d'4( c8) bf4. | d4. d d4( c8) bf4. | bf4. a8( bf c) bf4( c8) d4. | ef4( d8) c4( d8) bf2. | }
}
bass = {
  \globalParts
  \relative d { g4. g d ef | d d g g | bf f bf4( a8) g4. | c,4. d g2. | }
  \relative d { g4. g d ef | d d g g | bf f bf4( a8) g4. | c,4. d g2. | }
  \relative d { bf'4. d8( c bf) f4. fs | g bf8( a g) d4. d | g g8( a bf) f4. f | g f bf2. | }
  \relative d { g4. g d ef | d d g g | bf f bf4( a8) g4. | c,4. d g2. | }
}
songChords = \chords {
  \set chordChanges = ##t
}

all_verses = { }

%% UNCOMMENT to VERIFY, then RECOMMENT
%\book { \score { \fillTradScore \soprano \alto \tenor \bass \songChords } }
%\score { << \soprano \alto \tenor \bass >> \midi { \tempo  4 = 120 } }
