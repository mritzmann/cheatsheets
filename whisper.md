# OpenAI Whisper

Usage with Docker:

```shell
docker run --rm -it --volume $HOME/data/:/mnt debian:latest
apt-get update
apt-get install --yes python3 python3-pip ffmpeg git
pip install --break-system-packages git+https://github.com/openai/whisper.git
./usr/local/bin/whisper /mnt/media.mp3 --model medium --language German
```
