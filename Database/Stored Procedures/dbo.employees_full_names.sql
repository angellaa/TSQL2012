SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[employees_full_names]
AS
BEGIN
	SELECT firstname + ' ' + lastname AS fullname
	FROM HR.Employees;
END
GO
