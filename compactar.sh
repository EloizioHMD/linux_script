#!/bin/bash
total_arquivos=$(find . -maxdepth 1 -type f | wc -l)
contador=0

for arquivo in *; do
    if [ -f "$arquivo" ]; then
        contador=$((contador+1))
        echo "Compactando ($contador/$total_arquivos): $arquivo"
        zip -q -9 -j "${arquivo}.zip" "$arquivo"
    fi
done

echo "Concluído: $contador arquivos compactados."
