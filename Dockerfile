FROM python:3.12-slim-bookworm

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    PIP_NO_CACHE_DIR=1 \
    PIP_DISABLE_PIP_VERSION_CHECK=1 \
    PYTHONPATH=/app/src \
    MPLBACKEND=Agg

WORKDIR /app

# As dependencias ficam em uma camada separada para aproveitar o cache.
COPY requirements.txt ./requirements.txt
RUN python -m pip install -r requirements.txt

COPY src/ ./src/
COPY scripts/ ./scripts/
COPY notebooks/ ./notebooks/

RUN mkdir -p /app/data /app/outputs

# O ponto de entrada atual apenas imprime uma mensagem.
CMD ["jupyter", "nbconvert", "--execute", "--to", "notebook", "--ExecutePreprocessor.timeout=-1", "--output-dir=/app/outputs", "app/notebooks/TechC1_Imagens.ipynb", "app/notebooks/TechC1_Treinamento_Modelos.ipynb"]