git pull origin main

if [ -d bin ]; then
    for file in ./bin/*.sh; do
        [ -f "$file" ] && source "$file"
    done
fi
