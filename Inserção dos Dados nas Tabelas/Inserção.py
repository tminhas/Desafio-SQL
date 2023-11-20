import pandas as pd

# Leitura dos dados do arquivo Dimensoes_DadosModelagem.xlsx
arq1 = 'Dimensoes_DadosModelagem.xlsx'
clientes_df = pd.read_excel(arq1, sheet_name='Clientes')
funcionarios_df = pd.read_excel(arq1, sheet_name='Funcionarios')
escritorios_df = pd.read_excel(arq1, sheet_name='Escritorios')
categoria_df = pd.read_excel(arq1, sheet_name='Categoria')
produtos_df = pd.read_excel(arq1, sheet_name='Produtos')
fornecedores_df = pd.read_excel(arq1, sheet_name='Fornecedores')

# Leitura dos dados do arquivo FatoCabecalho_DadosModelagem
arq2 = 'FatoCabecalho_DadosModelagem.txt'
fato_cabecalho_df = pd.read_csv(arq2) 

# Leitura dos dados do arquivo FatoDetalhes_DadoModelagem.csv
arq3 = 'FatoDetalhes_DadoModelagem.csv'
fato_detalhes_df = pd.read_csv(arq3)

# Inserir dados nas tabelas
clientes_df.to_sql('Clientes', if_exists='replace', index=False)
funcionarios_df.to_sql('Funcionarios', if_exists='replace', index=False)
escritorios_df.to_sql('Clientes', if_exists='replace', index=False)
categoria_df.to_sql('Clientes', if_exists='replace', index=False)
produtos_df.to_sql('Clientes', if_exists='replace', index=False)
fornecedores_df.to_sql('Clientes', if_exists='replace', index=False)
fato_cabecalho_df.to_sql('Entregas', if_exists='replace', index=False)
fato_detalhes_df.to_sql('Vendas', if_exists='replace', index=False)