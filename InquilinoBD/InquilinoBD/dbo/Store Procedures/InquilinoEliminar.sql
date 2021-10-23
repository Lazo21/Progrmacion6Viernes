﻿CREATE PROCEDURE [dbo].[InquilinoEliminar]
    @Id_TipoInquilino int

    AS BEGIN
    SET NOCOUNT ON 

        BEGIN TRANSACTION TRAS

    BEGIN TRY
           DELETE FROM dbo.TipoInquilino WHERE Id_TipoInquilino= @Id_TipoInquilino

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
