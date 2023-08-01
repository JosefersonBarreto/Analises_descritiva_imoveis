# biblioteca de Análises descritiva simples!
#' faz a analise descritiva para o conjunto de dados
#'
#' @param dados O dataframe a ser analisado.
#'
#' @return As analises descritivas sobre o banco de dados.
#'
#' @examples
#' analise_variaveis_dataframe2(dados)
#'
#' @export
analise_variaveis_dataframe2 <- function(dados) {
  if (!is.data.frame(dados)) {
    stop("O argumento 'dados' deve ser um data frame.")
  }

  resultados <- list()
  variaveis_categoricas <- names(dados)[sapply(dados, function(x) is.factor(x) || is.character(x))]

  # Análise para variáveis categóricas (fatores e characters)
  cat("===============================================\n")
  cat("Variáveis categóricas:\n")
  cat("===============================================\n")
  for (coluna in variaveis_categoricas) {
    freq_table <- table(dados[[coluna]])
    cat(sprintf("Variável categórica: %s\n", coluna))
    print(freq_table)
    cat("\n")
    resultados[[coluna]] <- list(frequencia = freq_table)
  }

  cat("===============================================\n\n")

  cat("===============================================\n")
  cat("Análise descritiva das variáveis numéricas:\n")
  cat("===============================================\n")

  # Análise para variáveis numéricas
  variaveis_numericas <- names(dados)[sapply(dados, is.numeric)]
  for (coluna in variaveis_numericas) {
    analise_descritiva <- summary(dados[[coluna]])
    cat("\n")
    cat(sprintf("Variável numérica: %s\n", coluna))
    print(analise_descritiva)
    resultados[[coluna]] <- list(descritiva = analise_descritiva)
  }

  invisible(resultados)  # Suprime a saída dos resultados
}









#' faz as estatisticas descritiva da interação entre uma variável categórica e uma variável númerica
#'
#' @param variavel_categorica a variável categórica a ser analisada.
#'
#' @param variavel_categorica variavel númerica a ser analisada.
#'
#' @param dados dataframe a qual as variáveis analisadas pertencem.
#'
#' @return análises descritivas da interação das duas variáveis.
#'
#' @examples
#' analise_interacao_categorica_numerica(variavel_categorica = "bairro",
#' variavel_numerica = "aluguel", dados = dataframe)
#'
#' @export
analise_interacao_categorica_numerica <- function(variavel_categorica, variavel_numerica, dados) {
  if (!is.character(variavel_categorica) && !is.factor(variavel_categorica)) {
    stop("A variável categórica deve ser do tipo character ou factor.")
  }

  if (!is.character(variavel_numerica) || !(variavel_numerica %in% names(dados))) {
    stop("A variável numérica deve ser o nome de uma coluna existente no data frame.")
  }

  if (!is.data.frame(dados)) {
    stop("O argumento 'dados' deve ser um data frame.")
  }

  if (!all(variavel_categorica %in% names(dados))) {
    stop("A variável categórica não corresponde a uma coluna no data frame.")
  }

  resultados <- aggregate(dados[[variavel_numerica]], by = list(dados[[variavel_categorica]]), FUN = mean)
  nomes_colunas <- c(variavel_categorica, "preco_medio_aluguel")
  colnames(resultados) <- nomes_colunas
  resultados <- resultados[order(resultados$preco_medio_aluguel, decreasing = TRUE), ]

  mensagem <- paste("O aluguel é mais caro em média no", resultados[1, variavel_categorica], ", cerca de", round(resultados[1, "preco_medio_aluguel"], 2), "e mais barato em média no", resultados[nrow(resultados), variavel_categorica], ", cerca de", round(resultados[nrow(resultados), "preco_medio_aluguel"], 2))

  return(list(resultado_interacao = resultados, mensagem = mensagem))
}




