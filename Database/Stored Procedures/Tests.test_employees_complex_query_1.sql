SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

	CREATE PROCEDURE [Tests].[test_employees_complex_query_1]
	AS
	BEGIN
	  ------------------------------------------------------------------
	  -- Create a stored procedure that returns the                                  
	  -- employees that were hired in or after the year 2003.
	  -- Groups them by country and the hire year.
	  -- Keeps only groups with more than one employees.
	  ------------------------------------------------------------------
  
	  CREATE TABLE #Actual
	  (
		country VARCHAR(15),
		yearhired int,
		numemployees int
	  )

	  -- EXECUTE
	  INSERT INTO #Actual EXEC employees_complex_query_1
	      
	  -- ASSERT  
	  SELECT TOP(0) * INTO #Expected FROM #Actual;
          
	  INSERT INTO #Expected (country, yearhired, numemployees) 
	  VALUES ('UK', 2003, 2),
			 ('UK', 2004, 2);

	  EXEC tSQLt.AssertEqualsTable '#Expected', '#Actual';
	END;


GO
