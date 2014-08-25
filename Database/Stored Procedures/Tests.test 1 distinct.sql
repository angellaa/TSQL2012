SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
	CREATE PROCEDURE [Tests].[test 1 distinct]
	AS
	BEGIN
	  ----------------------------------------------
	  -- PROBLEM                                  
	  -- Select the coutries without duplicates   
	  ----------------------------------------------

	  --ACT (change the query to make the test pass)
	  SELECT DISTINCT country
	  INTO #Actual
	  FROM HR.Employees;
    
	  -- ASSERT
	  SELECT TOP(0) * INTO #Expected FROM #Actual;
	    
	  INSERT INTO #Expected (country) VALUES ('UK');
	  INSERT INTO #Expected (country) VALUES ('USA');
    
	  EXEC tSQLt.AssertEqualsTable '#Expected', '#Actual';
	END;
GO
