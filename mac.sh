#!/bin/bash

# Obtener la dirección MAC de la interfaz de red
# Asumiendo que la interfaz de red es eth0, puedes cambiarlo según tu configuración.

interfaz="enp0s31f6"

# Verificar si ifconfig está instalado
if ! command -v ifconfig &> /dev/null; then
    echo "El comando 'ifconfig' no está instalado. Por favor, instálalo para ejecutar este script."
    exit 1
fi

# Obtener la dirección MAC
mac_address=$(ifconfig $interfaz | grep -oE '([0-9a-fA-F]{2}:){5}([0-9a-fA-F]{2})')

# Verificar si la dirección MAC se ha encontrado
if [ -z "$mac_address" ]; then
    echo "No se pudo obtener la dirección MAC de la interfaz $interfaz."
    exit 1
fi

echo "La dirección MAC de la interfaz $interfaz es: $mac_address"

