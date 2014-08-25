SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

	CREATE PROCEDURE [Tests].[test 2 concat]
	AS
	BEGIN
	  ----------------------------------------------
	  -- PROBLEM                                  
	  -- Select fullname
	  ----------------------------------------------

      EXEC tSQLt.FakeTable 'HR.Employees';
  
	  INSERT INTO Hr.Employees (firstname, lastname) VALUES ('Sara', 'Davis');
	  INSERT INTO Hr.Employees (firstname, lastname) VALUES ('Don', 'Funk');

	  --ACT (change the query to make the test pass)
	  SELECT firstname + ' ' + lastname AS fullname
	  INTO #Actual 
	  FROM HR.Employees;
    
	  -- ASSERT
	  SELECT TOP(0) * INTO #Expected FROM #Actual;
          
	  INSERT INTO #Expected (fullname) VALUES ('Sara Davis');
	  INSERT INTO #Expected (fullname) VALUES ('Don Funk');

	  EXEC tSQLt.AssertEqualsTable '#Expected', '#Actual';
	END;

GO
