SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [Tests].[test_distinct_countries_from_employees]
AS
BEGIN
	------------------------------------------------------------------
	-- Create a stored procedure that returns 
	-- the countries from HR.Employees without duplicates.
	------------------------------------------------------------------

	-- SETUP
	CREATE TABLE #Actual (country nvarchar(15))

	-- EXECUTE
	INSERT INTO #Actual EXEC distinct_countries_from_employees
   
	-- VERIFY    
	SELECT TOP(0) * INTO #Expected FROM #Actual;
	INSERT INTO #Expected (country) VALUES ('UK'), ('USA');
    
	EXEC tSQLt.AssertEqualsTable '#Expected', '#Actual';
END;






GO
