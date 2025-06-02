for file in directorio/*; do
  if [ -f "$file" ]; then
    echo "# $(basename "$file")" >> archivo_salida.txt
    cat "$file" >> archivo_salida.txt
    echo "" >> archivo_salida.txt  # Línea en blanco para mejor separación
  fi
done
