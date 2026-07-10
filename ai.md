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
ollama launch claude --model qwen3.6:35b
ollama launch claude --model qwen3.6:35b-a3b-coding-mxfp8
```
