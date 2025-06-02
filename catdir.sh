#!/bin/bash

usage() {
    echo "Uso: $0 [-r] directorio_entrada archivo_salida [patrón_regex]"
    echo "Opciones:"
    echo "  -r    Buscar archivos recursivamente en subdirectorios"
    echo ""
    echo "Ejemplos:"
    echo "  $0 /ruta/a/mis/archivos /ruta/archivo_salida.txt                # Todos los archivos del directorio"
    echo "  $0 -r /ruta/a/mis/archivos /ruta/archivo_salida.txt             # Todos los archivos recursivamente"
    echo "  $0 /ruta/a/mis/archivos /ruta/archivo_salida.txt '\.py$'        # Solo archivos .py"
    echo "  $0 -r /ruta/a/mis/archivos /ruta/archivo_salida.txt 'config\.'  # Archivos config.* recursivamente"
    exit 1
}

# Variable para modo recursivo (por defecto desactivado)
RECURSIVE=false

# Procesar opciones
while getopts ":r" opt; do
    case ${opt} in
        r ) RECURSIVE=true ;;
        \? ) usage ;;
    esac
done
shift $((OPTIND -1))

# Verificar si se han proporcionado los argumentos necesarios
if [ $# -lt 2 ] || [ $# -gt 3 ]; then
    usage
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

process_file() {
    local file="$1"
    if [ -f "$file" ] && [[ $(basename "$file") =~ $REGEX_PATTERN ]]; then
        # Obtener la ruta relativa al directorio de entrada para mostrarla en el separador
        local rel_path="${file#$INPUT_DIR/}"
        echo "################## $rel_path" >> "$OUTPUT_FILE"
        cat "$file" >> "$OUTPUT_FILE"
        echo "" >> "$OUTPUT_FILE"  # Línea en blanco para mejor separación
        ((PROCESSED_FILES++))
    fi
}

# Procesar archivos según el modo (recursivo o no)
if [ "$RECURSIVE" = true ]; then
    echo "Buscando archivos recursivamente en '$INPUT_DIR'..."
    
    # Usar find para búsqueda recursiva
    while IFS= read -r file; do
        process_file "$file"
    done < <(find "$INPUT_DIR" -type f | sort)
else
    echo "Buscando archivos en '$INPUT_DIR' (no recursivo)..."
    
    # Procesar solo archivos en el directorio principal
    for file in "$INPUT_DIR"/*; do
        if [ -f "$file" ]; then
            process_file "$file"
        fi
    done
fi

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
