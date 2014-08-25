SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

	CREATE PROCEDURE [Tests].[test 6 string manipulation]
	AS
	BEGIN
	  ------------------------------------------------------------------
	  -- PROBLEM                                  
	  -- Select 
	  ------------------------------------------------------------------
  
      EXEC tSQLt.FakeTable 'Production.Products';
  
	  INSERT INTO Production.Products (productid) VALUES (1);
	  INSERT INTO Production.Products (productid) VALUES (123456789);

	  -- ACT (change the query to make the test pass)
	  SELECT RIGHT(REPLICATE('0', 10) + CAST(productid AS VARCHAR(10)), 10) AS str_productid
	  INTO #Actual 
	  FROM Production.Products
	   
	  -- ASSERT
	  SELECT TOP(0) * INTO #Expected FROM #Actual;
          
	  INSERT INTO #Expected (str_productid) VALUES ('0000000001');
	  INSERT INTO #Expected (str_productid) VALUES ('0123456789');

	  EXEC tSQLt.AssertEqualsTable '#Expected', '#Actual';
	END;

GO
