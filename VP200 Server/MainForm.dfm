object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'VP200Server'
  ClientHeight = 305
  ClientWidth = 499
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 120
    Top = 8
    Width = 21
    Height = 13
    Caption = 'Log:'
  end
  object Label2: TLabel
    Left = 120
    Top = 151
    Width = 79
    Height = 13
    Caption = 'Dados recebidos'
  end
  object ButtonStartStop: TButton
    Left = 8
    Top = 32
    Width = 75
    Height = 25
    Caption = 'Iniciar'
    TabOrder = 0
    OnClick = ButtonStartStopClick
  end
  object MemoLog: TMemo
    Left = 120
    Top = 34
    Width = 353
    Height = 95
    TabOrder = 1
  end
  object MemoData: TMemo
    Left = 120
    Top = 170
    Width = 353
    Height = 95
    TabOrder = 2
  end
  object ServerSocket1: TServerSocket
    Active = False
    Port = 9101
    ServerType = stNonBlocking
    OnClientConnect = ServerSocket1ClientConnect
    OnClientDisconnect = ServerSocket1ClientDisconnect
    OnClientRead = ServerSocket1ClientRead
    Left = 24
    Top = 144
  end
end
