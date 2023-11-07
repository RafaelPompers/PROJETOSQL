USE [master_freios]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwResumoTransacoes]
AS
SELECT        'Compra' AS TipoTransacao, id_compra AS IDTransacao, dt_compra AS DataTransacao, it_nota_fiscal AS NotaFiscal, it_total AS TotalTransacao, it_numero_parcelas AS NumeroParcelas, vc_status AS StatusTransacao, 
                         id_fornecedor AS IDFornecedor, id_tipo_pagamento AS IDTipoPagamento, NULL AS EAVista
FROM            dbo.compra
UNION ALL
SELECT        'Venda' AS TipoTransacao, id_venda AS IDTransacao, dt_venda AS DataTransacao, it_nota_fiscal AS NotaFiscal, NULL AS TotalTransacao, it_numero_parcelas AS NumeroParcelas, vc_status AS StatusTransacao, 
                         id_cliente AS IDCliente, id_tipo_pagamento AS IDTipoPagamento, it_a_vista AS EAVista
FROM            dbo.venda;
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwRelatorioVendasMensais] 
AS
SELECT
   YEAR(v.dt_venda) as Ano,
   MONTH(v.dt_venda) as Mes,
   SUM(v.it_total) as TotalVendas
FROM
    venda v
GROUP BY
	YEAR(v.dt_venda),
	MONTH(v.dt_venda)
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwRelatorioComprasVendas] AS
SELECT
    p.vc_nome AS [Produto],
    c.dt_compra AS [Data_Compra],
    c.it_total AS [Total_Compra],
    v.dt_venda AS [Data_Venda],
    v.it_total AS [Total_Venda],
    (v.it_total - c.it_total) AS [Lucro_Por_Venda]
FROM
    [compra] c
INNER JOIN
    [itens_compra] ic ON c.id_compra = ic.id_compra
INNER JOIN
    [produto] p ON ic.id_produto = p.id_produto
LEFT JOIN
    [venda] v ON v.id_venda = ic.id_produto
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vwDetalhesItensVenda]
AS
SELECT        v.id_venda AS IDTransacao, iv.id_itens_venda AS IDItemVenda, p.vc_nome AS NomeProduto, iv.it_quantidade AS quantidade, iv.it_valor AS ValorUnitario
FROM            dbo.venda AS v INNER JOIN
                         dbo.itens_venda AS iv ON v.id_venda = iv.id_venda INNER JOIN
                         dbo.produto AS p ON iv.id_produto = p.id_produto
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vwProdutosEmEstoque] AS
SELECT
    id_produto, vc_nome, it_quantidade
FROM produto
WHERE it_quantidade > 0;
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vwValorTotalEstoque] AS
SELECT
    SUM(it_quantidade * it_valor_pago) as ValorTotalEstoque
FROM produto
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vwDetalhesVendas] AS
SELECT
    v.id_venda, v.dt_venda, iv.it_quantidade, p.vc_nome as nome_produto, iv.it_valor


FROM dbo.venda v

INNER JOIN itens_venda iv on v.id_venda = iv.id_venda 
INNER JOIN produto p on iv.id_produto = p.id_produto

GO

