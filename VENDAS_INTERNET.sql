CREATE OR ALTER VIEW VENDAS_INTERNET AS
SELECT
  fis.SalesOrdeLineNumber AS 'Nº PEDIDO',
  fis.OrdeDate AS 'DATA PEDIDO',
  dpc.EnglisProductCategoryName AS 'CATEGORIA PRODUTO',
  dpc.EnglishProductCategoryName AS 'NOME CLIENTE',
  SalesTerritoryCountry AS 'PAÍS',
  fis.OrderQuantity AS ' QTD. VENDIDA',
  fis.SalesAmount AS 'RECEITA VENDA'
FROM FactInternetSales fis
INNER JOIN DimProduct dp ON fis.ProductKey = dp.ProductKey
    INNER JOIN DimProductSubcategory dps ON dp.ProductSubcategoryKey = dps.ProductSubcategoryKey
INNER JOIN DimCustomer dc ON fis.CustomerKey = dc.CustomerKey
INNER JOIN DimSalesTerritory dts ON fis.SalesTerritoryKey = dst.SalesTerritoryKey
WHERE YEAR(OrderDate) = 2013

SELECT * FROM VENDAS_INTERNET
