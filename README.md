# **ise-translation**

## The Tales of Ise translation dataset

[![DOI](https://zenodo.org/badge/878207767.svg)](https://doi.org/10.5281/zenodo.13994482)
![Static Badge](https://img.shields.io/badge/json-passing-brightgreen)
![Static Badge](https://img.shields.io/badge/github-repository-blue?logo=github)

<!--
これは伊勢物語(作者不詳、成立年代不詳)の現代語訳、英語訳のデータセットです。
現代語訳および英語訳は、山元啓史によるものです。
-->

This is a linguistically annotated dataset of "The Tales of Ise" (author unknown, date of completion unknown).
It provides three-layer translations (literal, natural, and reading)
in both modern Japanese and English, together with word-level glosses and grammatical annotations.
The translations and linguistic annotations are by Hilofumi Yamamoto.

### **Introduction**

<!--
伊勢物語は、日本の最古の歌物語とされる作品です。
伊勢物語 新編日本古典文学全集12 小学館 福井貞助 校注を参考にした。
現代語訳と英訳は山元啓史が行った。
翻刻は、 中川聡氏</a>による翻刻を利用した。
-->

"The Tales of Ise" is considered to be the oldest Japanese poetic narrative.
The text is based on the edition of "The Tales of Ise" in the New Edition of Japanese Classical Literature, Volume 12,
Shogakukan, edited by Teisuke Fukui.
The translations and linguistic annotations were prepared by Hilofumi Yamamoto.
The transcription was provided by [Satoshi Nakagawa](https://yatanavi.org/text/ise/index.html).

### **Data format**

The dataset is structured in JSON format with the following fields.

| Tag                      | Description                                                          |
| ------------------------ | -------------------------------------------------------------------- |
| `dan`                    | The section number in The Tales of Ise.                              |
| `title`                  | The title of the section.                                            |
| `romaji`                 | The romanized representation of the section title.                   |
| `paragraph`              | An array of textual units, including prose and poems.                |
| `date`                   | An array of dates recording the revision history in YYYYMMDD format. |
| `id`                     | A unique identifier for each textual unit.                           |
| `text`                   | The original prose text.                                             |
| `poem`                   | The original poem, with its lines separated by slashes.              |
| `kana`                   | The kana representation of the original text or poem.                |
| `honkoku`                | The transcription provided by Satoshi Nakagawa.                      |
| `translation-ja-literal` | A literal translation into modern Japanese.                          |
| `translation-ja-natural` | A natural translation into modern Japanese.                          |
| `translation-ja-reading` | A Japanese translation intended for continuous reading.              |
| `translation-en-literal` | A literal English translation.                                       |
| `translation-en-natural` | A natural English translation.                                       |
| `translation-en-reading` | An English translation intended for continuous reading.              |
| `word-gloss`             | An array of word-level linguistic annotations.                       |
| `abbreviations`          | A mapping of linguistic abbreviations to their definitions.          |

#### **Three-layer translation**

The dataset provides three layers of translation in both Japanese and English.

| Layer     | Description                                                                                             |
| --------- | ------------------------------------------------------------------------------------------------------- |
| `literal` | Preserves the lexical and grammatical features of the original text as closely as possible.             |
| `natural` | Expresses the original meaning in natural modern Japanese or English.                                   |
| `reading` | Presents the text in a form suitable for continuous reading, taking the narrative context into account. |

#### **Word-level glosses**

Each entry in `word-gloss` contains the following fields.

| Tag            | Description                                               |
| -------------- | --------------------------------------------------------- |
| `word`         | The surface form of the word in the original text.        |
| `lemma`        | The dictionary form of the word.                          |
| `kana`         | The kana representation of the surface form.              |
| `lemma-kana`   | The kana representation of the lemma.                     |
| `romaji`       | The romanized representation of the surface form.         |
| `lemma-romaji` | The romanized representation of the lemma.                |
| `gloss`        | The English lexical gloss and grammatical information.    |
| `pos`          | The part-of-speech tag.                                   |
| `ku`           | The line number within a waka poem (1–5), or 0 for prose. |

#### **Abbreviations**

The `abbreviations` field provides definitions of linguistic
abbreviations associated with each textual unit.

For example:

```json
{
  "ADV": "adverbial form",
  "ATTR": "attributive form",
  "AUX": "auxiliary",
  "EMPH": "emphatic particle",
  "N": "noun",
  "P": "particle",
  "PERF": "perfective aspect",
  "PST": "past",
  "V": "verb"
}
```

### **To process the data**

The following Bash script uses `jq` to extract the relevant
fields from the JSON dataset, omitting null-valued fields.

```bash
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
        "date": [20240516, 20241017, 20241112, 20250512, 20260514],
        "id": 3,
        "text": "この男かいまみてけり。",
        "kana": "このをとこかいまみてけり。",
        "honkoku": "このおとこかいまみて/けり",
        "translation-ja-literal": "この男は、すきまから見てしまった。",
        "translation-ja-natural": "この男は、すきまからのぞき見してしまった。",
        "translation-ja-reading": "この男は、すきまからのぞき見してしまった。",
        "translation-en-literal": "This man saw through a gap.",
        "translation-en-natural": "This man caught a glimpse through a gap.",
        "translation-en-reading": "This man caught a glimpse through a gap.",
        "word-gloss": [
          { "word": "この", "lemma": "この", "kana": "この", "lemma-kana": "この", "romaji": "kono", "lemma-romaji": "kono", "gloss": "this", "pos": "DET", "ku": 0 },
          { "word": "男", "lemma": "男", "kana": "をとこ", "lemma-kana": "をとこ", "romaji": "wotoko", "lemma-romaji": "wotoko", "gloss": "man", "pos": "N", "ku": 0 },
          { "word": "かいま", "lemma": "垣間", "kana": "かいま", "lemma-kana": "かいま", "romaji": "kaima", "lemma-romaji": "kaima", "gloss": "gap", "pos": "N", "ku": 0 },
          { "word": "み", "lemma": "見る", "kana": "み", "lemma-kana": "みる", "romaji": "mi", "lemma-romaji": "miru", "gloss": "see.ADV", "pos": "V", "ku": 0 },
          { "word": "て", "lemma": "て", "kana": "て", "lemma-kana": "て", "romaji": "te", "lemma-romaji": "te", "gloss": "CONJ", "pos": "P", "ku": 0 },
          { "word": "けり", "lemma": "けり", "kana": "けり", "lemma-kana": "けり", "romaji": "keri", "lemma-romaji": "keri", "gloss": "PST", "pos": "AUX", "ku": 0 }
        ],
        "abbreviations": {
          "ADV": "adverbial form",
          "AUX": "auxiliary",
          "CONJ": "conjunctive particle",
          "DET": "determiner",
          "N": "noun",
          "P": "particle",
          "PST": "past",
          "V": "verb"
        }
      }
    ]
  }
]
```

### **License**

The source code for this project is released under the Apache License 2.0.
The dataset is released under the Creative Commons Attribution-ShareAlike 4.0 International License (CC BY-SA 4.0).

### **Authors and Acknowledgments**

This dataset was created by **[Hilofumi Yamamoto](https://github.com/yamagen)**.

Additional contributors include:

- **[Bor Hodošček](https://github.com/borh)**
- **[Xudong Chen](https://github.com/idiig)**

Thank you to all the contributors for their hard work and dedication to the project.
