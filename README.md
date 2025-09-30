# Projeto Final Desenvolve

## Objetivo

Esse projeto tem o intuito de por em prática todo o conhecimento adquirido na trilha de Engenharia de Dados, com uma análise de dados de forma profissional com a seguinte estrutura: 

- **Comunicar insights e descobertas para audiências técnicas e não-técnicas,** adaptando linguagem e visualizações conforme o público, traduzindo resultados estatísticos complexos em recomendações práticas e acionáveis para tomada de decisão.
- **Demonstrar domínio técnico das ferramentas e metodologias do curso,** apresentando ao vivo funcionalidades dos dashboards, explicando escolhas técnicas, validando modelos estatísticos e respondendo questões sobre implementação e limitações das soluções desenvolvidas.
- **Avaliar criticamente o projeto e propor evoluções futuras,** identificando limitações da análise realizada, sugerindo melhorias metodológicas, apresentando roadmap de desenvolvimento e estabelecendo métricas de sucesso para monitoramento contínuo da solução.

  ## Requisitos

- **Limpeza e Transformação:** Trataram dados, criaram variáveis derivadas
- **Análise Exploratória:** Descobriram padrões, formularam hipóteses
- **Coleta e Ingestão:** Selecionaram datasets, integraram múltiplas fontes no BigQuery
- **Modelagem Estatística:** Testaram hipóteses, construíram modelos preditivos
- **Dashboards Integrados:** Criaram visualizações interativas no Looker Studio


---

## Etapa I - a escolha do dataset

Para a escolha do dataset optamos utilizar a plataforma  do Kaggle que  possuem dados públicos, e optamos por escolher o dataset com tema: Produção e Disposição de Petróleo e Gás dos EUA 2015-2025 [dataset]( https://www.kaggle.com/datasets/pinuto/us-oil-and-gas-production-and-disposition-20152025). Ele contém informações dos volumes mensais de produção e disposição dos recursos federais de petróleo e gás natural dos EUA de janeiro de 2015 a setembro de 2025. Compilado a partir dos formulários de relatórios OGOR-B autoritários e com curadoria dos EUA Departamento do Interior (DOI), Escritório de Receita de Recursos Naturais (ONRR), reflete os dados oficiais de produção de recursos naturais federais e nativos americanos.  


### Descrição

- **Cobertura de Tempo:** Janeiro de 2015 – Setembro 2025 (registos mensais)
- **Conteúdo:** Distribuição Federal e Nativa Americana de Petróleo e Gás Natural e Distribuição.
- **Colunas (10 de 11):**  Production Date, Land Class, Land Category, State, County, FIPS Code,, Commodity, Disposition Code & Description, Volume.

  ### Descrição das colunas

  Production Date(Data de Produção)   → Data em que o petróleo ou gás foi efetivamente produzido.


Land Class(Class Terrestre) → Classificação legal ou administrativa do terreno ( ex: federal, estadual,privado). Afeta direitos de exploração.


Land Category(Catogoria Terrestre) → Tipo de uso ou restrição do terreno ( ex: reserva ambiental,área indígena, zona industrial ). 


State(Estado) → Estado onde ocorre a produção. Essencial para análises regionais e cumprimento de leis locais.


County(Condado) → Condado  da operação. Importante para questões regulatórias,fiscais e comerciais.


FIPS Code(Código FIPS - Padrão Federal de Processamento de Informações) → Código padronizado usado para identificar regiões geográficas nos EUA. Facilita integração com outros sistemas.


Offshore Region(Região Offshore) → Indica se a produção ocorre em áreas marítimas ( offshore), como plataformas oceânicas.


Commodity → Tipo de recurso extraído: petróleo bruto,gás natural,condensado,etc.


Disposition Code → Código que representa o destino do produto ( ex:vendido,reinjetado,queimado).


Disposition Description → Descrição textual do destino do produto.


Volume → Quantidade produzida,geralmente em barris (petróleo) ou pés cúbicos (gás).




  
  


