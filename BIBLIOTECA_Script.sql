
CREATE PROCEDURE  RegistrarPrestamo
	@CODIGO_USUARIO INT,
	@CODIGO_EJEMPLAR INT,
	@FECHA_DEVOLUCION DATE
AS
BEGIN
	INSERT INTO BIBLIOTECA.USUARIO_EJEMPLAR(CODIGO_USUARIO, CODIGO_EJEMPLAR, FECHA_PRESTAMO, FECHA_DEVOLUCION)
	VALUES(
		@CODIGO_USUARIO, @CODIGO_EJEMPLAR,GETDATE(),@FECHA_DEVOLUCION
	)
END

ALTER PROCEDURE RegistrarPrestamo
    @CODIGO_USUARIO INT,
    @CODIGO_EJEMPLAR INT,
    @FECHA_DEVOLUCION DATE = NULL 
AS
BEGIN
    INSERT INTO BIBLIOTECA.USUARIO_EJEMPLAR(CODIGO_USUARIO, CODIGO_EJEMPLAR, FECHA_PRESTAMO, FECHA_DEVOLUCION)
    VALUES(
        @CODIGO_USUARIO, 
        @CODIGO_EJEMPLAR, 
        GETDATE(), 
        @FECHA_DEVOLUCION  
    )
END





	USE IF4000_BIBLIOTECA_LAB5


ALTER PROCEDURE BuscarLibro
    @Id_Libro INT = NULL,             -- Parámetro opcional para el ID
    @Titulo NVARCHAR(255) = NULL, -- Parámetro opcional para el nombre
	@Isbn NVARCHAR(20) = NULL,   -- Parámetro opcional para el ISBN
	@Paginas INT = NULL,
    @Editorial NVARCHAR(255) = NULL -- Parámetro opcional para la editorial
    
AS
BEGIN
    -- Inicia la consulta
    SELECT 
	[CODIGO_LIBRO], [TITULO], [ISBN], [PAGINAS], [EDITORIAL]
    FROM BIBLIOTECA.LIBRO
    WHERE 
        (@Id_Libro IS NULL OR CODIGO_LIBRO = @Id_Libro)  -- Si el parámetro id es NULL, no se usa para la comparación
        AND (@Titulo IS NULL OR TITULO LIKE '%' + @Titulo + '%')  -- Si el parámetro nombre es NULL, no se filtra
		AND (@Isbn IS NULL OR ISBN LIKE '%'+ @Isbn +'%')
		AND (@Paginas IS NULL OR PAGINAS = @Paginas) -- Si el parámetro isbn es NULL, no se filtra
        AND (@Editorial IS NULL OR EDITORIAL LIKE '%' + @Editorial + '%') -- Similar para la editorial
        
END




CREATE PROCEDURE ActualizarAutor

	@Codigo INT,
	@NombreAutor VARCHAR(100)
	AS
	BEGIN

		IF NOT EXISTS (SELECT 1 FROM BIBLIOTECA.AUTOR WHERE CODIGO=@Codigo)
		BEGIN
				PRINT('NO EXISTE UN AUTOR CON EL IDENTIFICADOR PROPORCIONADO')
				RETURN
		END

		UPDATE BIBLIOTECA.AUTOR
		SET  NOMBRE =@NombreAutor
		WHERE CODIGO=@Codigo
		PRINT('El autor a sido actualizado exitosamente')
	END



ALTER PROCEDURE EliminarEstudiante
@CodigoEstudiante INT
AS
BEGIN
	IF NOT EXISTS(SELECT 1 FROM BIBLIOTECA.USUARIO WHERE CODIGO_USUARIO = @CodigoEstudiante)
	BEGIN
	PRINT('EL ESTUDIANTE SELECCIONADO NO EXISTE')
	RETURN
	END

    DELETE FROM BIBLIOTECA.USUARIO_EJEMPLAR
    WHERE CODIGO_USUARIO = @CodigoEstudiante;

    -- Eliminar el estudiante de la tabla USUARIO
    DELETE FROM BIBLIOTECA.USUARIO
    WHERE CODIGO_USUARIO = @CodigoEstudiante;

    PRINT 'Estudiante y sus registros asociados han sido eliminados exitosamente'

END