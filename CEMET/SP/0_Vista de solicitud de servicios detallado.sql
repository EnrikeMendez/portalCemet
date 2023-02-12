USE [ph11756620532_]
GO

/****** Object:  View [usr_qa].[VSolicitud_Servicio_Detallado]    Script Date: 12/02/2023 05:04:56 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [usr_qa].[VSolicitud_Servicio_Detallado]
AS
SELECT        ss.SOL_Folio, ss.SOL_Id, ss.SOL_CTS_Id, cts.CTS_Descripcion, ss.SOL_NOR_Id, cnr.CNR_Norma, cnr.CNR_Descripcion, ss.SOL_CCA_Id, cca.CCA_Descripcion, ss.SOL_CPA_Id, cpa.CPA_Clave, cpa.CPA_Nombre, 
                         ss.SOL_CMR_Id, cmr.CMR_Descripcion, ss.SOL_CME_Id, cme.CME_Descripcion, ss.SOL_CDH_Id, cdh.CDH_Descripcion, eel.EEL_CVO_Id, cvo.CVO_Clave, cvo.CVO_Descripcion, rssa.CSA_Id, csa.CSA_Descripcion, css.CSS_Id,
                          css.CSS_Descripcion, cta.CTA_Id, cta.CTA_Monto, ss.SOL_Subtotal, ss.SOL_Iva, ss.SOL_Total, ss.SOL_Referencia_Certificacion, ss.SOL_Dsc_Producto, ss.SOL_Marca, ss.SOL_Modelo, ss.SOL_Calibre, 
                         ss.SOL_Observaciones, ss.SOL_Activo, ss.SOL_FechaCreacion, ss.SOL_USU_Id_Creacion, ss.SOL_FechaModificacion, ss.SOL_USU_Id_Modificacion
FROM            dbo.Solicitud_Servicio AS ss INNER JOIN
                         dbo.CTipo_Servicio AS cts ON ss.SOL_CTS_Id = cts.CTS_Id LEFT OUTER JOIN
                         dbo.CNorma_Referencia AS cnr ON ss.SOL_NOR_Id = cnr.CNR_Clave LEFT OUTER JOIN
                         dbo.CCategoria AS cca ON ss.SOL_CCA_Id = cca.CCA_Id LEFT OUTER JOIN
                         dbo.RSolicitud_Metodo_Prueba AS rsmp ON ss.SOL_Id = rsmp.SOL_Id LEFT OUTER JOIN
                         dbo.CMetodo_Prueba AS cmp ON rsmp.CMP_Id = cmp.CMP_Id LEFT OUTER JOIN
                         dbo.CPais AS cpa ON ss.SOL_CPA_Id = cpa.CPA_Id LEFT OUTER JOIN
                         dbo.CModalidad_Recoleccion AS cmr ON ss.SOL_CMR_Id = cmr.CMR_Id LEFT OUTER JOIN
                         dbo.CModalidad_Entrega AS cme ON ss.SOL_CME_Id = cme.CME_Id LEFT OUTER JOIN
                         dbo.CDias_Habiles AS cdh ON ss.SOL_CDH_Id = cdh.CDH_Id LEFT OUTER JOIN
                         dbo.Solicitud_Especificaciones_Electricas AS eel ON ss.SOL_Id = eel.EEL_SOL_Id LEFT OUTER JOIN
                         dbo.CVoltaje AS cvo ON eel.EEL_CVO_Id = cvo.CVO_Id LEFT OUTER JOIN
                         dbo.RSolicitud_Servicio_Adicional AS rssa ON ss.SOL_Id = rssa.SOL_Id LEFT OUTER JOIN
                         dbo.CServicio_Adicional AS csa ON rssa.CSA_Id = csa.CSA_Id LEFT OUTER JOIN
                         dbo.Solicitud_Cotizacion AS coti ON ss.SOL_Id = coti.COT_SOL_Id LEFT OUTER JOIN
                         dbo.CServicio_Solicitado AS css ON coti.COT_CSS_Id = css.CSS_Id LEFT OUTER JOIN
                         dbo.CTarifa AS cta ON coti.COT_CTA_Id = cta.CTA_Id
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "ss"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 280
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "cts"
            Begin Extent = 
               Top = 6
               Left = 318
               Bottom = 136
               Right = 544
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "cnr"
            Begin Extent = 
               Top = 6
               Left = 582
               Bottom = 136
               Right = 812
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "cca"
            Begin Extent = 
               Top = 6
               Left = 850
               Bottom = 136
               Right = 1080
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "rsmp"
            Begin Extent = 
               Top = 6
               Left = 1118
               Bottom = 102
               Right = 1288
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "cmp"
            Begin Extent = 
               Top = 102
               Left = 1118
               Bottom = 232
               Right = 1350
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "cpa"
            Begin Extent = 
               Top = 138
               Left = 38
               Bottom = 268
               Right = 267
            End
            DisplayFlags = 280
            TopColumn = 0
' , @level0type=N'SCHEMA',@level0name=N'usr_qa', @level1type=N'VIEW',@level1name=N'VSolicitud_Servicio_Detallado'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'         End
         Begin Table = "cmr"
            Begin Extent = 
               Top = 138
               Left = 305
               Bottom = 268
               Right = 537
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "cme"
            Begin Extent = 
               Top = 138
               Left = 575
               Bottom = 268
               Right = 806
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "cdh"
            Begin Extent = 
               Top = 138
               Left = 844
               Bottom = 268
               Right = 1075
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "eel"
            Begin Extent = 
               Top = 234
               Left = 1113
               Bottom = 364
               Right = 1283
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "cvo"
            Begin Extent = 
               Top = 270
               Left = 38
               Bottom = 400
               Right = 268
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "rssa"
            Begin Extent = 
               Top = 270
               Left = 306
               Bottom = 366
               Right = 476
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "csa"
            Begin Extent = 
               Top = 270
               Left = 514
               Bottom = 400
               Right = 742
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "coti"
            Begin Extent = 
               Top = 270
               Left = 780
               Bottom = 400
               Right = 950
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "css"
            Begin Extent = 
               Top = 366
               Left = 988
               Bottom = 496
               Right = 1214
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "cta"
            Begin Extent = 
               Top = 366
               Left = 1252
               Bottom = 496
               Right = 1480
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'usr_qa', @level1type=N'VIEW',@level1name=N'VSolicitud_Servicio_Detallado'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'usr_qa', @level1type=N'VIEW',@level1name=N'VSolicitud_Servicio_Detallado'
GO


