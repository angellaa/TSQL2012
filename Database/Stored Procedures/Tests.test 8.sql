SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

	CREATE PROCEDURE [Tests].[test 8]
	AS
	BEGIN
	  ------------------------------------------------------------------
	  -- PROBLEM                                  
	  -- Select employees by shippeddate
	  ------------------------------------------------------------------
  
      -- Dropping the view because have schemabinding and FakeTable would fail to drop the table
	  DROP VIEW [Sales].[CustOrders]
	  DROP VIEW [Sales].[EmpOrders]
	  DROP VIEW [Sales].[OrderTotalsByYear]
	  DROP VIEW [Sales].[OrderValues]

      EXEC tSQLt.FakeTable 'Sales.Orders';
  
	  INSERT INTO Sales.Orders (orderid, shippeddate) VALUES (1, NULL);
	  INSERT INTO Sales.Orders (orderid, shippeddate) VALUES (2, NULL);

	  DECLARE @dt AS DATETIME = NULL

	  -- ACT (change the query to make the test pass)
	  SELECT orderid
	  INTO #Actual 
	  FROM Sales.Orders
	  WHERE shippeddate = @dt OR (shippeddate IS NULL AND @dt IS NULL)
	   
	  -- ASSERT
	  SELECT TOP(0) * INTO #Expected FROM #Actual;
          
	  INSERT INTO #Expected (orderid) VALUES (1);
	  INSERT INTO #Expected (orderid) VALUES (2);

	  EXEC tSQLt.AssertEqualsTable '#Expected', '#Actual';
	END;

GO
