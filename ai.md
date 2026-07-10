# AI

AI, LLM, KI, etc.

## Local Model Vendors

| Name       | Vendor           |
| :--------- | :--------------- |
| `glm`      | 🇨🇳 Z.ai          |
| `qwen`     | 🇨🇳 Alibaba Cloud |
| `kiwi`     | 🇨🇳 Moonshot AI   |
| `deepseek` | 🇨🇳 DeepSeek      |

* Local: https://ollama.com/search
* Cloud: https://openrouter.ai/models
* Cloud: https://models.dev
* Cloud: https://openwebui.com/models

## Model Naming

```
qwen3.6:35b-a3b-coding-mxfp8
  ▲      ▲   ▲   ▲     ▲
  │      │   │   │     │
  │      │   │   │    quantized format
  │      │   │  specialization
  │      │  3 billion paramets activ
  │     35 billion parameters
family and version
```

## Ollama

```shell
# start server
ollama serve

# pull model
ollama pull <model>

# list models
ollama ls

# list running models
ollama ps

# start claude code
ollama launch claude --model qwen3.6:27b
ollama launch claude --model qwen3.6:35b
ollama launch claude --model qwen3.6:35b-a3b-coding-mxfp8
```

## Benchmark

> Program a game: Tic-Tac-Toe. The game should run in the browser. Create only a single index.html file. Create no other files. 

| Model | Time | Result |
| ----- | ---- | ------ |
| Claude Online | ~30s | Top |
| `qwen3.6:35b-a3b-coding-mxfp8` | ~1m 30s | Top - 1 |
| `qwen3.6:35b` | not possible | -- |
| `qwen3.6:27b` | not possible | -- |

> Falls ich hinter der Login Maske einen Hintergrund erstellen möchte, wo müsste ich das einbauen? Bitte liste die files auf welche bearbeitet werden müssten. Bearbeite noch nichts.

| Model | Time | Result |
| ----- | ---- | ------ |
| Claude Online | ~1m | Top |
| `qwen3.6:35b-a3b-coding-mxfp8` | Nach ~5min abgebrochen |
