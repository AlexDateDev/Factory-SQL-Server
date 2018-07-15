' -----------------------------------------------------------------------------
'                                       DTT 1.2.1.3  (c)2013 FSL - FreeSoftLand
'  Title: Insert desde select
'
'  Date : 25/04/2013
'  By   : Type here your name or nickname.
' -----------------------------------------------------------------------------

INSERT [dbo].[Juzgado]
    ( [IdEstado],[FechaInicio],    [Descripcion],[IdOrganoJudicial] )
        SELECT 1, '01/04/2013', 'JUZGADO DE LO MERCANTIL Nº 1 DE BARCELONA',[Id]  FROM [OrganosJudiciales] WHERE [Codigo] = '0801947001'
GO


insert  into tb_destino select * from tb_origen
