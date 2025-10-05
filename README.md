# Projeto Final Desenvolve

## Objetivo

Esse projeto tem o intuito de por em prática todo o conhecimento adquirido na trilha de Engenharia de Dados, aplicando técnicas de preparação, limpeza, exploração e análise de dados, seguindo a estrutura a seguir: 

- Explorar os dados mediante insights, adaptando a linguagem e compreensão visual das informações adquiridas, facilitando a visualização de resultados complexos e informações relevantes para tomada de decisões.
- Demonstrar domínio técnico das ferramentas e metodologias do curso, apresentando ao vivo funcionalidades dos dashboards, explicando e validando as escolhas tomadas durante a elaboração do mesmo.
- Avaliar criticamente o projeto e propor evoluções futuras, identificando limitações da análise realizada, sugerindo melhorias metodológicas.

  ### Requisitos

- *Limpeza e Transformação:* Tratar dados e criar variáveis derivadas;
- *Análise Exploratória:* Descobrir padrões e formular hipóteses;
- *Coleta e Ingestão:* Selecionar datasets e integrar múltiplas fontes no BigQuery;
- *Modelagem Estatística:* Testar hipóteses e construír modelos preditivos;
- *Dashboards Integrados:* Criar visualizações interativas utilizando Looker Studio.
  
---

## Etapa I - a escolha do dataset

Para a escolha do dataset optamos 'Produção e Disposição de Petróleo e Gás dos EUA 2015-2025' [dataset]( https://www.kaggle.com/datasets/pinuto/us-oil-and-gas-production-and-disposition-20152025); encontrado na plataforma Kaggle. Este possui dados a respeito dos volumes mensais de produção e destinação de recursos federais de petróleo e gás natural dos EUA desde janeiro de 2015 até setembro de 2025. Este captura não somente os dados crus de volume de produção como também categorias de destinação detalhadas, indicando de qual forma esses recursos são vendidos, medidos e alocados.

### Descrição

- *Cobertura de Tempo:* Janeiro de 2015 – Setembro 2025;
- *Conteúdo:* Distribuição Federal e Nativa Americana de Petróleo e Gás Natural e Distribuição.
- *Colunas:*  Production Date, Land Class, Land Category, State, County, FIPS Code, Offshore Region, Commodity, Disposition Code,Disposition Description e Volume.

  ### Descrição das colunas

- Production Date(Data de Produção) → Data em que o petróleo ou gás foi efetivamente produzido;
- Land Class(Class Terrestre) → Classificação legal ou administrativa do terreno ( ex: federal, estadual,privado). Afeta direitos de exploração;
- Land Category(Catogoria Terrestre) → Tipo de uso ou restrição do terreno ( ex: reserva ambiental,área indígena, zona industrial);
- State(Estado) → Estado onde ocorre a produção. Essencial para análises regionais e cumprimento de leis locais;
- County(Condado) → Condado  da operação. Importante para questões regulatórias,fiscais e comerciais;
- FIPS Code(Código FIPS - Padrão Federal de Processamento de Informações) → Código padronizado usado para identificar regiões geográficas nos EUA. Facilita integração com outros sistemas;
- Offshore Region(Região Offshore) → Indica se a produção ocorre em áreas marítimas ( offshore), como plataformas oceânicas;
- Commodity(Produto) → Tipo de recurso extraído: petróleo bruto,gás natural,condensado,etc;
- Disposition Code(Código de Destinação) → Código que representa o destino do produto ( ex:vendido,reinjetado,queimado);
- Disposition Description(Descrição da Destinação) → Descrição textual do destino do produto;
- Volume(Volume) → Quantidade, geralmente em barris (petróleo) ou milhares de pés cúbicos (gás).

### Categoria  de algumas colunas

Existem colunas com categorias específicas que traz a informação classificação e categoria do terreno, locais que possuem offshore e os tipos produto, essas colunas são:

- Land Class
- Land Category
- Offshore Region
- Commodity

A coluna Land Class possui as categorias:

- Federal
- Mixed Exploratory(Misto Exploratório)
- Native American(Terra Nativa)

A coluna Land Category possui as categorias:

- Onshore(extração de petróleo e gás em terra firme)
- Offshore(extração de petróleo e gás no mar)

A coluna Offshore Region possui as categorias:

- Offshore Gulf
- Offshore Pacific
- Offshore Alaska

A coluna Disposition Description possui as seguintes categorias:

- Produced into Inventory Prior to Sales → Produzido para Estoque Antes das Vendas
- Water Disposal-Other than Injected/Transferred → Descarte de Água (Diferente de Injetada/Transferida)
- Used on L/A-Native Production Only → Usado na Área de Concessão (L/A) - Apenas Produção Local
- Water Injected/Transferred Off-L/A → Água Injetada/Transferida para Fora da Área de Concessão (L/A)
- Transferred to Facility → Transferido para Instalação
- Injected on L/A → Injetado na Área de Concessão (L/A)
- Flared Oil Well Gas - Royalty Not Due → Gás de Poço de Petróleo Queimado (Flare)
- Differences/Adjustments → Diferenças/Ajustes
- Transferred from Facility → Transferido da Instalação
- Flared Gas Well Gas - Royalty Not Due → Gás de Poço de Gás Queimado (Flare)
- Vented Oil Well Gas - Royalty Not Due → Gás de Poço de Petróleo Ventilado
- Vented Gas Well Gas - Royalty Not Due → Gás de Poço de Gás Ventilado
- Buy-Back Purchased for L/A Use → Recompra Adquirida para Uso na Área de Concessão (L/A)
- Pipeline Drip/Retrograde Scrubber Production → Produção de Condensado de Duto/Depurador Retrógrado
- Buy-Back-Used on L/A → Recompra - Usado na Área de Concessão (L/A)
- Flared Gas - Royalty Due → Gás Queimado (Flare) 
- Flared Oil Well Gas - Royalty Due → Gás de Poço de Petróleo Queimado (Flare) - Royalties Devidos
- Sales-Buy-Back-Measured-Royalty Not Due → Vendas de Recompra
- Sales-Royalty Not Due-MEASURED → Vendas
- Transferred to Facility-Returned to L/A → Transferido para Instalação - Retornado para a Área de Concessão (L/A)
- Spilled and/or Lost-Avoidable-Royalty Due → Derramado e/ou Perdido - Evitável
- Spilled and/or Lost-Unavoidable-Royalty Not Due → Derramado e/ou Perdido - Inevitável
- Sales-Non-Hydrocarbon Gas → Vendas - Gás Não-Hidrocarboneto
- Waste Oil/Slop Oil → Óleo Residual/Slop Oil
- Flared Gas Well Gas - Royalty Due → Gás de Poço de Gás Queimado (Flare)
- Vented Oil Well Gas - Royalty Due → Gás de Poço de Petróleo Ventilado
- Vented Gas - Royalty Due → Gás Ventilado 
- Condensate Sales-Royalty Due-MEASURED → Vendas de Condensado - MEDIDO
- Sales-Royalty Not Due, Recovered Injection-MEASURED → Vendas - Injeção Recuperada - MEDIDO
- Vented Gas Well Gas - Royalty Due → Gás de Poço de Gás Ventilado
- Load Oil → Óleo de Carga/Tratamento
- Sales-Royalty Not Due-FMP Not Assigned → Vendas - Royalties Não Devidos - Ponto de Medição (FMP) Não Atribuído
- Theft → Roubo/Furto
     
---

## Etapa II - Limpeza e transformação dos dados

O processo de limpeza e transformação dos dados foi realizado mediante a ferramente Google Colab onde, após a ingestão de dados via integração com BigQuery foi criado o ID do projeto "t1engenhariadados" além de armazenar os dados do database em um DataFrame Pandas (df).

Em seguida foi realizada a importação das bibliotecas necessárias para a execução das análises subsequentes como Python Pandas, Numpy, Seaborn e Matplotlib.pyplot. 

Após a primeira visualização dos dados foi realizada a preparação e normalização dos dados:

Dimensão da base de dados com df.shape, retornando número de linhas e colunas;
Contagem de linhas duplicadas com df.duplicated().

- Conversão do tipo de dado da coluna "Production Date" de string para datetime, permitindo a manipulação dos dados como data;
- Criação da coluna "Ano" e "Mes" possibilitando análises durante diferentes períodos de tempo.

Devido a unidade de medida originária da coluna "Volume", barris para óleo e milhares de pés cúbicos (Mcf) para gás, foi efetuada a normalização mediante a unidade de medida equivalente (BOE) "Barril de petróleo equivalente":
  - **6 Mcf≈1 BOE**  → Ou seja, 6.000 pés cúbicos de gás natural têm aproximadamente a mesma energia que 1 barril de petróleo;
- Criação de coluna "VolumeBOE" contendo normalização do volume, tornando-se mais correta para as análises subsequentes.
  - pd.options.display.float_format = '{:.2f}'.format utilizado para formatar a coluna sem valores exponenciais, resposta típica da bibliotéca Pandas.
- Criação de uma coluna "Tipo" para facilitar a filtragem e classificação de volume "Produzido" (variáveis positivas) e volume "Resíduo" (variáveis negativas).        - Foi utilizada a função np.where() para classificar os valores positivos (>0) e negativos (<0);
- Criação de duas colunas para hospedar os Volume por Commodity: VolumeOil e VolumeGas;
- Criação de colunas VolumeGas_Produzido, VolumeGas_Residuo,	VolumeOil_Produzido,	VolumeOil_Residuo;
- Criação de colunas Volume_Produzido e Volume_Residuo;
  - Objetivo de facilitar a visualização e análise dos valores volumétricos presentes no database.

Para a exploração inicial foram executadas verificações básicas sobre os dados:
- Estrutura do DataFrame com df.info(), exibindo os tipos de dados das variáveis e a contagem de valores não nulos em cada coluna;
     * Verificada a existência de 470.830 linhas e 23 colunas, sendo dessas colunas:
       * 8 colunas do tipo 'objeto' ( Disposition Description, Commodity, Offshore Region, County,  State, Land Category, Land Class, Tipo);
       * 3 tipo 'inteiro' (Volume,  Disposition Code, FIPS Code);
       * 1 tipo 'datetime' (Production Date);
       * 9 tipo 'float' (VolumeBOE, VolumeOil, VolumeGas, VolumeGas_Produzido, VolumeGas_Residuo,	VolumeOil_Produzido,	VolumeOil_Residuo, Volume_Produzido, Volume_Residuo).
    * A contagem de valores não nulos em cada coluna evidencia a diferênça discrepante da contagem desses na coluna "Offshore Region" (10.196) em relação ao total de linhas na tabela (470.830), permitindo inferir que 460.634 produções ocorreram em áreas terrestres.
 
- Estatísticas descritivas com df.describe(), foi executada com foco nas VolumeGas_Produzido, VolumeGas_Residuo,	VolumeOil_Produzido,	VolumeOil_Residuo, Volume_Produzido e Volume_Residuo; gerando média, mediana, desvio padrão, mínimo e máximo das colunas numéricas;
    * A contagem de variáveis em cada coluna permite verificar que todas as variáveis foram preenchidas corretamente.
    * Os valores referentes ao 50% e 75% de incidência nos permite perceber uma discrepância na grande quantidade de valores preenchidos com 0;
Executado (df == 0).sum() para verificar a quantidade de linhas, por coluna, são preenchidas com 0;
  - Coluna Volume possui 296.558 ocorrências sem produção ou envio de Commodity.
    * Considerando a quantidade total de ocorrenciâs (470.830) e a quantidade de ocorrências com Volume "=0" (296.558), obtem-se que 62,7% das ocorrências não produziram ou enviaram algum Commodity.
    * Afere-se que a quantidade de ocorrências == 0 para oléo (424.435) foi superior a de gás (342.953), podendo significar em uma maior facilidade na extração gás em relação a de óleo.
    * Executado (df == 0).groupby(df['Ano']).sum() apenas em colunas de interesse, onde foi possível observar uma crescente evolução e diminuição de ocorrências == 0.

Aplicando .describe() filtrando por linhas onde a coluna Volume é diferente de 0, dessa forma obtendo resultado corretos para análises considerando apenas ocorrências com resultados;
- A contagem de Volume_Produzido e Volume_Residuo é de 174.272, podendo inferir que numericamente, as ocorrências de produção foram iguais as de envio;
- A média de Volume produzido e de residuo porém informa que quantitativamente o volume produzido foi maior do que o enviado;
- Os valores de mín e máx, assim como de desvio padrão nos mostra que os valores volumetrícos possuem uma variação muito grande, pesando no valor de média calculado;
- Os percentuais facilitam a aferição de que mais do 75% dos valores foram de produção.

---

## Etapa III - Análise Exploratória
Buscando compreender melhor a distribuição dos valores de commodity por tipo, foi efetuada a contagem por 'Disposition Description', onde foi possível inferir os seguintes insights:
- Differences/Adjustments, Buy-Back Purchased for L/A Use, Transferred from Facility são os únicos destinos onde tem ocorrência de variáveis de volume negativo (Resíduo), onde (Transferred from Facility, Buy-Back Purchased for L/A Use) contém unicamente valores negativos, ou seja, representam somente destinos de envio de commodity.
- O destino (Transferred from Facility) tem a maior incidência de envio de óleo, 4.023 ocorrências, totalizando um volume de -146.893.55 barris de óleo enviados;
- Com relação as gás,foram efetuados 3773 envios para o destino (Buy-Back Purchased for L/A Use), totalizando um volume de -148.931.423.5 milhares de metros cubicos de gás.
Soma dos valores de óleo e gás produzidos e enviados:
- Volume de Óleo Produzido: 11224187465.0
- Volume de Óleo Resíduo: 11224187465.0
- Volume de Gás Produzido: 8532353604.166666
- Volume de Gás Resíduo: 8532353604.166666
  
  <img width="683" height="521" alt="image" src="https://github.com/user-attachments/assets/e46a9538-c287-44f8-a481-3349cd35d4d1" />

Realizadas análises univariadas avaliando variáveis categóricas por meio de contagens por categoria: (value_count())
- O processo permitiu compreender profundamente a distribuição dos dados.
  - Por Disposition Discription permitiu inferir as seguintes considerações:
    - Sales-Royalty Due-MEASURED foi a destinação com maior número de ocorrências 63024, todas de procução;
    - O menor número de ocorrências foi na destinação Theft com 12.
*Análise dos Tipos de Disposição*
A maior parte do volume é classificada como Sales-Royalty Due-MEASURED, representando a venda direta da produção. As categorias Transferred to Facility e Produced into Inventory Prior to Sales também são significativas, indicando movimentações internas e armazenamento antes da venda.

<img width="1189" height="790" alt="image" src="https://github.com/user-attachments/assets/084906b1-01ff-4738-ab47-638a82c316a3" />

  - Por Land Class permitiu inferir que a maior quantidade de classe de terreno é federal;
    
    <img width="590" height="390" alt="image" src="https://github.com/user-attachments/assets/770acdcf-3102-4e59-98a6-eb04eb8218e5" />

  - Por Land Category foi possível verificar a maior quantidade de terrenos não maritímo, 97.83% OnShore;

Foram utilizadas funções de agregação e contagem cruzada (groupby) para relacionar variáveis categóricas e numéricas.
- Análise de ocorrências por Ano e Commodity possibilitou averiguar a quantidade de ocorrências constantes ao longo dos anos.
- df.groupby(['Ano', 'Commodity'])['Volume_Produzido'].sum() para verificar o volume produzido ao longo dos anos:
  <img width="528" height="403" alt="image" src="https://github.com/user-attachments/assets/47d35ab1-7721-492b-9734-c57fa19c4110" />
- Classificando o volume produzido por mês:
  
  <img width="683" height="521" alt="image" src="https://github.com/user-attachments/assets/80294da4-fa1f-44e5-b72e-c7d82aff48ae" />

-Produção por Classe de solo:

<img width="622" height="387" alt="image" src="https://github.com/user-attachments/assets/330ee86f-5869-4301-9455-32c24867eee0" />

-Classificando por categoria de terreno:

<img width="989" height="590" alt="image" src="https://github.com/user-attachments/assets/1ef6cd80-874e-49c4-8c34-30c85b9f921e" />


- Ano e Estado com maior produção de Gas;
- Ano e Estado com maior produção de Óleo;
- Participação percentual de cada commodity na produção total de cada ano;
  
## Análise Detalhada da Produção
*Evolução e Composição da Produção*:
  - A produção total teve um crescimento médio de -2.37% ao ano, com picos e vales influenciados por fatores macroeconômicos. A produção de óleo superou a de gás na maior parte do período, como visto no gráfico comparativo anual.

  <img width="1589" height="790" alt="image" src="https://github.com/user-attachments/assets/b712ac32-e62d-405a-b570-0c2cead5b52e" />

*Análise de Eficiência e Desperdício*
- A eficiência operacional é um ponto crítico de atenção. A taxa de desperdício, embora pareça baixa em percentual (1.88%), representa um volume absoluto de 386.6 milhões de BOE de recursos não aproveitados.
  - Tendência da Taxa de Desperdício:
    - O aumento contínuo da taxa de desperdício é um sinal de alerta, indicando a necessidade de revisão dos processos operacionais e de investimentos em tecnologias mais eficientes.

<img width="1189" height="590" alt="image" src="https://github.com/user-attachments/assets/44f060b9-6193-4e8f-bbc9-83d390118cff" />

*Análise de Sazonalidade*
O padrão de produção mensal é consistente, com picos no final do ano e vales no início. Esta sazonalidade pode estar ligada a fatores climáticos, demanda ou ciclos de manutenção.

<img width="1190" height="590" alt="image" src="https://github.com/user-attachments/assets/a2fbac1e-f30c-40cf-ae4f-e0e8d1d7f7d9" />

### Análise Estatística e de Disposição
* Distribuição e Outliers *
A distribuição dos volumes de produção é altamente assimétrica, com uma longa cauda de valores elevados. A análise em escala logarítmica revela uma distribuição mais próxima da normal, mas com presença significativa de outliers, que representam os poços ou campos de altíssima produtividade.
<img width="1389" height="490" alt="image" src="https://github.com/user-attachments/assets/9359395e-00ff-4fd3-b37d-fac7e9acd7a7" />
