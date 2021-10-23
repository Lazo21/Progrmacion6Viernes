DROP TABLE IF EXISTS #InquilinoTemp

SELECT 
Id_TipoInquilino, Descripcion, Estado INTO #InquilinoTemp
FROM(
VALUES
(1, 'FISICO',0 ),
(2, 'JURIDICO',1)
)AS TEMP (Id_TipoInquilino, Descripcion, Estado)

----ACTUALIZAR DATOS---
UPDATE T SET 
 T.Descripcion= TM.Descripcion,
 T.Estado= TM.Estado
 FROM Dbo.TipoInquilino T
 INNER JOIN #InquilinoTemp TM
 ON T.Id_TipoInquilino= TM.Id_TipoInquilino

 ----INSERTAR DATOS---
 SET IDENTITY_INSERT dbo.TipoInquilino ON

 INSERT INTO dbo.TipoInquilino(
Id_TipoInquilino, Descripcion,Estado)
SELECT
Id_TipoInquilino, Descripcion, Estado
FROM #InquilinoTemp

EXCEPT
SELECT
Id_TipoInquilino, Descripcion, Estado
FROM dbo.TipoInquilino


SET IDENTITY_INSERT dbo.TipoInquilino OFF

GO
