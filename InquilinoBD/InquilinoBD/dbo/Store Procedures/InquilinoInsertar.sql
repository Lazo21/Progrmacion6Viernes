CREATE PROCEDURE [dbo].[InquilinoInsertar]
    @Id_TipoInquilino int, 
	@Descripcion VARCHAR(250),
	@Estado Bit

AS BEGIN
SET NOCOUNT ON

  BEGIN TRANSACTION TRAS

     BEGIN TRY

	 INSERT INTO dbo.TipoInquilino
	 (
	  Id_TipoInquilino,
	  Descripcion,
	  Estado
	 )
	 VALUES
	 (
	  @Id_TipoInquilino,
      @Descripcion,
	  @Estado
	 )

	 COMMIT TRANSACTION TRAS
	 SELECT 0 AS CodeError, '' AS MsgError

	 END TRY

	 BEGIN CATCH

	   SELECT 

	     ERROR_NUMBER() AS CodeError,
		 ERROR_MESSAGE() AS MsgError

		 ROLLBACK TRANSACTION TRAS

     END CATCH

END
	
