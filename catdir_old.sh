#!/bin/bash

# Verificar si se han proporcionado los argumentos necesarios
if [ $# -lt 2 ] || [ $# -gt 3 ]; then
    echo "Uso: $0 directorio_entrada archivo_salida [patrón_regex]"
    echo "Ejemplos:"
    echo "  $0 /ruta/a/mis/archivos /ruta/archivo_salida.txt                # Todos los archivos"
    echo "  $0 /ruta/a/mis/archivos /ruta/archivo_salida.txt '\.py$'        # Solo archivos .py"
    echo "  $0 /ruta/a/mis/archivos /ruta/archivo_salida.txt 'config.*\.js' # Archivos config*.js"
    exit 1
fi

# Asignar los argumentos a variables
INPUT_DIR="$1"
OUTPUT_FILE="$2"
REGEX_PATTERN="${3:-.*}"  # Si no se proporciona, usa '.*' para coincidir con todo

# Verificar si el directorio de entrada existe
if [ ! -d "$INPUT_DIR" ]; then
    echo "Error: El directorio '$INPUT_DIR' no existe."
    exit 1
fi

# Limpiar el archivo de salida si ya existe
> "$OUTPUT_FILE"

# Variable para contar archivos procesados
PROCESSED_FILES=0

# Procesar cada archivo en el directorio que coincida con el patrón regex
for file in "$INPUT_DIR"/*; do
    if [ -f "$file" ] && [[ $(basename "$file") =~ $REGEX_PATTERN ]]; then
        echo "############# File $INPUT_DIR/$(basename "$file") ############" >> "$OUTPUT_FILE"
        cat "$file" >> "$OUTPUT_FILE"
        echo "" >> "$OUTPUT_FILE"  # Línea en blanco para mejor separación
        ((PROCESSED_FILES++))
    fi
done

# Verificar si se procesaron archivos
if [ $PROCESSED_FILES -eq 0 ]; then
    echo "Advertencia: No se encontraron archivos que coincidan con el patrón '$REGEX_PATTERN' en '$INPUT_DIR'."
    # Eliminar el archivo de salida si está vacío
    if [ ! -s "$OUTPUT_FILE" ]; then
        rm "$OUTPUT_FILE"
        echo "El archivo de salida vacío ha sido eliminado."
    fi
    exit 0
else
    echo "Proceso completado. Se han concatenado $PROCESSED_FILES archivos en '$OUTPUT_FILE'."
fi
