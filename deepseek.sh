#!/usr/bin/env bash

PROMPT="$*"
ollama run deepseek-r1:7b "$PROMPT"
