SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

	CREATE PROCEDURE [Tests].[test 4 group having]
	AS
	BEGIN
	  ------------------------------------------------------------------
	  -- PROBLEM                                  
	  -- Select shippers for whom the total freight value is 
	  -- greater than 20000
	  ------------------------------------------------------------------
  
	  -- ACT (change the query to make the test pass)
	  SELECT shipperid, SUM(freight) AS totalfreight
	  INTO #Actual 
	  FROM Sales.Orders
	  GROUP BY shipperid
	  HAVING SUM(freight) > 20000
	   
	  -- ASSERT
	  SELECT TOP(0) * INTO #Expected FROM #Actual;
          
	  INSERT INTO #Expected (shipperid, totalfreight) VALUES (2, 28244.8500);
	  INSERT INTO #Expected (shipperid, totalfreight) VALUES (3, 20512.5100);

	  EXEC tSQLt.AssertEqualsTable '#Expected', '#Actual';
	END;

GO
