# 1. Використовуємо офіційний образ Python 3.10
FROM python:3.10

# 2. Встановлюємо робочу директорію всередині контейнера
WORKDIR /app

# 3. Копіюємо файл зі списком залежностей
COPY requirements.txt requirements.txt

# 4. Встановлюємо залежності, вказані у requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# 5. Копіюємо решту коду проєкту у контейнер
COPY . .

# 6. Відкриваємо порт, на якому працюватиме застосунок
EXPOSE 8000

# 7. Команда для запуску FastAPI (Uvicorn)
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]