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

## Rodando com Docker Compose

Construa a imagem e execute a aplicação:

```bash
docker compose build
docker compose run --rm treinamento
```

Para executar um script específico:

```bash
docker compose run --rm treinamento python scripts/meu_script.py
```

Os arquivos da pasta `data/` ficam disponíveis no container em `/app/data` como somente leitura. Os resultados gravados em `/app/outputs` são persistidos na pasta `outputs/` do projeto.

Após alterar o código-fonte ou o arquivo `requirements.txt`, reconstrua a imagem:

```bash
docker compose build
```
