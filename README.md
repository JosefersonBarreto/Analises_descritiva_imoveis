
 ## pacote em R para análises descritivas de dados imobiliários

esse é um repistório de um pacote em R  contendo  funções  para analises descritiva em R  voltados a  dados de imoveis , no futuro a  biblioteca poderá conter mais funções ,  
está biblioteca é composta de duas funções ** analise_variaveis_dataframe2**  e  **analise_interacao_categorica_numerica**  , onde ,** analise_variaveis_dataframe2**  retorna
analises descritivas simples para as variaveis  presentes no dataset, e    analise_interacao_categorica_numerica  retorna as analises descritivas com base na intereçaõa entre 
uma variávell categorica e uma variavel numerica, exemplo:  o preço de casas por bairro .


##  Sobre as Funções 


*analise_variaveis_dataframe2*: Essa função retorna análises descritivas simples para as variáveis presentes no dataset de imóveis. Ela oferece estatísticas básicas, 
como média, mediana, desvio padrão, valores mínimos e máximos, contagem de valores nulos, entre outras informações relevantes para cada variável do conjunto de dados.

*analise_interacao_categorica_numerica*: Essa função realiza análises descritivas considerando a interação entre uma variável categórica e uma variável numérica. Um exemplo
de uso seria analisar como o preço dos imóveis varia entre diferentes bairros. 


## Instalação  

em caso de duvidas, clone o repositório e execute o seguinte comando no R:

### verefique se  AnalisesTEST_0.1.0.tar.gz  está no diretório e executeo o código 
caminho_pacote <- "AnalisesTEST_0.1.0.tar.gz"

### Instalar o pacote a partir do arquivo local
install.packages(caminho_pacote, repos = NULL, type = "source")

### apos a intalação ,carregue a biblioteca 

library(AnalisesTEST)




### carregue a banco de dados de exemplos 

carregue o banco de dados disponível no repositório da biblioteca 
dados<-read.csv("imoveis.csv")


 para fazer  uma analise descritiva de todas as variaveis presentes no conjunto de dados  use a  função abaixo 

analise_variaveis_dataframe2(dados = dados)




### a seguinte função  fara a análise descritiva com base na interação entre uma variável  categórica e uma varíavel numerica


analise_interacao_categorica_numerica(variavel_categorica = "bairro", variavel_numerica = "aluguel", dados = dados)



## Informações Adicionais
Essa é apenas uma versão inicial,no futuro, o pacote irá receber outras funções adicionais.

pacote criado e desencolvido por: Joseferson  Barreto
email: Joseferson7@gmail.com


