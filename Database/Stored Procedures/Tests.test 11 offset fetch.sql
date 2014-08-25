SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

	CREATE PROCEDURE [Tests].[test 11 offset fetch]
	AS
	BEGIN
	  ------------------------------------------------------------------
	  -- PROBLEM                                  
	  -- Select 2nd and 3rd category after ordering them by name
	  ------------------------------------------------------------------

	  -- ACT (change the query to make the test pass)
	  SELECT categoryname
	  INTO #Actual 
	  FROM Production.Categories
	  ORDER BY categoryname
	  OFFSET 1 ROWS FETCH next 2 ROWS ONLY

	  -- ASSERT
	  SELECT TOP(0) * INTO #Expected FROM #Actual;
          
	  INSERT INTO #Expected (categoryname) VALUES ('Condiments');
	  INSERT INTO #Expected (categoryname) VALUES ('Confections');

	  EXEC tSQLt.AssertEqualsTable '#Expected', '#Actual';
	END;

GO
