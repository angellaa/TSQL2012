SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

	CREATE PROCEDURE [Tests].[test 9]
	AS
	BEGIN
	  ------------------------------------------------------------------
	  -- PROBLEM                                  
	  -- Select employees whose last name starts with D
	  ------------------------------------------------------------------

	  -- ACT (change the query to make the test pass)
	  SELECT lastname
	  INTO #Actual 
	  FROM Hr.Employees
	  WHERE lastname LIKE 'D%' 
	  -- ASSERT
	  SELECT TOP(0) * INTO #Expected FROM #Actual;
          
	  INSERT INTO #Expected (lastname) VALUES ('Davis');
	  INSERT INTO #Expected (lastname) VALUES ('Dolgopyatova');

	  EXEC tSQLt.AssertEqualsTable '#Expected', '#Actual';
	END;

GO
