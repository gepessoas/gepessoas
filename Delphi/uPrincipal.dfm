object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsNone
  Caption = 'Carga e Descarga'
  ClientHeight = 720
  ClientWidth = 1280
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  DesignSize = (
    1280
    720)
  PixelsPerInch = 96
  TextHeight = 13
  object pnlForms: TRelativePanel
    Left = 60
    Top = 65
    Width = 1220
    Height = 655
    ControlCollection = <>
    Color = clWhite
    ParentBackground = False
    TabOrder = 2
    OnClick = pnlFormsClick
    OnMouseEnter = pnlFormsMouseEnter
  end
  object svMenuLateral: TSplitView
    Left = 0
    Top = 65
    Width = 60
    Height = 655
    Margins.Left = 0
    CloseStyle = svcCompact
    CompactWidth = 60
    Opened = False
    OpenedWidth = 300
    Placement = svpLeft
    TabOrder = 0
    object imgBgMenuLateral: TImage
      Left = 0
      Top = 0
      Width = 300
      Height = 655
      Align = alLeft
      Picture.Data = {
        0A544A504547496D61676556060000FFD8FFE000104A46494600010101006000
        600000FFE100224578696600004D4D002A000000080001011200030000000100
        01000000000000FFDB0043000201010201010202020202020202030503030303
        030604040305070607070706070708090B0908080A0807070A0D0A0A0B0C0C0C
        0C07090E0F0D0C0E0B0C0C0CFFDB004301020202030303060303060C0807080C
        0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C
        0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0CFFC000110801D70072030122000211
        01031101FFC4001F000001050101010101010000000000000000010203040506
        0708090A0BFFC400B5100002010303020403050504040000017D010203000411
        05122131410613516107227114328191A1082342B1C11552D1F0243362728209
        0A161718191A25262728292A3435363738393A434445464748494A5354555657
        58595A636465666768696A737475767778797A838485868788898A9293949596
        9798999AA2A3A4A5A6A7A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2
        D3D4D5D6D7D8D9DAE1E2E3E4E5E6E7E8E9EAF1F2F3F4F5F6F7F8F9FAFFC4001F
        0100030101010101010101010000000000000102030405060708090A0BFFC400
        B511000201020404030407050404000102770001020311040521310612415107
        61711322328108144291A1B1C109233352F0156272D10A162434E125F1171819
        1A262728292A35363738393A434445464748494A535455565758595A63646566
        6768696A737475767778797A82838485868788898A92939495969798999AA2A3
        A4A5A6A7A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6D7D8
        D9DAE2E3E4E5E6E7E8E9EAF2F3F4F5F6F7F8F9FAFFDA000C0301000211031100
        3F008E8A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A
        28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A
        28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A
        28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A
        28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A
        28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A
        28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A
        28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A
        28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A
        28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A
        28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A
        28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A
        28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A
        28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A
        28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A
        28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A
        28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A
        28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A
        28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A
        28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A
        28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A
        28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A
        28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A
        28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A
        28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A
        28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A
        28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A
        28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A
        28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A
        28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A
        28A00FFFD9}
      Stretch = True
      OnMouseEnter = imgBgMenuLateralMouseEnter
      ExplicitLeft = -18
      ExplicitTop = 6
    end
    object pnlBotao1: TPanel
      Left = 0
      Top = 0
      Width = 300
      Height = 59
      BevelOuter = bvNone
      BorderWidth = 30
      Color = clGray
      ParentBackground = False
      TabOrder = 0
      OnClick = pnlBotao1Click
      OnMouseEnter = pnlBotao1MouseEnter
      OnMouseLeave = pnlBotao1MouseLeave
      object lblInicio: TLabel
        Left = 68
        Top = 20
        Width = 51
        Height = 24
        Caption = 'In'#237'cio'
        Color = clBackground
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -20
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        OnClick = lblInicioClick
        OnMouseEnter = lblInicioMouseEnter
        OnMouseLeave = lblInicioMouseLeave
      end
      object imgInicio: TImage
        Left = 6
        Top = 7
        Width = 48
        Height = 48
        Picture.Data = {
          0954506E67496D61676589504E470D0A1A0A0000000D49484452000000300000
          003008060000005702F987000000017352474200AECE1CE90000010F49444154
          78DAEDD5E10D82301404E0761347D14D70139C049D04467193FA1A694204A485
          A3AF4DEE12D2F843BD2FD19E3595C76A172040BB0001DA058A0638E73A39DED6
          DA47750029DFCB711D5FB6F2BC04F2AE02F0533E6490E78E46400152FC2247B7
          50FE34040C10513EC497BFA110108094F7A5FB84B7C01087013BCA4FE311831A
          E060F910FF9F78660748F9C67C7FF388B47BB76217601CA80654FE102219B072
          C7C3102671F0920027970F194CC256440112EEF8EC884D8042F9105F7E732BFE
          0240D7E4A988554001E5A7591DBC454061E54316076F06000F143AB3AD88BE46
          05E6723695A251DD0820A034C0D617A33E870002082080000208202027A0D410
          A01D02B4438076AA077C000F4DD4319E64A3920000000049454E44AE426082}
        Stretch = True
        Transparent = True
        OnClick = imgInicioClick
        OnMouseEnter = imgInicioMouseEnter
        OnMouseLeave = imgInicioMouseLeave
      end
      object pnlRiscoBranco1: TPanel
        Left = 288
        Top = 7
        Width = 3
        Height = 48
        BevelOuter = bvNone
        Color = clWhite
        ParentBackground = False
        TabOrder = 0
        Visible = False
        OnClick = pnlRiscoBranco1Click
      end
    end
    object pnlBotao2: TPanel
      Left = 0
      Top = 62
      Width = 300
      Height = 59
      BevelOuter = bvNone
      BorderWidth = 30
      Color = clGray
      ParentBackground = False
      TabOrder = 1
      OnClick = pnlBotao2Click
      OnMouseEnter = pnlBotao2MouseEnter
      OnMouseLeave = pnlBotao2MouseLeave
      object lblCadastro: TLabel
        Left = 68
        Top = 20
        Width = 86
        Height = 24
        Caption = 'Cadastro'
        Color = clBackground
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -20
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        OnClick = lblCadastroClick
        OnMouseEnter = lblCadastroMouseEnter
        OnMouseLeave = lblCadastroMouseLeave
      end
      object imgCadastro: TImage
        Left = 6
        Top = 7
        Width = 48
        Height = 48
        Picture.Data = {
          0954506E67496D61676589504E470D0A1A0A0000000D49484452000000300000
          003008060000005702F987000000017352474200AECE1CE9000001B749444154
          78DAEDD95D7283201000E0E526E424352729394993933437A93D49B8895D461E
          ACFCBB8B48EBCE38BC24B09F2E8A28A0F310AD133801AD13380C609A2689CD3B
          1E727568FB136D8F6FD30A21C6E68045D2CA265B1206F344C86377C022F13B65
          700E483100931FB0F962489C055204C0E43F80E7ACB321B20198BC39EB43C5E4
          9761103736C0CEC9172192801DCA2616F75439450115276C6E683C1E88786E05
          BCA0FCFECE8E40C0A518402D1D1CF457DFD8DF444004E7430C4019901B10BC0A
          5E00C7C4650698F04EE810805CFB1500DEAB10025007AB0130715DAF621D008E
          A3B0F93C28C029231FC024AF0E0A18B1DB6B0AC0B26C6809C89AC0EB04A99109
          7426B2D8D8D109E01AF74F9650F793F8C8006751D7DB83ECB67E37F0012436AF
          83022ED8AD8E02EC60E432AA01F0DD38420005C4326ABD9C96402C236E40E8B6
          1D7B235340B80ACC80E0EE440C2061DE919084815922F6D04CED4A2860B8A512
          C37989C9065844BF1B5B8D11CEB2810290C0F73D802DF96CC002B2C7954896CD
          6680450C304F6CC99CB88679AD3396FCE9FF7D620A4006285F3B911267017830
          06F106F1CFAC9A9A741540AB3801ADA37BC00FA3B12340912CE5C00000000049
          454E44AE426082}
        Stretch = True
        Transparent = True
        OnClick = imgCadastroClick
        OnMouseEnter = imgCadastroMouseEnter
        OnMouseLeave = imgCadastroMouseLeave
      end
      object pnlRiscoBranco2: TPanel
        Left = 288
        Top = 7
        Width = 3
        Height = 48
        BevelOuter = bvNone
        Color = clWhite
        ParentBackground = False
        TabOrder = 0
        Visible = False
        OnClick = pnlRiscoBranco2Click
        OnMouseEnter = pnlRiscoBranco2MouseEnter
        OnMouseLeave = pnlRiscoBranco2MouseLeave
      end
    end
  end
  object pnlTopo: TRelativePanel
    Left = 0
    Top = 0
    Width = 1280
    Height = 65
    ControlCollection = <
      item
        Control = Panel2
        AlignBottomWithPanel = True
        AlignHorizontalCenterWithPanel = True
        AlignLeftWithPanel = False
        AlignRightWithPanel = False
        AlignTopWithPanel = True
        AlignVerticalCenterWithPanel = False
      end
      item
        Control = imgBgLogo
        AlignBottomWithPanel = False
        AlignHorizontalCenterWithPanel = False
        AlignLeftWithPanel = False
        AlignRightWithPanel = False
        AlignTopWithPanel = False
        AlignVerticalCenterWithPanel = False
      end
      item
        Control = imgBgTopo
        AlignBottomWithPanel = True
        AlignHorizontalCenterWithPanel = True
        AlignLeftWithPanel = True
        AlignRightWithPanel = True
        AlignTopWithPanel = True
        AlignVerticalCenterWithPanel = True
      end
      item
        Control = Label1
        AlignBottomWithPanel = False
        AlignHorizontalCenterWithPanel = False
        AlignLeftWithPanel = False
        AlignRightWithPanel = False
        AlignTopWithPanel = False
        AlignVerticalCenterWithPanel = False
      end
      item
        Control = Label2
        AlignBottomWithPanel = False
        AlignHorizontalCenterWithPanel = False
        AlignLeftWithPanel = False
        AlignRightWithPanel = False
        AlignTopWithPanel = False
        AlignVerticalCenterWithPanel = False
      end
      item
        Control = RelativePanel1
        AlignBottomWithPanel = True
        AlignHorizontalCenterWithPanel = False
        AlignLeftWithPanel = False
        AlignRightWithPanel = True
        AlignTopWithPanel = True
        AlignVerticalCenterWithPanel = False
      end>
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      1280
      65)
    object Panel2: TPanel
      Left = 376
      Top = 0
      Width = 528
      Height = 65
      Align = alCustom
      Anchors = []
      BevelOuter = bvNone
      TabOrder = 0
    end
    object imgBgLogo: TImage
      Left = 1
      Top = -494
      Width = 300
      Height = 559
      Align = alLeft
      Anchors = []
      Picture.Data = {
        0A544A504547496D616765AF030000FFD8FFE000104A46494600010101006000
        600000FFE100224578696600004D4D002A000000080001011200030000000100
        01000000000000FFDB0043000201010201010202020202020202030503030303
        030604040305070607070706070708090B0908080A0807070A0D0A0A0B0C0C0C
        0C07090E0F0D0C0E0B0C0C0CFFDB004301020202030303060303060C0807080C
        0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C
        0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0CFFC0001108004E00D6030122000211
        01031101FFC4001F000001050101010101010000000000000000010203040506
        0708090A0BFFC400B5100002010303020403050504040000017D010203000411
        05122131410613516107227114328191A1082342B1C11552D1F0243362728209
        0A161718191A25262728292A3435363738393A434445464748494A5354555657
        58595A636465666768696A737475767778797A838485868788898A9293949596
        9798999AA2A3A4A5A6A7A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2
        D3D4D5D6D7D8D9DAE1E2E3E4E5E6E7E8E9EAF1F2F3F4F5F6F7F8F9FAFFC4001F
        0100030101010101010101010000000000000102030405060708090A0BFFC400
        B511000201020404030407050404000102770001020311040521310612415107
        61711322328108144291A1B1C109233352F0156272D10A162434E125F1171819
        1A262728292A35363738393A434445464748494A535455565758595A63646566
        6768696A737475767778797A82838485868788898A92939495969798999AA2A3
        A4A5A6A7A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6D7D8
        D9DAE2E3E4E5E6E7E8E9EAF2F3F4F5F6F7F8F9FAFFDA000C0301000211031100
        3F00FCABA28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800
        A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800
        A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800
        A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800
        A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800
        A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800
        A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800
        A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800
        A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2803FFD9}
      Stretch = True
    end
    object imgBgTopo: TImage
      Left = 0
      Top = 0
      Width = 1280
      Height = 65
      Align = alTop
      Anchors = []
      Picture.Data = {
        0A544A504547496D61676517030000FFD8FFE000104A46494600010101006000
        600000FFE100224578696600004D4D002A000000080001011200030000000100
        01000000000000FFDB0043000201010201010202020202020202030503030303
        030604040305070607070706070708090B0908080A0807070A0D0A0A0B0C0C0C
        0C07090E0F0D0C0E0B0C0C0CFFDB004301020202030303060303060C0807080C
        0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C
        0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0CFFC0001108003D0072030122000211
        01031101FFC4001F000001050101010101010000000000000000010203040506
        0708090A0BFFC400B5100002010303020403050504040000017D010203000411
        05122131410613516107227114328191A1082342B1C11552D1F0243362728209
        0A161718191A25262728292A3435363738393A434445464748494A5354555657
        58595A636465666768696A737475767778797A838485868788898A9293949596
        9798999AA2A3A4A5A6A7A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2
        D3D4D5D6D7D8D9DAE1E2E3E4E5E6E7E8E9EAF1F2F3F4F5F6F7F8F9FAFFC4001F
        0100030101010101010101010000000000000102030405060708090A0BFFC400
        B511000201020404030407050404000102770001020311040521310612415107
        61711322328108144291A1B1C109233352F0156272D10A162434E125F1171819
        1A262728292A35363738393A434445464748494A535455565758595A63646566
        6768696A737475767778797A82838485868788898A92939495969798999AA2A3
        A4A5A6A7A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6D7D8
        D9DAE2E3E4E5E6E7E8E9EAF2F3F4F5F6F7F8F9FAFFDA000C0301000211031100
        3F00F86E8A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A002
        8A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A002
        8A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A002
        8A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A002
        8A28A00FFFD9}
      Stretch = True
    end
    object Label1: TLabel
      Left = 53
      Top = 19
      Width = 48
      Height = 24
      Anchors = []
      Caption = 'Talen'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -20
      Font.Name = 'Roboto'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 107
      Top = 25
      Width = 59
      Height = 15
      Anchors = []
      Caption = 'Softwares'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -13
      Font.Name = 'Roboto'
      Font.Style = []
      ParentFont = False
    end
    object RelativePanel1: TRelativePanel
      Left = 1176
      Top = 0
      Width = 104
      Height = 65
      ControlCollection = <
        item
          Control = imgMinimizar
          AlignBottomWithPanel = False
          AlignHorizontalCenterWithPanel = False
          AlignLeftWithPanel = False
          AlignRightWithPanel = False
          AlignTopWithPanel = False
          AlignVerticalCenterWithPanel = False
        end
        item
          Control = imgFechar
          AlignBottomWithPanel = False
          AlignHorizontalCenterWithPanel = False
          AlignLeftWithPanel = False
          AlignRightWithPanel = False
          AlignTopWithPanel = False
          AlignVerticalCenterWithPanel = False
        end>
      Anchors = []
      BevelOuter = bvNone
      TabOrder = 1
      DesignSize = (
        104
        65)
      object imgMinimizar: TImage
        Left = 15
        Top = 17
        Width = 34
        Height = 34
        Anchors = []
        Picture.Data = {
          0954506E67496D61676589504E470D0A1A0A0000000D49484452000000220000
          002208060000003A470BC2000000017352474200AECE1CE90000004B49444154
          78DAEDD2B11100101483611992759C7518F2B182C2C5F1A74999AF88D225911B
          000408102040805821119157D5439B4DD2D881F4439002E41988FFAC8E000102
          04081020DF40263B681E23A5CB1A2F0000000049454E44AE426082}
        Stretch = True
        Transparent = True
        OnClick = imgMinimizarClick
      end
      object imgFechar: TImage
        Left = 55
        Top = 17
        Width = 34
        Height = 34
        Anchors = []
        Picture.Data = {
          0954506E67496D61676589504E470D0A1A0A0000000D49484452000000220000
          002208060000003A470BC2000000017352474200AECE1CE90000016A49444154
          78DAEDD6516E83300C066072137693ED24A527193B09F424ED4DC64D982305C9
          32B67F274C6D1F8884104DED7C40E290BA3769E9D580137208B2AE6B4FA7CF94
          D25C939CE2BEE974A3B8E530A420A60CA163A4A43F41448E19E8C8882F844920
          19476C0D6218626B10939C641A0262144408938C641291831F62801D46418CE5
          BA47981DC4405C29F85126DFA86114448E994BBE3BC26890A140B63653D095F5
          EF3065901DC28B914FD37A356EA0D2CF9B44B837E6420E609A102EA40123FBC2
          0808A9C0F4621E552142900806FC1722C290284659C221442D040E52F3E49A20
          5AC5AC7835214C64B2AA1553F42F6069430C5ABE08E12DDF2A8C57D01022F74D
          22AC196395F816C4218CB6E9A102261119B88018F7C62C48DF19DBB65731AD1B
          28F97ED9EF79627F445F8D86993B50318D4F047EAD224C8881E1CDAC98CE2782
          8970210E06966D05E3222044C184F70E8681881084612ED17D8363FE75AF7946
          3B216F0BF903B92856329AFBB3BF0000000049454E44AE426082}
        Stretch = True
        Transparent = True
        OnClick = imgFecharClick
      end
    end
  end
  object pnlMenu1: TPanel
    Left = 299
    Top = 126
    Width = 185
    Height = 124
    Anchors = []
    BevelOuter = bvNone
    TabOrder = 3
    Visible = False
    OnMouseEnter = pnlMenu1MouseEnter
    object imgMenu1: TImage
      Left = -2
      Top = 0
      Width = 200
      Height = 121
      Picture.Data = {
        0A544A504547496D61676517030000FFD8FFE000104A46494600010101006000
        600000FFE100224578696600004D4D002A000000080001011200030000000100
        01000000000000FFDB0043000201010201010202020202020202030503030303
        030604040305070607070706070708090B0908080A0807070A0D0A0A0B0C0C0C
        0C07090E0F0D0C0E0B0C0C0CFFDB004301020202030303060303060C0807080C
        0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C
        0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0CFFC0001108003D0072030122000211
        01031101FFC4001F000001050101010101010000000000000000010203040506
        0708090A0BFFC400B5100002010303020403050504040000017D010203000411
        05122131410613516107227114328191A1082342B1C11552D1F0243362728209
        0A161718191A25262728292A3435363738393A434445464748494A5354555657
        58595A636465666768696A737475767778797A838485868788898A9293949596
        9798999AA2A3A4A5A6A7A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2
        D3D4D5D6D7D8D9DAE1E2E3E4E5E6E7E8E9EAF1F2F3F4F5F6F7F8F9FAFFC4001F
        0100030101010101010101010000000000000102030405060708090A0BFFC400
        B511000201020404030407050404000102770001020311040521310612415107
        61711322328108144291A1B1C109233352F0156272D10A162434E125F1171819
        1A262728292A35363738393A434445464748494A535455565758595A63646566
        6768696A737475767778797A82838485868788898A92939495969798999AA2A3
        A4A5A6A7A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6D7D8
        D9DAE2E3E4E5E6E7E8E9EAF2F3F4F5F6F7F8F9FAFFDA000C0301000211031100
        3F00F86E8A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A002
        8A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A002
        8A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A002
        8A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A002
        8A28A00FFFD9}
      Stretch = True
      OnMouseEnter = imgMenu1MouseEnter
    end
    object pnlCargos: TPanel
      Left = 0
      Top = 1
      Width = 185
      Height = 41
      Alignment = taLeftJustify
      Caption = '  Solicita'#231#245'es'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clInactiveBorder
      Font.Height = -20
      Font.Name = ']'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = pnlCargosClick
      OnMouseEnter = pnlCargosMouseEnter
      OnMouseLeave = pnlCargosMouseLeave
      object pnlLinhaArmazem: TPanel
        Left = 176
        Top = 5
        Width = 3
        Height = 31
        BevelOuter = bvNone
        Color = clWhite
        ParentBackground = False
        TabOrder = 0
        Visible = False
      end
    end
    object pnlPessoa: TPanel
      Left = 0
      Top = 42
      Width = 185
      Height = 41
      Alignment = taLeftJustify
      Caption = '  Pessoas'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clInactiveBorder
      Font.Height = -20
      Font.Name = ']'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = pnlPessoaClick
      OnMouseEnter = pnlPessoaMouseEnter
      OnMouseLeave = pnlPessoaMouseLeave
      object pnlLinhaCliente: TPanel
        Left = 176
        Top = 5
        Width = 3
        Height = 31
        BevelOuter = bvNone
        Color = clWhite
        ParentBackground = False
        TabOrder = 0
        Visible = False
        OnClick = pnlLinhaClienteClick
      end
    end
    object pnlMotorista: TPanel
      Left = 0
      Top = 83
      Width = 185
      Height = 41
      Alignment = taLeftJustify
      Caption = '  Cargos'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clInactiveBorder
      Font.Height = -20
      Font.Name = ']'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = pnlMotoristaClick
      OnMouseEnter = pnlMotoristaMouseEnter
      OnMouseLeave = pnlMotoristaMouseLeave
      object pnlLinhaMotorista: TPanel
        Left = 176
        Top = 5
        Width = 3
        Height = 31
        BevelOuter = bvNone
        Color = clWhite
        ParentBackground = False
        TabOrder = 0
        Visible = False
      end
    end
  end
  object Conexao: TADOConnection
    ConnectionString = 'FILE NAME=C:\Gincana\ge_pessoas.udl'
    LoginPrompt = False
    Provider = 'C:\Gincana\ge_pessoas.udl'
    Left = 832
    Top = 568
  end
end
