FROM python:3.14-slim

# Install uv
COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

# Set working directory
WORKDIR /app

# Copy project files
COPY pyproject.toml uv.lock ./
COPY src/ ./src/

# Install dependencies using uv
RUN uv sync --frozen --no-cache

# Expose port 8000
EXPOSE 8000

# Run FastAPI server using the fastapi CLI
CMD ["uv", "run", "fastapi", "run", "--host", "0.0.0.0", "--port", "8000", "src/jarun/main.py"]
