#!/bin/bash
jq '[.[] | select(.paragraph != null) |
  {
    dan: .dan,
    title: .title,
    romaji: .romaji,
    paragraph: [
      .paragraph[] |
      {date: .date, id: .id}
      + (if .text != null then {text: .text} else {} end)
      + (if .poem != null then {poem: .poem} else {} end)
      + (if .kana != null then {kana: .kana} else {} end)
      + (if ."honkoku" != null then {"honkoku": ."honkoku"} else {} end)
      + (if ."translation-ja" != null then {"translation-ja": ."translation-ja"} else {} end)
      + (if ."translation-en" != null then {"translation-en": ."translation-en"} else {} end)
      + (if ."phrase-gloss" != null then {"phrase-gloss": ."phrase-gloss"} else {} end)
      + (if ."gloss-notes-ja" != null then {"gloss-notes-ja": ."gloss-notes-ja"} else {} end)
      + (if ."gloss-notes-en" != null then {"gloss-notes-en": ."gloss-notes-en"} else {} end)
      + (if ."abbreviations" != null then {"abbreviations": ."abbreviations"} else {} end)
      + (if ."translation-ja-natural" != null then {"translation-ja-natural": ."translation-ja-natural"} else {} end)
      + (if ."translation-en-natural" != null then {"translation-en-natural": ."translation-en-natural"} else {} end)
      + (if ."notes-ja" != null then {"notes-ja": ."notes-ja"} else {} end)
      + (if ."notes-en" != null then {"notes-en": ."notes-en"} else {} end)
#      + (if ."commentary-ja" != null then {"commentary-ja": ."commentary-ja"} else {} end)
#      + (if ."commentary-en" != null then {"commentary-en": ."commentary-en"} else {} end)
    ]
  }
]' $1
