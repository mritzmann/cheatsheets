# AI

AI, LLM, KI, etc.

## Ollama

```shell
# pull model
ollama pull <model>

# running model
ollama ps

# start claude code
ollama launch claude --model qwen3.6:35b
ollama launch claude --model qwen3.6:35b-a3b-coding-mxfp8
```

## Model Naming

```
qwen3.6:35b-a3b-coding-mxfp8
  ▲      ▲   ▲    ▲     ▲
  │      │   │    │     │
  │      │   │    │    quantized format
  │      │   │   specialization
  │      │  3 billion paramets activ
  │     35 billion parameters
family and version
```
