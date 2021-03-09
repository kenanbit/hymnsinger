\version "2.20.0"
#(ly:set-option 'relative-includes #t)
\include "../../lib/hymn_common.ly"

%% TUNE INFO
\include "../../shared_tunes/geneva_42.ly"

%% SONG INFO
title = \titleText "Comfort, comfort, O my people"
poet = \twoLineSmallText "Text: Johannes Olearius, 1671" "Translated Catherine Winkworth, 1863"
copyright = \public_domain_notice "Kenan Schaefkofer"
tags = "christian 4part acapella 3verse musicbyother textbyother"
dateAdded = "2021-02-07"
\include "../../lib/header.ly"

%% LYRICS
verseA = \lyricmode {
  Com -- fort, com -- fort, O my peo -- ple,
  speak of peace, now says our God.
  Com -- fort those who sit in dark -- ness,
  mourn -- ing 'neath their sor -- rows' load.

  Speak un -- to Je -- ru -- sa -- lem
  of the peace that waits for them.
  Tell of all the sins I cov -- er,
  and that war -- fare now is o -- ver.
}
verseB = \lyricmode {
  Hark, the voice of one who's cry -- ing
  in the des -- ert far and near,
  bid -- ding all to full re -- pen -- tance
  since the king -- dom now is here.

  O that warn -- ing cry o -- bey!
  Now pre -- pare for God a way.
  Let the val -- leys rise to meet God
  and the hills bow down to greet God.
}
verseC = \lyricmode {
  O make straight what long was crook -- ed,
  make the rough -- er plac -- es plain.
  Let your hearts be true and hum -- ble,
  as be -- fits God's ho -- ly reign.

  For the glo -- ry of the Lord
  now o'er earth is shed a -- broad.
  And all flesh shall see the to -- ken
  that God's word is nev -- er bro -- ken.
}

all_verses = <<
  \new NullVoice = "soprano" \soprano
  % Add what you need. If more than 4, fill in the second argument as shown in 5 and 6
  \new Lyrics  \lyricsto soprano  { \globalLyrics "1" "" \verseA }
  \new Lyrics  \lyricsto soprano  { \globalLyrics "2" "" \verseB }
  \new Lyrics  \lyricsto soprano  { \globalLyrics "3" "" \verseC }
>>

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
    \tempo  2 = 90
  }
}
