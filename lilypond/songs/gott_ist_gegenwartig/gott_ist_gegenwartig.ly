\version "2.20.0"
#(ly:set-option 'relative-includes #t)
\language "english"
\include "../../lib/clairnote.ly"
\include "../../lib/hymn_common.ly"
\include "../../shared_tunes/wunderbarer_konig.ly"


%% See docs/all_tags.txt for the full list available
tags = "christian 4part acapella 3verse musicbyother textbyother"
\header {
  title = \titleText "Gott ist gegenwärtig"
  subtitle = \smallText "See also in English: God is here among us"
  composer = \composer
  %arranger = \smallText "Arranged by (optional), year"
  poet = \smallText "Text: Gerhard Tersteegen, 1729"
  meter = \meter
  copyright = \public_domain_notice "Kenan Schaefkofer"
  tagline = \tagline
}

%% See included shared_tune for the notes/chords

%% LYRICS
verseA = \lyricmode {
  Gott ist ge -- gen -- wär -- tig. Las -- set uns an -- be -- ten und in Ehr -- furcht vor ihn tre -- ten.
  Gott ist in der Mit -- te. Al -- les in uns schwei -- ge und sich in -- nigst vor ihm beu -- ge.
  Wer ihn kennt, wer ihn nennt, schlag die Au -- gen nie -- der; kommt, er -- gebt euch wie -- der.
}
verseB = \lyricmode {
  Gott ist ge -- gen -- wär -- tig, dem die Che -- ru -- bi -- nen Tag und Nacht ge -- bü -- cket die -- nen.
  ''Hei -- lig, hei -- lig, hei -- lig!'' sin -- gen ihm zur Eh -- re al -- ler En -- gel ho -- he Chö -- re.
  Herr, ver -- nimm uns -- re Stimm, da auch wir Ge -- rin -- gen uns -- re Op -- fer brin -- gen.
}
verseC = \lyricmode {
  Herr, komm in mir woh -- nen; lass mein Herz auf ER -- den dir ein Hei -- lig -- tum noch wer -- den.
  Komm, du nahes Wesen; dich in mir ver -- kläre, dass ich dich stets lieb und ehre.
  Wo ich geh, sitz und steh, lass mich dich er -- blick -- en und vor dir mich bü -- cken.
}
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
    \tempo  4 = 120
  }
}