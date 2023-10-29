-- PEOCEDIMIENTOS ALMACENADOS

USE BDCLINICA2023
GO
-- ---------------------------------------------------
--select * from Citas
--select * from Distrito
--select * from Especialidad
--select * from Medicos
--select * from Pacientes

-- ---------LISTAR CAMPOS CODIGO Y NOMBRE DE MEDICOS-----------------------
-- Verificar si el procedimiento almacenado existe
IF OBJECT_ID('sp_ListarMedicos', 'P') IS NOT NULL
BEGIN
    -- Si existe, eliminar el procedimiento almacenado
    DROP PROCEDURE sp_ListarMedicos;
    PRINT 'Procedimiento almacenado eliminado';
END
GO

CREATE PROCEDURE sp_ListarMedicos
AS
BEGIN
    SELECT codmed, nommed
    FROM Medicos
END
GO


 ---------------2---------------
IF OBJECT_ID('sp_ListarAniosCitas', 'P') IS NOT NULL
BEGIN
    -- Si existe, eliminar el procedimiento almacenado
    DROP PROCEDURE sp_ListarAniosCitas;
    PRINT 'Procedimiento almacenado eliminado';
END
GO


CREATE PROCEDURE sp_ListarAniosCitas
AS
BEGIN
    SELECT DISTINCT YEAR(fecha) AS Anio
    FROM Citas
END
GO




-- ------------------3 ---------------------

IF OBJECT_ID('sp_ListarCitasPorMedicoYAnio', 'P') IS NOT NULL
BEGIN
    -- Si existe, eliminar el procedimiento almacenado
    DROP PROCEDURE sp_ListarCitasPorMedicoYAnio;
    PRINT 'Procedimiento almacenado eliminado';
END
GO


CREATE PROCEDURE sp_ListarCitasPorMedicoYAnio
    @CodMedico CHAR(5),
    @Anio INT
AS
BEGIN
    SELECT c.nrocita, c.fecha, c.codpac, p.nompac, c.pago, c.descrip
    FROM Citas c
    INNER JOIN Pacientes p ON c.codpac = p.codpac
    WHERE c.codmed = @CodMedico
        AND YEAR(c.fecha) = @Anio
END
GO

-- ----------------4 ----------------------

IF OBJECT_ID('ListarTodasLasCitas', 'P') IS NOT NULL
BEGIN
    -- Si existe, eliminar el procedimiento almacenado
    DROP PROCEDURE ListarTodasLasCitas;
    PRINT 'Procedimiento almacenado eliminado';
END
GO

CREATE PROCEDURE ListarTodasLasCitas
AS
BEGIN
    SELECT *
    FROM Citas
END
GO


-- ---------------5 ------------
IF OBJECT_ID('ListarMedicos', 'P') IS NOT NULL
BEGIN
    -- Si existe, eliminar el procedimiento almacenado
    DROP PROCEDURE ListarMedicos;
    PRINT 'Procedimiento almacenado eliminado';
END
GO

CREATE PROCEDURE ListarMedicos
AS
BEGIN
    SELECT codmed, nommed
    FROM Medicos
END
GO


-- ------------6 -----------------

IF OBJECT_ID('ListarPacientes', 'P') IS NOT NULL
BEGIN
    -- Si existe, eliminar el procedimiento almacenado
    DROP PROCEDURE ListarPacientes;
    PRINT 'Procedimiento almacenado eliminado';
END
GO

CREATE PROCEDURE ListarPacientes
AS
BEGIN
    SELECT codpac, nompac
    FROM Pacientes
END
GO

-- -------------7 -----------------
IF OBJECT_ID('AgregarCita', 'P') IS NOT NULL
BEGIN
    -- Si existe, eliminar el procedimiento almacenado
    DROP PROCEDURE AgregarCita;
    PRINT 'Procedimiento almacenado eliminado';
END
GO

CREATE PROCEDURE AgregarCita
     -- Número de cita
    @CodMedico CHAR(5),
    @CodPaciente CHAR(6),
    @Tipo INT,
    @Pago DECIMAL(8, 2),
    @Fecha DATETIME,
    @Estado INT,
    @Descrip VARCHAR(400)
AS

DECLARE @nrocita INt
	SELECT @nrocita = ISNULL(MAX(nrocita),0) +1 FROM Citas

    INSERT INTO Citas (nrocita, codmed, codpac, tipo, pago, fecha, estado, descrip)
    VALUES (@nrocita, @CodMedico, @CodPaciente, @Tipo, @Pago, @Fecha, @Estado, @Descrip)
	SELECT @nrocita AS NumeroCita

GO


----------------- 8 -----------------
IF OBJECT_ID('ActualizarCitaPorNroCita', 'P') IS NOT NULL
BEGIN
    -- Si existe, eliminar el procedimiento almacenado
    DROP PROCEDURE ActualizarCitaPorNroCita;
    PRINT 'Procedimiento almacenado eliminado';
END
GO


CREATE PROCEDURE ActualizarCitaPorNroCita
    @NroCita INT,
    @CodMedico CHAR(5),
    @CodPaciente CHAR(6),
    @Tipo INT,
    @Pago DECIMAL(8, 2),
    @Fecha DATETIME,
    @Estado INT,
    @Descrip VARCHAR(400)
AS
BEGIN
    UPDATE Citas
    SET codmed = @CodMedico,
        codpac = @CodPaciente,
        tipo = @Tipo,
        pago = @Pago,
        fecha = @Fecha,
        estado = @Estado,
        descrip = @Descrip
    WHERE nrocita = @NroCita
END
GO
