SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

	CREATE PROCEDURE [Tests].[test 7]
	AS
	BEGIN
	  ------------------------------------------------------------------
	  -- PROBLEM                                  
	  -- Select employees that aren't from WA
	  ------------------------------------------------------------------
  
	  -- ACT (change the query to make the test pass)
	  SELECT firstname, region
	  INTO #Actual 
	  FROM HR.Employees
	  WHERE region <> 'WA' OR region IS NULL
	   
	  -- ASSERT
	  SELECT TOP(0) * INTO #Expected FROM #Actual;
          
	  INSERT INTO #Expected (firstname, region) VALUES ('Sven', NULL);
	  INSERT INTO #Expected (firstname, region) VALUES ('Paul', NULL);
	  INSERT INTO #Expected (firstname, region) VALUES ('Russell', NULL);
	  INSERT INTO #Expected (firstname, region) VALUES ('Zoya', NULL);

	  EXEC tSQLt.AssertEqualsTable '#Expected', '#Actual';
	END;

GO
