# Tech Challenge FIAP

## Estrutura

```
tech-challenge-fiap/
├── src/tech_challenge/   # Código-fonte principal (pacote Python)
│   └── main.py           # Ponto de entrada
├── scripts/              # Scripts avulsos (ETL, automações, etc.)
├── notebooks/            # Jupyter notebooks de exploração
├── data/                 # Dados locais (ignorados pelo git)
├── tests/                # Testes (pytest)
├── requirements.txt      # Dependências
├── Dockerfile
└── .dockerignore
```

## Rodando localmente

```bash
python -m venv .venv
.venv\Scripts\activate        # Windows
pip install -r requirements.txt
set PYTHONPATH=src            # Windows (Linux/Mac: export PYTHONPATH=src)
python -m tech_challenge.main
```

## Rodando com Docker

```bash
docker build -t tech-challenge-fiap .
docker run --rm tech-challenge-fiap
```

Para executar um script específico:

```bash
docker run --rm tech-challenge-fiap python scripts/meu_script.py
```
