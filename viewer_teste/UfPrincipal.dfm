object fPrincipal: TfPrincipal
  Left = 233
  Top = 197
  Width = 515
  Height = 316
  Caption = 'Teste Viewer PACS'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 507
    Height = 289
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Esperados'
      object Label1: TLabel
        Left = 17
        Top = 11
        Width = 71
        Height = 19
        Caption = '-patientid'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 17
        Top = 47
        Width = 142
        Height = 19
        Caption = '-accessionnumber'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 17
        Top = 81
        Width = 34
        Height = 19
        Caption = '-crm'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 17
        Top = 117
        Width = 20
        Height = 19
        Caption = '-uf'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label5: TLabel
        Left = 17
        Top = 153
        Width = 81
        Height = 19
        Caption = '-password'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label6: TLabel
        Left = 199
        Top = 11
        Width = 4
        Height = 19
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label7: TLabel
        Left = 199
        Top = 47
        Width = 4
        Height = 19
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label8: TLabel
        Left = 199
        Top = 81
        Width = 4
        Height = 19
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label9: TLabel
        Left = 199
        Top = 117
        Width = 4
        Height = 19
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label10: TLabel
        Left = 199
        Top = 153
        Width = 4
        Height = 19
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label11: TLabel
        Left = 20
        Top = 222
        Width = 4
        Height = 16
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label12: TLabel
        Left = 20
        Top = 244
        Width = 59
        Height = 13
        Caption = 'Par'#226'metros: '
      end
      object Label13: TLabel
        Left = 92
        Top = 244
        Width = 38
        Height = 13
        Caption = 'Label13'
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Todos'
      ImageIndex = 1
      object ListBox1: TListBox
        Left = 12
        Top = 8
        Width = 465
        Height = 241
        ItemHeight = 13
        TabOrder = 0
      end
    end
  end
end
