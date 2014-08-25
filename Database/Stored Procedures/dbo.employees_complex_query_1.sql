SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[employees_complex_query_1]
AS
BEGIN
	SELECT country, YEAR(hiredate) AS yearhired, COUNT(*) AS numemployees
	FROM HR.Employees
	WHERE hiredate >= '20030101'
	GROUP BY country, YEAR(hiredate)
	HAVING count(*) > 1
END
GO
