# Modern (Deep) Chinese NLP Models

My humble contribution to the democratization of the Chinese NLP technology (currently based on Fast.ai library).

[**WIP**] This project is still in a very early development stage. Things might change dramatically in the near future.

## Development Notes

This codebase is under major overhaul. Previously it heavily depended on fast.ai v0.7 which also does a lot of things besides NLP. Now fast.ai v0.7 is replaced with a lightweight general [PyTorch helper bot](https://github.com/ceshine/pytorch_helper_bot/) and an NLP package *dekisugi* in this library. I'm considering adding some dependencies to other well-maintained and modularized librarires (e.g. torchtext, AllenNLP, etc.) to reduce future maintenence workloads.

Currently only LSTM models are both migrated and tested. QRNN models are migrated but not tested. Transformer models are not migrated.

The old fast.ai notebooks and model code can be found under `legacy` folder. This repo also has a branch [*fastai_based*](https://github.com/ceshine/modern_chinese_nlp/tree/fastai_based) that still uses fast.ai v0.7.

## Blog post(s)

Using codebase based on fast.ai v0.7:

1. [[Preview] Developing Modern Chinese NLP Models](https://medium.com/the-artificial-impostor/preview-developing-modern-chinese-nlp-models-60d4774ebfa7) - Briefly described dataset preparation processes and some preliminary results.
2. [[NLP] Four Ways to Tokenize Chinese Documents](https://medium.com/the-artificial-impostor/nlp-four-ways-to-tokenize-chinese-documents-f349eb6ba3c3)

Using *dekisugi*:

1. [[NLP] Using SentencePiece without Pretokenization](https://medium.com/the-artificial-impostor/nlp-using-sentencepiece-without-pretokenization-3f2c8786cd95)

## Environment

Pre-built docker image: [docker pull ceshine/pytorch-fastai](https://hub.docker.com/r/ceshine/pytorch-fastai/). Or build the image yourself with the accompanied Dockerfile.

## Available models

### Sub-Word-Level Models

* Language Model (Wikipedia Articles): next character prediction.
* Sentiment Analysis (Douban Movie Reviews): movie rating prediction.
