#!/bin/bash

# Список вебсайтів для перевірки
WEBSITES=("https://google.com" "https://facebook.com" "https://twitter.com")

# Ім'я файлу логів
LOG_FILE="website_status.log"

# Очищення попереднього логу
> "$LOG_FILE"

echo "Перевірка доступності сайтів..."

# Перевірка кожного сайту
for SITE in "${WEBSITES[@]}"; do
    HTTP_STATUS=$(curl -L -o /dev/null -s -w "%{http_code}" "$SITE")

    if [[ "$HTTP_STATUS" -ge 200 && "$HTTP_STATUS" -lt 400 ]]; then
        echo "[$SITE] is UP (Status: $HTTP_STATUS)" | tee -a "$LOG_FILE"
    else
        echo "[$SITE] is DOWN (Status: $HTTP_STATUS)" | tee -a "$LOG_FILE"
    fi
done

echo "Результати збережено у $LOG_FILE"