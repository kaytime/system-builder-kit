for entry in /configs/scripts/builder/*.sh; do
    if [ "$entry" != "/configs/scripts/builder/main.sh" ]; then
        source $entry
    fi
done
