SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

	CREATE PROCEDURE [Tests].[test 3 group having]
	AS
	BEGIN
	  ------------------------------------------------------------------
	  -- PROBLEM                                  
	  -- Select employees that were hired in or after the year 2003.
	  -- Groups them by country and the hire year.
	  -- Keeps only groups with more than one employees.
	  ------------------------------------------------------------------
  
	  -- ACT (change the query to make the test pass)
	  SELECT country, YEAR(hiredate) AS yearhired, COUNT(*) AS numemployees
	  INTO #Actual 
	  FROM HR.Employees
	  WHERE hiredate >= '20030101'
	  GROUP BY country, YEAR(hiredate)
	  HAVING count(*) > 1
    
	  -- ASSERT
	  SELECT TOP(0) * INTO #Expected FROM #Actual;
          
	  INSERT INTO #Expected (country, yearhired, numemployees) VALUES ('UK', 2003, 2);
	  INSERT INTO #Expected (country, yearhired, numemployees) VALUES ('UK', 2004, 2);

	  EXEC tSQLt.AssertEqualsTable '#Expected', '#Actual';
	END;

GO
