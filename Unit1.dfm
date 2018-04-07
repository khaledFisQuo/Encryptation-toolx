object Form1: TForm1
  Left = 218
  Top = 345
  BiDiMode = bdLeftToRight
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Encryption Tool by khaled FisQuo'
  ClientHeight = 141
  ClientWidth = 348
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  ParentBiDiMode = False
  PixelsPerInch = 96
  TextHeight = 13
  object edt1: TEdit
    Left = 8
    Top = 24
    Width = 329
    Height = 21
    Color = clScrollBar
    TabOrder = 0
  end
  object btn1: TButton
    Left = 160
    Top = 96
    Width = 89
    Height = 25
    Caption = 'Encode'
    TabOrder = 1
    OnClick = btn1Click
  end
  object cbb1: TComboBox
    Left = 16
    Top = 104
    Width = 105
    Height = 23
    Hint = '|Reverse '#13#10'StrToHex'
    Color = clScrollBar
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial Rounded MT Bold'
    Font.Style = []
    ItemHeight = 15
    ParentFont = False
    TabOrder = 2
    Text = 'Choose'
    Items.Strings = (
      'Reverse '
      'StrToHex'
      'Encode64'
      'Encode XOR')
  end
  object edt2: TEdit
    Left = 8
    Top = 60
    Width = 329
    Height = 21
    Color = clScrollBar
    TabOrder = 3
  end
end
