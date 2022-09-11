for entry in /configs/scripts/builder/*.sh; do
    if [ "$entry" != "main.sh" ]; then
        source /configs/scripts/builder/$entry
    fi
done
