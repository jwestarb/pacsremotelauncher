object MainForm: TMainForm
  Left = 415
  Top = 298
  Width = 706
  Height = 385
  Caption = 'Remote Launcher PACS Viewer'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object TopPanel: TPanel
    Left = 0
    Top = 0
    Width = 698
    Height = 29
    Align = alTop
    TabOrder = 0
    object BtnClose: TSpeedButton
      Left = 4
      Top = 4
      Width = 23
      Height = 22
      Hint = 'Close'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00330000000000
        03333377777777777F333301111111110333337F333333337F33330111111111
        0333337F333333337F333301111111110333337F333333337F33330111111111
        0333337F333333337F333301111111110333337F333333337F33330111111111
        0333337F3333333F7F333301111111B10333337F333333737F33330111111111
        0333337F333333337F333301111111110333337F33FFFFF37F3333011EEEEE11
        0333337F377777F37F3333011EEEEE110333337F37FFF7F37F3333011EEEEE11
        0333337F377777337F333301111111110333337F333333337F33330111111111
        0333337FFFFFFFFF7F3333000000000003333377777777777333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = BtnCloseClick
    end
    object BtnMinimize: TSpeedButton
      Left = 32
      Top = 4
      Width = 23
      Height = 22
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333033333
        33333333373F33333333333330B03333333333337F7F33333333333330F03333
        333333337F7FF3333333333330B00333333333337F773FF33333333330F0F003
        333333337F7F773F3333333330B0B0B0333333337F7F7F7F3333333300F0F0F0
        333333377F73737F33333330B0BFBFB03333337F7F33337F33333330F0FBFBF0
        3333337F7333337F33333330BFBFBFB033333373F3333373333333330BFBFB03
        33333337FFFFF7FF3333333300000000333333377777777F333333330EEEEEE0
        33333337FFFFFF7FF3333333000000000333333777777777F33333330000000B
        03333337777777F7F33333330000000003333337777777773333}
      NumGlyphs = 2
      OnClick = Esconder1Click
    end
  end
  object PageControl: TPageControl
    Left = 0
    Top = 29
    Width = 698
    Height = 329
    ActivePage = TabLog
    Align = alClient
    TabOrder = 1
    object TabLog: TTabSheet
      Caption = 'Log'
      object Log: TMemo
        Left = 0
        Top = 0
        Width = 690
        Height = 301
        Align = alClient
        TabOrder = 0
      end
    end
    object TabTest: TTabSheet
      Caption = 'Teste'
      ImageIndex = 1
      object Label3: TLabel
        Left = 96
        Top = 36
        Width = 43
        Height = 13
        Caption = '-patientid'
      end
      object Label4: TLabel
        Left = 52
        Top = 64
        Width = 86
        Height = 13
        Caption = '-accessionnumber'
      end
      object Label5: TLabel
        Left = 116
        Top = 92
        Width = 20
        Height = 13
        Caption = '-crm'
      end
      object Label6: TLabel
        Left = 124
        Top = 120
        Width = 12
        Height = 13
        Caption = '-uf'
      end
      object Label7: TLabel
        Left = 92
        Top = 148
        Width = 48
        Height = 13
        Caption = '-password'
      end
      object edPac: TEdit
        Left = 148
        Top = 32
        Width = 121
        Height = 21
        TabOrder = 0
        Text = '670754'
      end
      object edAcNum: TEdit
        Left = 148
        Top = 60
        Width = 121
        Height = 21
        TabOrder = 1
        Text = '6547315'
      end
      object edCrm: TEdit
        Left = 148
        Top = 88
        Width = 121
        Height = 21
        TabOrder = 2
        Text = '1808'
      end
      object edUf: TEdit
        Left = 148
        Top = 116
        Width = 121
        Height = 21
        TabOrder = 3
        Text = 'SC'
      end
      object edPass: TEdit
        Left = 148
        Top = 144
        Width = 121
        Height = 21
        TabOrder = 4
        Text = 'bar123'
      end
      object BitBtn2: TBitBtn
        Left = 148
        Top = 188
        Width = 137
        Height = 25
        Caption = 'Executar Viewer'
        TabOrder = 5
        OnClick = BitBtn2Click
        Kind = bkRetry
      end
    end
    object TabConfig: TTabSheet
      Caption = 'Config'
      ImageIndex = 2
      object Label1: TLabel
        Left = 69
        Top = 32
        Width = 28
        Height = 13
        Caption = 'Porta:'
      end
      object Label2: TLabel
        Left = 32
        Top = 60
        Width = 66
        Height = 13
        Caption = 'PACS Viewer:'
      end
      object edPort: TEdit
        Left = 104
        Top = 28
        Width = 57
        Height = 21
        TabOrder = 0
        Text = '8088'
      end
      object edViewer: TEdit
        Left = 104
        Top = 56
        Width = 293
        Height = 21
        TabOrder = 1
        Text = '.\viewer_teste\viewer.exe'
      end
      object BitBtn1: TBitBtn
        Left = 104
        Top = 121
        Width = 75
        Height = 25
        Caption = 'Salvar'
        TabOrder = 2
        OnClick = BitBtn1Click
        Kind = bkOK
      end
      object ckInitWin: TCheckBox
        Left = 104
        Top = 88
        Width = 201
        Height = 17
        Caption = 'Iniciar automaticamente no Logon'
        TabOrder = 3
      end
    end
  end
  object TrayIcon: TCoolTrayIcon
    CycleInterval = 0
    Hint = 'PACS Remote Launcher'
    Icon.Data = {
      0000010001002020100000000000E80200001600000028000000200000004000
      0000010004000000000080020000000000000000000000000000000000000000
      000000008000008000000080800080000000800080008080000080808000C0C0
      C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF009999
      999999999999999999999999999994444F00F40F444444444444444444499C44
      4F00F40F444444444444444444499CC44F0F0F0F444444440000004444499CCC
      4F0F0F0F444440008888880044499CCCCF04F00F444008888888888804499CCC
      CF00000F4008F8F8F8F8888804499CCCCF04F00F0F8F88888888800004499CCC
      CF0F0040F8F8F8F8F800078804499CCCCCF0040F8F888F880077787804499CCC
      CCCFC0F8F8F8F8F00787878044499CCCCCCC0F8F8F8F80070878788044499CCC
      CCC0F8F8F8F807770787880444499CCCCCC0FFFF8F8077780878780444499CCC
      CC08F8F8F80F77870787804444499CCCCC0FFF8F80F0F7780878044444499CCC
      C0F8F8F8078F0F870787044444499CCCC0FF8FF07777F0F80880444444499CCC
      C0F8F8F077878F0F0804444444499CCC0FFFFF07777878F00044444444499CCC
      0FF8F000000000000F4F444444499CCC0FFFF07778787880F0F0F44444499CCC
      0FF807878787870CCF00F44444499CCC0FFF0778787870CCF000F44444499CCC
      0FF8078787800CCCCFFF0F4444499CCC0FF07878780CCCCCCCCCFF4444499CCC
      C0F0777700CCCCCCCCCCCC4444499CCCC0F07700CCCCCCCCCCCCCCC444499CCC
      CC0000CCCCCCCCCCCCCCCCCC44499CCCCCCCCCCCCCCCCCCCCCCCCCCCC4499CCC
      CCCCCCCCCCCCCCCCCCCCCCCCCC49999999999999999999999999999999990000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000}
    IconVisible = True
    IconIndex = 0
    PopupMenu = PopupMenu
    MinimizeToTray = True
    Left = 576
    Top = 60
  end
  object PopupMenu: TPopupMenu
    Left = 616
    Top = 61
    object Abrir1: TMenuItem
      Caption = 'Abrir'
      Default = True
      OnClick = Abrir1Click
    end
    object Esconder1: TMenuItem
      Caption = 'Esconder'
      OnClick = Esconder1Click
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object Sair1: TMenuItem
      Caption = 'Sair'
      OnClick = BtnCloseClick
    end
  end
  object HTTPServer: TIdHTTPServer
    Bindings = <>
    CommandHandlers = <>
    DefaultPort = 8088
    Greeting.NumericCode = 0
    MaxConnectionReply.NumericCode = 0
    ReplyExceptionCode = 0
    ReplyTexts = <>
    ReplyUnknownCommand.NumericCode = 0
    OnCommandGet = HTTPServerCommandGet
    Left = 652
    Top = 61
  end
end
