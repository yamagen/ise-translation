# **ise-translation**

## The Tales of Ise translation dataset

[![DOI](https://zenodo.org/badge/878207767.svg)](https://doi.org/10.5281/zenodo.13994482)
![Static Badge](https://img.shields.io/badge/json-passing-brightgreen)
![Static Badge](https://img.shields.io/badge/github-repository-blue?logo=github)

<!--
これは伊勢物語(作者不詳、成立年代不詳)の現代語訳、英語訳のデータセットです。
現代語訳および英語訳は、山元啓史によるものです。
-->

This is a dataset of contemporary translation and English translation of "The Tales of Ise" (author unknown, date of completion unknown).
The contemporary translation and English translation are by Hilofumi Yamamoto.

### **Introduction**

<!--
伊勢物語は、日本の最古の歌物語とされる作品です。
伊勢物語 新編日本古典文学全集12 小学館 福井貞助 校注を参考にした。
現代語訳と英訳は山元啓史が行った。
翻刻は、 中川聡氏</a>による翻刻を利用した。
-->

"The Tales of Ise" is considered to be the oldest Japanese poetic narrative.
The text is based on the "The Tales of Ise" in the New Edition of Japanese Classical Literature, Volume 12, Shogakukan, edited by Teisuke Fukui.
The contemporary translation and English translation were done by Hilofumi Yamamoto.
The transcription was done by [Satoshi Nakagawa](https://yatanavi.org/text/ise/index.html#google_vignette).

### **Data format**

Tag sets are written in json format shown as the following:

| Tag                          | Description                                                           |
| ---------------------------- | --------------------------------------------------------------------- |
| **"dan"**                    | The stage number in the text or document.                             |
| **"title"**                  | The title of the stage or section.                                    |
| **"romaji"**                 | The romanized representation of the title.                            |
| **"paragraph"**              | A block of text or a sentence from a poem.                            |
| **"date"**                   | The date when the text or revision was recorded.                      |
| **"id"**                     | A unique identifier for the text or section.                          |
| **"text"**                   | The original text of the sentence.                                    |
| **"poem"**                   | A poem sentence extracted from the text.                              |
| **"kana"**                   | The kana notation of the text or poem sentence.                       |
| **"honkoku"**                | The transcription provided by Satoshi Nakagawa.                       |
| **"translation-ja"**         | A literal modern Japanese translation, faithful to the original text. |
| **"translation-en"**         | A literal English translation, faithful to the original text.         |
| **"translation-ja-natural"** | A modern and natural Japanese translation for contemporary readers.   |
| **"translation-en-natural"** | A natural English translation, adapted for readability and flow.      |

### **To process the data**

<!--
このjsonファイルは、以下のコマンド, jq で操作できる。
-->

This json file can be manipulated with the following command with jq:

```bash
$ jq '[.[] | select(.paragraph != null) |
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
```

### **Example**

```json
[
  {
    "dan": 1,
    "title": "初冠",
    "romaji": "uikouburi",
    "paragraph": [
      {
        "date": "20240516,20241012",
        "id": 1,
        "text": "むかし、男、初冠して、平城の京春日の里に、しるよしして、狩にいにけり。",
        "kana": "むかし、をとこ、うゐかうぶりして、ならのみやこかすがのさとに、しるよしして、かりにいにけり。",
        "honkoku": "むかしおとこうゐかうふりしてならの/京かすかの里にしるよししてかりに/いにけり",
        "translation-ja": "昔、ある男が初めて冠をかぶり、縁あって、奈良の京、春日の里に狩りに行った。",
        "translation-ja-natural": "昔、ある男が元服を迎え、縁あって奈良の都、春日の里へ狩りに出かけました。",
        "translation-en": "Once upon a time, a man, newly crowned, went hunting in the village of Kasuga in Nara.",
        "translation-en-natural": "Once upon a time, a young man, having just come of age, went hunting in the village of Kasuga in Nara
      },
      {
        "date": "20240516,20241017",
        "id": 2,
        "text": "その里に、いとなまめいたる女はらからすみけり。",
        "kana": "そのさとに、いとなまめいたるをんなはらからすみけり。",
        "honkoku": "そのさとにいとなまめいたる女/はらからすみけり",
        "translation-ja": "その里に、非常に美しい姉妹が住んでいた。",
        "translation-ja-natural": "その里には、とても美しい姉妹が住んでいました。",
        "translation-en": "In that village, there lived two very beautiful sisters.",
        "translation-en-natural": "In that village, there were two sisters who were truly beautiful."
      }
    ]
  }
]
```

### **License**

The source codes for this project are released under the Apache 2.0 License.
The dataset of this project is released under the Creative Commons 4.0 International By SA license.

### **Authors and Acknowledgment**

was created by **[Hilofumi Yamamoto](https://github.com/yamagen)**.

Additional contributors include:

- **[Bor Hodošček](https://github.com/borh)**
- **[Xudong Chen](https://github.com/idiig)**

Thank you to all the contributors for their hard work and dedication to the project.
