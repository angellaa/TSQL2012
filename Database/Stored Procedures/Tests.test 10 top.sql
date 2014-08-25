SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

	CREATE PROCEDURE [Tests].[test 10 top]
	AS
	BEGIN
	  ------------------------------------------------------------------
	  -- PROBLEM                                  
	  -- Select half of the categories after ordering them by name
	  ------------------------------------------------------------------

	  -- ACT (change the query to make the test pass)
	  SELECT TOP 50 PERCENT categoryname
	  INTO #Actual 
	  FROM Production.Categories
	  ORDER BY categoryname

	  -- ASSERT
	  SELECT TOP(0) * INTO #Expected FROM #Actual;
          
	  INSERT INTO #Expected (categoryname) VALUES ('Beverages');
	  INSERT INTO #Expected (categoryname) VALUES ('Condiments');
	  INSERT INTO #Expected (categoryname) VALUES ('Confections');
	  INSERT INTO #Expected (categoryname) VALUES ('Dairy Products');

	  EXEC tSQLt.AssertEqualsTable '#Expected', '#Actual';
	END;

GO
