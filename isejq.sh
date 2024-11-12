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
      + (if ."translation-ja-natural" != null then {"translation-ja-natural": ."translation-ja-natural"} else {} end)
      + (if ."translation-en" != null then {"translation-en": ."translation-en"} else {} end)
      + (if ."translation-en-natural" != null then {"translation-en-natural": ."translation-en-natural"} else {} end)
    ]
  }
]' $1
