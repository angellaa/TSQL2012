SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

	CREATE PROCEDURE [Tests].[test_employees_full_names]
	AS
	BEGIN
	  ----------------------------------------------
	  -- Create a stored procedure that returns
	  -- the full names of the employees
	  ----------------------------------------------

	  -- SETUP
      EXEC tSQLt.FakeTable 'HR.Employees';
  
	  INSERT INTO Hr.Employees (firstname, lastname) 
	  VALUES ('Sara', 'Davis'), 
		     ('Don', 'Funk');

	  -- EXECUTE
	  CREATE TABLE #Actual (fullname VARCHAR(31))
	  INSERT INTO #Actual EXEC employees_full_names
    
	  -- VERIFY
	  SELECT TOP(0) * INTO #Expected FROM #Actual;
          
	  INSERT INTO #Expected (fullname) 
	  VALUES ('Sara Davis'), 
			 ('Don Funk');

	  EXEC tSQLt.AssertEqualsTable '#Expected', '#Actual';
	END;



GO
