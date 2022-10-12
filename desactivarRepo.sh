#!/bin/bash
#
# Este script desactiva los repositorios de thico-updates
# Autor: jmrx
# Version: 0.1
#

# comprueba si el script se ejcuta como root
if [ "$EUID" -ne 0 ]; then
    echo "-------------------------------------"
    echo "Ejecuta el script como root"
    echo "-------------------------------------"
    exit
fi

echo -e " Script que habilita los repositorios de thico-updates"
echo -e " a) habilitar \n d) Desactivar "

read option

# Si la opcion es "a" activa los repositorios de thico-updates, pero opcion es "d" los desactiva
if [ "$option" == "a" ]; then
    echo "_______________________________________"
    echo "Desactivando los repositorios de fedora"
    echo "_______________________________________"
    sleep 4s

    dnf config-manager --set-disabled fedora
    dnf config-manager --set-disabled updates

    echo "_____________________________________________"
    echo "Habilitando los repositorios de thico-updates"
    echo "_____________________________________________"
    sleep 4s

    dnf config-manager --set-enabled Thico*
    echo "_____________________"
    echo "Actualizando cambios"
    echo "_____________________"
    sleep 4s
    dnf update

    echo "Todo listo!"

elif
    [ "$option" == "d" ]
then
    echo "=============================================="
    echo "Desactivando los repositorios de thico-updates"
    echo "=============================================="
    sleep 4s

    dnf config-manager --set-disabled Thico*
    echo "======================================"
    echo "Habilitando los repositorios de fedora"
    echo "======================================"
    sleep 4s
    dnf config-manager --set-enabled fedora
    dnf config-manager --set-enabled updates

    echo "===================="
    echo "Actualizando cambios"
    echo "===================="
    sleep 4s
    dnf update

    echo "Todo listo!"
else
    echo "Opcion Incorrecta"
fi 2>/dev/null

exit 0
