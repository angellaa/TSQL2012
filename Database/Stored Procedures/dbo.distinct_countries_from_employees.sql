SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
	CREATE PROCEDURE [dbo].[distinct_countries_from_employees]
	AS
	BEGIN
		SELECT DISTINCT country
		FROM HR.Employees;
	END
GO
