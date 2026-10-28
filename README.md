# Tech Challenge FIAP

## Colaboradores do Projeto

- **Gabriel Lopes Guimarães** - [GitHub](https://github.com/Gabriel-lgui)
- **Lucas Muniz Vieira Souto** - [GitHub](https://github.com/Zenny-152)
- **Marcos Pinheiro Moura** - [GitHub](https://github.com/newcocas)
- **Maria Luiza Assumpção Tozi** - [GitHub](https://github.com/mariatozi)
- **Saulo Roberto de Sena** - [GitHub](https://github.com/senasaulo)

## Estrutura

```
tech-challenge-fiap/
├── src/tech_challenge/      # Código-fonte principal (pacote Python)
│   └── main.py              # Ponto de entrada
├── scripts/                 # Scripts avulsos (ETL, automações, etc.)
├── notebooks/
│   ├── TechC1_Treinamento_Modelos.ipynb  # Modelos tradicionais
│   └── TechC1_Imagens.ipynb              # Deep Learning
├── outputs/
├── data/                    # Dados locais (ignorados pelo git)
├── tests/                   # Testes (pytest)
├── requirements.txt         # Dependências
├── Dockerfile
├── compose.yaml
├── .gitignore
└── .dockerignore
```

## Rodando localmente

```bash
python -m venv .venv
.venv\Scripts\activate        # Windows
python.exe -m pip install --upgrade pip
pip install -r requirements.txt
set PYTHONPATH=src            # Windows (Linux/Mac: export PYTHONPATH=src)
python -m tech_challenge.main
```

## Rodando Treino de Imagens Localmente (Nova Janela de Terminal - Windows)
```bash
jupyter nbconvert --to script notebooks/TechC1_Imagens.ipynb --output TechC1_Imagens.py
Rename-Item -Path "notebooks\TechC1_Imagens.py.txt" -NewName "TechC1_Imagens.py"
Start-Process cmd -ArgumentList '/k "set PYTHONPATH=src && .venv\Scripts\activate && python notebooks/TechC1_Imagens.py"'
```
## Rodando Treinamento de Modelos Localmente (Nova Janela de Terminal — Windows)

```powershell
jupyter nbconvert --to script notebooks/TechC1_Treinamento_Modelos.ipynb --output TechC1_Treinamento_Modelos.py
Rename-Item -Path "notebooks\TechC1_Treinamento_Modelos.py.txt" -NewName "TechC1_Treinamento_Modelos.py"
Start-Process cmd -ArgumentList '/k "set PYTHONPATH=src && .venv\Scripts\activate && python notebooks/TechC1_Treinamento_Modelos.py"'
```

## Rodando os treinamentos com Docker Compose

### Construir a imagem

```bash
docker compose build
```

### Treinamento dos modelos

Executa Regressão Logística, Random Forest, XGBoost e a comparação dos modelos:

```bash
docker compose run --rm treinamento \
  jupyter nbconvert --execute --to notebook \
  --ExecutePreprocessor.timeout=-1 \
  --output-dir=/app/outputs \
  /app/notebooks/TechC1_Treinamento_Modelos.ipynb
```

### Treinamento de imagens

Executa os modelos MobileNet, ResNet50 e EfficientNet:

```bash
docker compose run --rm treinamento \
  jupyter nbconvert --execute --to notebook \
  --ExecutePreprocessor.timeout=-1 \
  --output-dir=/app/outputs \
  /app/notebooks/TechC1_Imagens.ipynb
```

Os notebooks executados serão gravados na pasta local outputs/.

Os arquivos da pasta data/ ficam disponíveis no container em /app/data como somente leitura.

### Após alterar o código, os notebooks ou o arquivo requirements.txt, reconstrua a imagem:

```bash
docker compose build
```

Para interromper um treinamento em execução, pressione Ctrl+C.

### Para remover a rede e outros recursos criados pelo Compose:

```bash
docker compose down
```