object frmPedido: TfrmPedido
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Confer'#234'ncia de Pedidos - Gerenciamento de Comiss'#245'es'
  ClientHeight = 426
  ClientWidth = 622
  Color = 15659228
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 622
    Height = 426
    Align = alClient
    Caption = 'Panel1'
    ParentColor = True
    TabOrder = 0
    object cxGroupBox1: TcxGroupBox
      Left = 5
      Top = 1
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.LookAndFeel.Kind = lfFlat
      Style.LookAndFeel.NativeStyle = False
      Style.TextColor = 8880384
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 0
      Transparent = True
      Height = 105
      Width = 612
      object lblC: TLabel
        Left = 143
        Top = 41
        Width = 5
        Height = 13
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 8880384
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblDt: TLabel
        AlignWithMargins = True
        Left = 13
        Top = 60
        Width = 82
        Height = 13
        Caption = 'Data Emiss'#227'o:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblD: TLabel
        Left = 143
        Top = 60
        Width = 5
        Height = 13
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 8880384
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label1: TLabel
        AlignWithMargins = True
        Left = 13
        Top = 81
        Width = 122
        Height = 13
        Caption = 'Prazo de Pagamento:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblP: TLabel
        AlignWithMargins = True
        Left = 143
        Top = 81
        Width = 5
        Height = 13
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 8880384
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        AlignWithMargins = True
        Left = 13
        Top = 20
        Width = 41
        Height = 13
        Caption = 'Status:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblS: TLabel
        Left = 143
        Top = 20
        Width = 5
        Height = 13
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 8880384
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object cxLabel1: TcxLabel
        AlignWithMargins = True
        Left = 11
        Top = 39
        Caption = 'Cliente:'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = []
        Style.TextColor = -1
        Style.TextStyle = [fsBold]
        Style.IsFontAssigned = True
        Transparent = True
      end
    end
    object cxGroupBox2: TcxGroupBox
      Left = 5
      Top = 112
      Caption = '  Itens  '
      Style.LookAndFeel.Kind = lfFlat
      Style.TextColor = 8880384
      Style.TextStyle = [fsBold]
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.Kind = lfFlat
      TabOrder = 1
      Transparent = True
      DesignSize = (
        612
        305)
      Height = 305
      Width = 612
      object gridI: TcxGrid
        AlignWithMargins = True
        Left = 5
        Top = 16
        Width = 602
        Height = 284
        Margins.Left = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Anchors = [akLeft, akRight, akBottom]
        TabOrder = 0
        object tableI: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <
            item
              Format = '0 Produto(s)'
              Kind = skCount
              Column = fProduto
            end
            item
              Format = 'R$ ,0.00'
              Kind = skSum
              Column = fVltotal
            end>
          DataController.Summary.SummaryGroups = <>
          OptionsData.CancelOnExit = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsSelection.CellSelect = False
          OptionsSelection.InvertSelect = False
          OptionsView.ColumnAutoWidth = True
          OptionsView.Footer = True
          OptionsView.GroupByBox = False
          Styles.Background = cxStyle1
          Styles.Content = cxStyle2
          Styles.ContentEven = cxStyle3
          Styles.Footer = cxStyle4
          Styles.GroupByBox = cxStyle5
          Styles.Header = cxStyle4
          object fProduto: TcxGridDBColumn
            Caption = 'Produto'
            Width = 245
          end
          object fVlunitario: TcxGridDBColumn
            Caption = 'Vl. unit'#225'rio'
            Width = 124
          end
          object fQuantidade: TcxGridDBColumn
            Caption = 'Quantidade'
            Width = 122
          end
          object fVltotal: TcxGridDBColumn
            Caption = 'Vl. total'
            Width = 124
          end
        end
        object gridILevel1: TcxGridLevel
          GridView = tableI
        end
      end
    end
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 576
    Top = 192
    PixelsPerInch = 96
    object cxStyle1: TcxStyle
      AssignedValues = [svColor]
      Color = clWhite
    end
    object cxStyle2: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
    end
    object cxStyle3: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 15659228
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
    end
    object cxStyle4: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 551147945
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clMaroon
    end
    object cxStyle5: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 15659228
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Verdana'
      Font.Style = []
      TextColor = clMaroon
    end
  end
end
