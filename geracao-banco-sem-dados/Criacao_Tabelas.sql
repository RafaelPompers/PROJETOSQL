USE [master_freios]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[compra](
	[id_compra] [int] IDENTITY(1,1) NOT NULL,
	[dt_compra] [datetime] NULL,
	[it_nota_fiscal] [int] NULL,
	[it_total] [money] NULL,
	[it_numero_parcelas] [int] NULL,
	[vc_status] [varchar](95) NULL,
	[id_fornecedor] [int] NULL,
	[id_tipo_pagamento] [int] NULL,
 CONSTRAINT [XPKcompra] PRIMARY KEY NONCLUSTERED 
(
	[id_compra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[venda](
	[id_venda] [int] IDENTITY(1,1) NOT NULL,
	[dt_venda] [datetime] NULL,
	[it_nota_fiscal] [int] NULL,
	[it_total] [money] NULL,
	[it_numero_parcelas] [int] NULL,
	[vc_status] [varchar](95) NULL,
	[id_cliente] [int] NULL,
	[id_tipo_pagamento] [int] NULL,
	[it_a_vista] [int] NULL,
 CONSTRAINT [XPKvenda] PRIMARY KEY NONCLUSTERED 
(
	[id_venda] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[itens_compra](
	[id_itens_compra] [int] NOT NULL,
	[it_quantidade] [float] NULL,
	[it_valor] [money] NULL,
	[id_compra] [int] NOT NULL,
	[id_produto] [int] NOT NULL,
 CONSTRAINT [XPKitens_compra] PRIMARY KEY NONCLUSTERED 
(
	[id_itens_compra] ASC,
	[id_compra] ASC,
	[id_produto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[produto](
	[id_produto] [int] IDENTITY(1,1) NOT NULL,
	[vc_nome] [varchar](95) NULL,
	[vc_descricao] [text] NULL,
	[pro_foto] [image] NULL,
	[it_valor_pago] [money] NULL,
	[it_valor_venda] [money] NULL,
	[it_quantidade] [float] NULL,
	[id_unidade_medida] [int] NULL,
	[id_categoria] [int] NULL,
	[id_subcategoria] [int] NULL,
 CONSTRAINT [XPKproduto] PRIMARY KEY NONCLUSTERED 
(
	[id_produto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[itens_venda](
	[id_itens_venda] [int] NOT NULL,
	[it_quantidade] [float] NULL,
	[it_valor] [money] NULL,
	[id_venda] [int] NOT NULL,
	[id_produto] [int] NOT NULL,
 CONSTRAINT [XPKitens_venda] PRIMARY KEY NONCLUSTERED 
(
	[id_itens_venda] ASC,
	[id_venda] ASC,
	[id_produto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categoria](
	[id_categoria] [int] IDENTITY(1,1) NOT NULL,
	[vc_nome] [varchar](95) NULL,
 CONSTRAINT [XPKcategoria] PRIMARY KEY NONCLUSTERED 
(
	[id_categoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cliente](
	[id_cliente] [int] IDENTITY(1,1) NOT NULL,
	[vc_nome] [varchar](95) NULL,
	[vc_cpf_cnpj] [varchar](95) NULL,
	[vc_rg_ie] [varchar](95) NULL,
	[vc_razao_social] [varchar](95) NULL,
	[vc_tipo] [varchar](20) NULL,
	[vc_cep] [varchar](20) NULL,
	[vc_endereco] [varchar](95) NULL,
	[vc_bairro] [varchar](95) NULL,
	[vc_fone] [varchar](95) NULL,
	[vc_cel] [varchar](95) NULL,
	[vc_email] [varchar](95) NULL,
	[vc_endereco_numero] [varchar](10) NULL,
	[vc_cidade] [char](18) NULL,
	[vc_estado] [char](18) NULL,
 CONSTRAINT [XPKcliente] PRIMARY KEY NONCLUSTERED 
(
	[id_cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[fornecedor](
	[id_fornecedor] [int] IDENTITY(1,1) NOT NULL,
	[vc_nome] [varchar](95) NULL,
	[vc_razao_social] [varchar](95) NULL,
	[vc_inscricao_estadual] [varchar](95) NULL,
	[vc_cnpj] [varchar](95) NULL,
	[vc_cep] [varchar](95) NULL,
	[vc_endereco] [varchar](95) NULL,
	[vc_bairro] [varchar](95) NULL,
	[vc_fone] [varchar](95) NULL,
	[vc_cel] [varchar](95) NULL,
	[vc_email] [varchar](95) NULL,
	[vc_endereco_numero] [varchar](95) NULL,
	[vc_cidade] [varchar](95) NULL,
	[vc_estado] [varchar](95) NULL,
 CONSTRAINT [XPKfornecedor] PRIMARY KEY NONCLUSTERED 
(
	[id_fornecedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[parcelas_compra](
	[id_parcelas_compra] [int] NOT NULL,
	[it_valor] [money] NULL,
	[dt_pagamento] [date] NULL,
	[dt_vencimento] [date] NULL,
	[id_compra] [int] NOT NULL,
 CONSTRAINT [XPKparcelas_compra] PRIMARY KEY CLUSTERED 
(
	[id_parcelas_compra] ASC,
	[id_compra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[parcelas_venda](
	[id_venda] [int] NOT NULL,
	[id_parcelas_venda] [int] NOT NULL,
	[it_valor] [money] NULL,
	[dt_pagamento] [date] NULL,
	[dt_vencimento] [date] NULL,
 CONSTRAINT [XPKparcelas_venda] PRIMARY KEY CLUSTERED 
(
	[id_venda] ASC,
	[id_parcelas_venda] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[subcategoria](
	[id_subcategoria] [int] IDENTITY(1,1) NOT NULL,
	[vc_nome] [varchar](95) NULL,
	[id_categoria] [int] NULL,
 CONSTRAINT [XPKsubcategoria] PRIMARY KEY NONCLUSTERED 
(
	[id_subcategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipo_pagamento](
	[id_tipo_pagamento] [int] IDENTITY(1,1) NOT NULL,
	[vc_nome] [varchar](90) NULL,
 CONSTRAINT [XPKtipo_pagamento] PRIMARY KEY CLUSTERED 
(
	[id_tipo_pagamento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[unidade_medida](
	[id_unidade_medida] [int] IDENTITY(1,1) NOT NULL,
	[vc_nome] [varchar](95) NULL,
 CONSTRAINT [XPKmedida] PRIMARY KEY NONCLUSTERED 
(
	[id_unidade_medida] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[compra]  WITH CHECK ADD  CONSTRAINT [R_21] FOREIGN KEY([id_fornecedor])
REFERENCES [dbo].[fornecedor] ([id_fornecedor])
GO
ALTER TABLE [dbo].[compra] CHECK CONSTRAINT [R_21]
GO
ALTER TABLE [dbo].[compra]  WITH CHECK ADD  CONSTRAINT [R_24] FOREIGN KEY([id_tipo_pagamento])
REFERENCES [dbo].[tipo_pagamento] ([id_tipo_pagamento])
GO
ALTER TABLE [dbo].[compra] CHECK CONSTRAINT [R_24]
GO
ALTER TABLE [dbo].[itens_compra]  WITH CHECK ADD  CONSTRAINT [R_15] FOREIGN KEY([id_compra])
REFERENCES [dbo].[compra] ([id_compra])
GO
ALTER TABLE [dbo].[itens_compra] CHECK CONSTRAINT [R_15]
GO
ALTER TABLE [dbo].[itens_compra]  WITH CHECK ADD  CONSTRAINT [R_17] FOREIGN KEY([id_produto])
REFERENCES [dbo].[produto] ([id_produto])
GO
ALTER TABLE [dbo].[itens_compra] CHECK CONSTRAINT [R_17]
GO
ALTER TABLE [dbo].[itens_venda]  WITH CHECK ADD  CONSTRAINT [R_13] FOREIGN KEY([id_venda])
REFERENCES [dbo].[venda] ([id_venda])
GO
ALTER TABLE [dbo].[itens_venda] CHECK CONSTRAINT [R_13]
GO
ALTER TABLE [dbo].[itens_venda]  WITH CHECK ADD  CONSTRAINT [R_14] FOREIGN KEY([id_produto])
REFERENCES [dbo].[produto] ([id_produto])
GO
ALTER TABLE [dbo].[itens_venda] CHECK CONSTRAINT [R_14]
GO
ALTER TABLE [dbo].[parcelas_compra]  WITH CHECK ADD  CONSTRAINT [R_25] FOREIGN KEY([id_compra])
REFERENCES [dbo].[compra] ([id_compra])
GO
ALTER TABLE [dbo].[parcelas_compra] CHECK CONSTRAINT [R_25]
GO
ALTER TABLE [dbo].[parcelas_venda]  WITH CHECK ADD  CONSTRAINT [R_22] FOREIGN KEY([id_venda])
REFERENCES [dbo].[venda] ([id_venda])
GO
ALTER TABLE [dbo].[parcelas_venda] CHECK CONSTRAINT [R_22]
GO
ALTER TABLE [dbo].[produto]  WITH CHECK ADD  CONSTRAINT [R_11] FOREIGN KEY([id_categoria])
REFERENCES [dbo].[categoria] ([id_categoria])
GO
ALTER TABLE [dbo].[produto] CHECK CONSTRAINT [R_11]
GO
ALTER TABLE [dbo].[produto]  WITH CHECK ADD  CONSTRAINT [R_12] FOREIGN KEY([id_subcategoria])
REFERENCES [dbo].[subcategoria] ([id_subcategoria])
GO
ALTER TABLE [dbo].[produto] CHECK CONSTRAINT [R_12]
GO
ALTER TABLE [dbo].[produto]  WITH CHECK ADD  CONSTRAINT [R_9] FOREIGN KEY([id_unidade_medida])
REFERENCES [dbo].[unidade_medida] ([id_unidade_medida])
GO
ALTER TABLE [dbo].[produto] CHECK CONSTRAINT [R_9]
GO
ALTER TABLE [dbo].[subcategoria]  WITH CHECK ADD  CONSTRAINT [R_10] FOREIGN KEY([id_categoria])
REFERENCES [dbo].[categoria] ([id_categoria])
GO
ALTER TABLE [dbo].[subcategoria] CHECK CONSTRAINT [R_10]
GO
ALTER TABLE [dbo].[venda]  WITH CHECK ADD  CONSTRAINT [R_20] FOREIGN KEY([id_cliente])
REFERENCES [dbo].[cliente] ([id_cliente])
GO
ALTER TABLE [dbo].[venda] CHECK CONSTRAINT [R_20]
GO
ALTER TABLE [dbo].[venda]  WITH CHECK ADD  CONSTRAINT [R_23] FOREIGN KEY([id_tipo_pagamento])
REFERENCES [dbo].[tipo_pagamento] ([id_tipo_pagamento])
GO
ALTER TABLE [dbo].[venda] CHECK CONSTRAINT [R_23]
GO