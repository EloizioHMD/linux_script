#!/bin/bash

# YouTube to RetroArch Video Downloader
# Autor: EloizioHMD
# Descrição: Baixa vídeos do YouTube em formato MKV otimizado para RetroArch com Vídeo e Áudio automátizado.
# Script em bash baseado na aplicação de python yt-dlp https://github.com/yt-dlp/yt-dlp


# Verifica se foi passada uma URL
if [ $# -eq 0 ]; then
    echo "Erro: Por favor, forneça a URL do vídeo do YouTube."
    echo "Uso: $0 <URL>"
    exit 1
fi

URL="$1"
OUTPUT_DIR="${HOME}/Vídeos/RetroArch"
MAX_HEIGHT=480
MAX_FPS=30

# Cria diretório de saída se necessário
mkdir -p "$OUTPUT_DIR"

# Mostra spinner simples durante o processamento
show_spinner() {
    local pid=$1
    local spin='-\|/'
    local i=0
    while kill -0 "$pid" 2>/dev/null; do
        i=$(( (i+1) %4 ))
        printf "\rProcessando... ${spin:$i:1}"
        sleep 0.1
    done
    printf "\r               \r" # Limpa a linha
}

# Baixa e converte o vídeo
(
    ./yt-dlp -f "bestvideo[height<=$MAX_HEIGHT][fps<=$MAX_FPS]+bestaudio" \
        --merge-output-format mkv \
        --recode-video mkv \
        --postprocessor-args "-c:v libx264 \
                              -profile:v baseline \
                              -level 3.0 \
                              -pix_fmt yuv420p \
                              -preset fast \
                              -r $MAX_FPS \
                              -c:a copy" \
        -o "${OUTPUT_DIR}/%(title)s.%(ext)s" \
        "$URL"
) &> /dev/null & # Executa em segundo plano e silencia a saída

# Obtém o PID do processo
PID=$!

# Mostra spinner enquanto o processo estiver ativo
show_spinner $PID

# Aguarda conclusão
wait $PID

echo "Download concluído! O vídeo está em:"
echo "$OUTPUT_DIR"
