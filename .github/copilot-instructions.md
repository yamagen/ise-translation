説明コメント行は、日本語で書く。
json で書く。
ja は日本語。
en は英語。
-natural は自然なことばにする。
translation-ja は厳格な逐語訳による日本語に翻訳する。
translation-en は厳格な逐語訳による英語に翻訳する。
translation-ja-natural は日本語に翻訳して自然な話しことばにする。
translation-en-natural は英語に翻訳して自然な話しことばにする。
translation-en-natural-BJ は英語に翻訳してブリジットジョーンズの日記のように翻訳する。

# Copilot Instructions for Tosa Translation Project

This repository follows the **Leipzig Glossing Rules (LGR)** for classical Japanese analysis.
Below are the standardized abbreviations used in gloss annotations (`phrase-gloss` blocks).

## LGR Abbreviation Table

```json
{
  "abbreviations": {
    "ABL": "ablative particle (格助詞「より」)",
    "ACC": "accusative particle (格助詞「を」)",
    "ADD": "additive particle (副助詞「も」＝also, too)",
    "ADNOM": "adnominal form (連体詞)",
    "ADV": "adverbial form (連用形)",
    "ATTR": "attributive form (連体形)",
    "CAUS": "causative (使役)",
    "COMP": "complementizer (接続助詞「と」「に」など)",
    "COND": "conditional (接続助詞「ば」)",
    "CONJ": "conjunctive particle (接続助詞「て」「ば」など)",
    "COP": "copula (断定)",
    "DAT": "dative particle (格助詞「に」「へ」)",
    "EMPH": "emphatic particle (終助詞「ぞ」「な」「よ」)",
    "EVID": "evidential (伝聞・推定)",
    "EXCL": "exclamative particle (終助詞「かな」「ぞや」など)",
    "FOC": "focus marker (係助詞「ぞ」「こそ」など)",
    "GEN": "genitive particle (格助詞「の」)",
    "HON": "honorific (尊敬語)",
    "HUM": "humble (謙譲語)",
    "IMP": "imperative (命令形)",
    "INST": "instrumental particle (格助詞「にて」「をもて」)",
    "INTEND": "intendive (意志・勧誘)",
    "IRR": "irrealis stem (未然形)",
    "LIM": "limiter particle (副助詞「ばかり」「のみ」＝only, just)",
    "LOC": "locative particle (格助詞「に」「へ」)",
    "NEG": "negative (否定)",
    "NOUN": "nominal base (名詞)",
    "PASS": "passive (受身)",
    "PERF": "perfect/resultative (完了)",
    "POT": "potential (可能)",
    "PROG": "progressive/continuative (進行・存続)",
    "Q": "interrogative particle (終助詞「か」「や」)",
    "QUOT": "quotative (引用助詞「と」)",
    "REALIS": "realis stem (確定形態)",
    "TERM": "terminal form (終止形)",
    "TOP": "topic marker (係助詞「は」)",
  }
}
```

Notes

    Always use uppercase for grammatical glosses (e.g., PERF, FOC, CAUS).
    When combining semantic and morphological tags, use a dot:
    e.g., CAUS.REALIS, come.ADV, PERF.ATTR.

    Hyphens (-) connect morphemes in the gloss line:
    e.g., that name etc.-FOC-Q.

📗 Verb Conjugation Labels (Classical Japanese)

These labels indicate verb class and conjugation form.
They are used in glosses for morphological annotation and to help Copilot maintain consistent tagging.

| Label     | Meaning                 | Example            |
| --------- | ----------------------- | ------------------ |
| **YODAN** | Quadrigrade / 四段活用      | 書く kak(u)          |
| **KAMI**  | Upper Monograde / 上一段活用 | 見る mi-ru           |
| **SHIMO** | Lower Monograde / 下一段活用 | 蹴る ke-ru           |
| **KAHEN** | Irregular K-verb / カ変活用 | 来（く）               |
| **SAHEN** | Irregular S-verb / サ変活用 | す                  |
| **NAHEN** | Irregular N-verb / ナ変活用 | 死ぬ、往ぬ              |
| **RAHEN** | Irregular R-verb / ラ変活用 | あり、をり、はべり、いまそかり    |
| **BAHEN** | Irregular B-verb (rare) | 侍べり（はべり）などに見られる派生形 |


Verb Form (活用形)

| Label      | Meaning               | Example | 備考         |
| ---------- | --------------------- | ------- | ---------- |
| **IRR**    | irrealis (未然形)        | 行か–     | 否定・推量に接続   |
| **REALIS** | realis (連用形)          | 行き–     | 接続・補助動詞に接続 |
| **ATTR**   | attributive (連体形)     | 行く      | 名詞修飾       |
| **TERM**   | terminal (終止形)        | 行く      | 文末         |
| **COND**   | conditional (已然形・仮定形) | 行け–     | 「ば」「ども」に接続 |
| **IMP**    | imperative (命令形)      | 行け      | 命令表現       |

Adjective Form (形容詞・形容動詞活用形)

| Label     | Meaning  | Example           |
| --------- | -------- | ----------------- |
| **KU**    | ク活用形容詞   | 高し taka-shi       |
| **SHIKU** | シク活用形容詞  | 美し utsuku-shi     |
| **NARI**  | ナリ活用形容動詞 | 静かなり shizuka-nari |
| **TARI**  | タリ活用形容動詞 | 堂々たり dou-dou-tari |


📒 Nominal and Derived Forms（名詞・派生語）

| Label        | Meaning                        | Example           | 備考         |
| ------------ | ------------------------------ | ----------------- | ---------- |
| **NOUN**     | nominal base (名詞)              | 人 hito            | —          |
| **ADNOM**    | adnominal form (連体詞)           | この kono           | 名詞を修飾      |
| **ADV.FORM** | adverbial noun/adjective (副詞化) | 早く hayaku         | 「く」「に」などの形 |
| **COP**      | copula (断定助動詞「なり」「たり」)         | 静かなり shizuka-nari | 形容動詞的用法含む  |

📙 Usage Examples
```

{
  "phrase": "その名などぞや、",
  "gloss": "that name etc.-FOC-Q",
  "words": [
    { "word": "その", "gloss": "that" },
    { "word": "名", "gloss": "name" },
    { "word": "など", "gloss": "etc." },
    { "word": "ぞ", "gloss": "FOC" },
    { "word": "や", "gloss": "Q" }
  ]
}

{
  "phrase": "けふわりごもたせてきたる人、",
  "gloss": "today wrapping.cloth-carry-CAUS.REALIS CONJ come.PERF.ATTR person",
  "words": [
    { "word": "けふ", "gloss": "today" },
    { "word": "わりご", "gloss": "wrapping.cloth" },
    { "word": "もた", "gloss": "carry.IRR" },
    { "word": "せ", "gloss": "CAUS.REALIS" },
    { "word": "て", "gloss": "CONJ" },
    { "word": "き", "gloss": "come.ADV" },
    { "word": "たる", "gloss": "PERF.ATTR" },
    { "word": "人", "gloss": "person" }
  ]
}
```



📙 Usage Examples

{
  "phrase": "人のありさま見て、",
  "gloss": "person GEN state see-REALIS CONJ",
  "words": [
    { "word": "人", "gloss": "person" },
    { "word": "の", "gloss": "GEN" },
    { "word": "ありさま", "gloss": "state, manner" },
    { "word": "見", "gloss": "see" },
    { "word": "て", "gloss": "CONJ" }
  ]
}

{
  "phrase": "けふわりごもたせてきたる人、",
  "gloss": "today wrapping.cloth-carry-CAUS.REALIS CONJ come.PERF.ATTR person",
  "words": [
    { "word": "けふ", "gloss": "today" },
    { "word": "わりご", "gloss": "wrapping.cloth" },
    { "word": "もた", "gloss": "carry.IRR" },
    { "word": "せ", "gloss": "CAUS.REALIS" },
    { "word": "て", "gloss": "CONJ" },
    { "word": "き", "gloss": "come.ADV" },
    { "word": "たる", "gloss": "PERF.ATTR" },
    { "word": "人", "gloss": "person" }
  ]
}


📗 Notes for Copilot

- Use uppercase for grammatical glosses/abbreviations  (e.g., PERF, FOC, CAUS).
- Use lowercase for lexical/semantic  glosses (e.g., carry, come, person).
- Combine morphological and functional glosses with a dot (CAUS.REALIS, come.ADV, etc.).

- Connect morphemes in the gloss line with a hyphen (name-FOC-Q).
- Always preserve the original word order of the source text.
- For verbs and adjectives, optionally tag class information (e.g., "gloss": "write.YODAN.REALIS", "gloss": "taka.KU.ATTR").
- This file serves as the Copilot knowledge base and glossing guideline for the Tosa Translation Project.

---

## ✅ この構成の利点

- Copilot が gloss 用語と活用形の両方を正しく学習。  
- 他の gloss JSON（phrase-gloss, abbreviations）との統合が容易。  
- 古典日本語全般（『土佐日記』『伊勢物語』『更級日記』など）に汎用的に利用可能。  

---

次に、希望があればこの仕様に基づいた **自動 gloss validator（JSON 構文＋略号チェック用 Python スクリプト）** もご用意できます。  
作成しておきましょうか？


