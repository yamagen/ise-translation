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
      + (if ."translation-ja-literal" != null then {"translation-ja-literal": ."translation-ja-literal"} else {} end)
      + (if ."translation-ja-natural" != null then {"translation-ja-natural": ."translation-ja-natural"} else {} end)
      + (if ."translation-ja-reading" != null then {"translation-ja-reading": ."translation-ja-reading"} else {} end)
      + (if ."translation-en-literal" != null then {"translation-en-literal": ."translation-en-literal"} else {} end)
      + (if ."translation-en-natural" != null then {"translation-en-natural": ."translation-en-natural"} else {} end)
      + (if ."translation-en-reading" != null then {"translation-en-reading": ."translation-en-reading"} else {} end)
      + (if ."word-gloss" != null then {"word-gloss": ."word-gloss"} else {} end)
      + (if ."abbreviations" != null then {"abbreviations": ."abbreviations"} else {} end)
    ]
  }
]' "$1"
