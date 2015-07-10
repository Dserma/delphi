object frmRel: TfrmRel
  Left = 0
  Top = 0
  Caption = 'Relat'#243'rio'
  ClientHeight = 497
  ClientWidth = 743
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object rel: TRLReport
    Left = 0
    Top = 0
    Width = 794
    Height = 1123
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    object RLBand1: TRLBand
      Left = 38
      Top = 63
      Width = 718
      Height = 19
      BandType = btTitle
      Color = 8880384
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Transparent = False
      object RLLabel1: TRLLabel
        Left = 3
        Top = 0
        Width = 87
        Height = 13
        Caption = 'Representante'
        Transparent = False
      end
      object RLLabel2: TRLLabel
        Left = 468
        Top = 0
        Width = 65
        Height = 13
        Caption = 'Meta Atual'
        Transparent = False
      end
    end
    object RLDetailGrid1: TRLDetailGrid
      Left = 38
      Top = 82
      Width = 718
      Height = 20
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = False
      object txtNome: TRLDBText
        Left = 11
        Top = 3
        Width = 52
        Height = 13
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object txtMeta: TRLDBText
        Left = 480
        Top = 3
        Width = 53
        Height = 13
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
        Text = ''
        BeforePrint = txtMetaBeforePrint
      end
      object RLDraw1: TRLDraw
        Left = 3
        Top = 17
        Width = 694
        Height = 1
      end
    end
    object RLBand2: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 25
      BandType = btHeader
      object RLLabel3: TRLLabel
        Left = 0
        Top = 0
        Width = 718
        Height = 19
        Alignment = taCenter
        Anchors = [fkLeft, fkRight]
        AutoSize = False
        Caption = 'Listagem de Metas atuais - Por Representante'
        Color = 15659228
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = False
      end
    end
  end
  object RLPDFFilter1: TRLPDFFilter
    DisplayName = 'Documento PDF'
    Left = 616
  end
  object RLXLSFilter1: TRLXLSFilter
    DisplayName = 'Planilha Excel'
    Left = 512
  end
end
