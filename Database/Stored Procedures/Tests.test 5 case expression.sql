SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

	CREATE PROCEDURE [Tests].[test 5 case expression]
	AS
	BEGIN
	  ------------------------------------------------------------------
	  -- PROBLEM                                  
	  -- Select shippers for whom the total freight value is 
	  -- greater than 20000
	  ------------------------------------------------------------------
  
      EXEC tSQLt.FakeTable 'Production.Products';
  
	  INSERT INTO Production.Products (productid, discontinued) VALUES (1, 0);
	  INSERT INTO Production.Products (productid, discontinued) VALUES (2, 1);
	  INSERT INTO Production.Products (productid, discontinued) VALUES (3, NULL);

	  -- ACT (change the query to make the test pass)
	  SELECT productid, discontinued,
		CASE discontinued WHEN 0 THEN 'No' WHEN 1 THEN 'Yes' ELSE 'Unknown' END AS discontinued_description
	  INTO #Actual 
	  FROM Production.Products
	   
	  -- ASSERT
	  SELECT TOP(0) * INTO #Expected FROM #Actual;
          
	  INSERT INTO #Expected (productid, discontinued, discontinued_description) VALUES (1, 0, 'No');
	  INSERT INTO #Expected (productid, discontinued, discontinued_description) VALUES (2, 1, 'Yes');
	  INSERT INTO #Expected (productid, discontinued, discontinued_description) VALUES (3, NULL, 'Unknown');

	  EXEC tSQLt.AssertEqualsTable '#Expected', '#Actual';
	END;

GO
