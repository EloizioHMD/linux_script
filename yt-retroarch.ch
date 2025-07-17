#!/bin/bash

# YouTube to RetroArch Video Downloader
# Autor: EloizioHMD
# Descrição: Baixa vídeos do YouTube em formato MKV otimizado para RetroArch com Vídeo e Áudio automátizado.
# Script em bash baseado na aplicação de python yt-dlp https://github.com/yt-dlp/yt-dlp


# Verifica argumentos
if [ $# -eq 0 ]; then
    echo "Erro: URL do YouTube não fornecida."
    echo "Uso: $0 <URL> [output_directory]"
    exit 1
fi

URL="$1"
OUTPUT_DIR="${2:-$HOME/Vídeos}"
MAX_HEIGHT=480

# Obtém o título seguro para nome de arquivo
SAFE_TITLE=$(./yt-dlp --get-title "$URL" | 
             sed -e 's/[\\/*?$!#&%|{}\[\]]/_/g' \
                 -e 's/[:<>]/_/g' \
                 -e 's/^[[:space:]]*//' \
                 -e 's/[[:space:]]*$//' |
             tr -s '_' |
             head -c 200)

# Cria diretório de saída
mkdir -p "$OUTPUT_DIR"

# Parâmetros de codificação
VIDEO_ARGS=(
    -c:v libx264
    -profile:v baseline
    -level 3.0
    -pix_fmt yuv420p
    -movflags +faststart
    -tune film
    -crf 23
    -maxrate 1500k
    -bufsize 3000k
)

AUDIO_ARGS=(
    -c:a aac
    -b:a 128k
    -ac 2
)

# Executa o download e conversão
./yt-dlp -f "bestvideo[height<=$MAX_HEIGHT][ext!=webm]+bestaudio/best" \
    --no-playlist \
    --merge-output-format mp4 \
    --recode-video mp4 \
    --postprocessor-args "ffmpeg_i1: -vf 'scale=trunc(oh*a/2)*2:min(ih\,$MAX_HEIGHT)' ${VIDEO_ARGS[*]} ${AUDIO_ARGS[*]}" \
    -o "$OUTPUT_DIR/$SAFE_TITLE.mp4" \
    --console-title \
    --no-simulate \
    "$URL"

# Verifica se a conversão foi bem sucedida
if [ $? -eq 0 ]; then
    echo -e "\nConversão concluída com sucesso!"
    echo "Vídeo salvo em: $OUTPUT_DIR/$SAFE_TITLE.mp4"
else
    echo -e "\nErro durante o processo de conversão!"
    exit 1
fi
