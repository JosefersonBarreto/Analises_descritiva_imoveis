

\name{analise_interacao_categorica_numerica}
\alias{analise_interacao_categorica_numerica}
\title{Analisa a interação entre uma variável categórica e uma variável numérica em um dataframe}
\usage{
  analise_interacao_categorica_numerica(variavel_categorica, variavel_numerica, dados)
}
\arguments{
  \item{variavel_categorica}{A variável categórica do dataframe.}
  \item{variavel_numerica}{A variável numérica do dataframe.}
  \item{dados}{O dataframe contendo as variáveis de interesse.}
}
\value{
  Uma lista contendo dois elementos: \code{resultado_interacao}, com o resultado da análise de interação entre as variáveis, e \code{mensagem}, com informações sobre onde o aluguel é mais caro e mais barato, juntamente com o preço médio. %nessas categorias.
}
\description{
  Esta função calcula o preço médio da variável numérica para cada categoria da variável categórica em um dataframe fornecido como entrada. %Além disso, ela identifica em qual categoria o aluguel é mais caro e em qual categoria é mais barato.
}
\examples{
  dados_exemplo <- data.frame(
    bairro = c("Centro", "Praia", "Centro", "Vila", "Praia", "Jardins", "Praia", "Centro", "Vila", "Praia"),
    aluguel = c(2500, 3000, 2000, 2800, 3200, 1800, 2600, 2400, 2200, 3500)
  )

  resultado_interacao <- analise_interacao_categorica_numerica(variavel_categorica = "bairro", variavel_numerica = "aluguel", dados = dados_exemplo)
}




