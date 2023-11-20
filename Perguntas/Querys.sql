-- Valor total das vendas e dos fretes por produto e ordem de venda
SELECT
    e.Data as DataVenda,
    v.ProdutoID,
    SUM(v.Valor) AS ValorVendas,
    SUM(e.ValorFrete) AS ValorFrete
FROM Vendas v
JOIN Entregas e ON v.CupomID = e.CupomID
GROUP BY e.Data, v.ProdutoID;

-- Valor de venda por tipo de produto;
SELECT
    p.CategoriaID,
    c.Categoria,
    SUM(v.Valor) AS ValorVendas
FROM Vendas v
JOIN Produtos p ON v.ProdutoID = p.ProdutoID
JOIN Categoria c ON p.CategoriaID = c.CategoriaID
GROUP BY p.CategoriaID, c.Categoria;

-- Quantidade e valor das vendas por dia, mês, ano;
-- Agrupamento feito da mais antiga para a mais recente
SELECT
    DATEPART(YEAR, e.Data) AS Ano,
    DATEPART(MONTH, e.Data) AS Mes,
    DATEPART(DAY, e.Data) AS Dia,
    COUNT(v.CupomID) AS QuantidadeVendas,
    SUM(v.Valor) AS ValorVendas
FROM Entregas e
JOIN Vendas v ON e.CupomID = v.CupomID
GROUP BY DATEPART(YEAR, e.Data), DATEPART(MONTH, e.Data), DATEPART(DAY, e.Data);

-- Lucro dos meses;
SELECT
    DATEPART(YEAR, e.Data) AS Ano,
    DATEPART(MONTH, e.Data) AS Mes,
    SUM(v.Valor - v.Custo) AS Lucro
FROM Entregas e
JOIN Vendas v ON e.CupomID = v.CupomID
GROUP BY DATEPART(YEAR, e.Data), DATEPART(MONTH, e.Data);

-- Venda por produto; 
SELECT
    p.ProdutoID,
    p.Produto,
    COUNT(v.CupomID) AS QuantidadeVendas,
    SUM(v.Valor) AS ValorVendas
FROM Vendas v
JOIN Produtos p ON v.ProdutoID = p.ProdutoID
GROUP BY p.ProdutoID, p.Produto;

/* Venda por cliente, cidade do cliente e estado;
Não há informações sobre o estado do cliente, considerei 
a informação estado como sendo o país do cliente */
SELECT
    e.ClienteID,
    c.Cliente,
    c.Cidade,
    c.Pais,
    COUNT(v.CupomID) AS QuantidadeVendas,
    SUM(v.Valor) AS ValorVendas
FROM Entregas e
JOIN Vendas v ON e.CupomID = v.CupomID
JOIN Clientes c ON e.ClienteID = c.ClienteID
GROUP BY e.ClienteID, c.Cliente, c.Cidade, c.Pais;

-- Média de produtos vendidos;
SELECT
    AVG(Quantidade) AS MediaVendidos
FROM Vendas;

-- Média de compras que um cliente faz.
SELECT
    AVG(QuantidadeVendas) AS MediaCompras
FROM (
    SELECT
        e.ClienteID,
        COUNT(v.CupomID) AS QuantidadeVendas
    FROM Entregas e
    JOIN Vendas v ON e.CupomID = v.CupomID
    GROUP BY e.ClienteID
) AS Subquery;
