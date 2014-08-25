SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [dbo].[Evaluate] (@expression varchar(max), @result INT OUTPUT)
AS 
BEGIN
	DECLARE @input AS varchar(max) = LTRIM(RTRIM(@expression))	
	DECLARE @j AS INT = CHARINDEX(')', @input)

	IF @j = 0 
	BEGIN
		DECLARE @op1 AS INT; DECLARE @op2 AS INT
		DECLARE @mul AS INT = CHARINDEX('*', @input)
		if @mul <> 0 
		BEGIN
			SET @op1 = CAST(SUBSTRING(@input, 1, @mul - 1) AS INT)
			SET @op2 = CAST(SUBSTRING(@input, @mul + 1, LEN(@input)) AS INT)
			SET @result = @op1 * @op2
		END
		DECLARE @plus AS INT = CHARINDEX('+', @input)
		if @plus <> 0 
		BEGIN
			SET @op1 = CAST(SUBSTRING(@input, 1, @plus - 1) AS INT)
			SET @op2 = CAST(SUBSTRING(@input, @plus + 1, LEN(@input)) AS INT)
			SET @result = @op1 + @op2
		END
	END ELSE 
	BEGIN
		DECLARE @i AS INT = LEN(@input) - CHARINDEX('(', REVERSE(@input), LEN(@input) - @j) + 1
		DECLARE @sub AS varchar(max) = SUBSTRING(@input, @i + 1, @j - @i - 1)
	
		DECLARE @res AS INT
		EXEC Evaluate @sub, @res OUTPUT

		SET @input = CONCAT(SUBSTRING(@input, 1, @i - 1), @res, SUBSTRING(@input, @j + 1, LEN(@input)))
		SELECT @input

		EXEC Evaluate @input, @result OUTPUT
	END
END
GO
