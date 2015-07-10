unit WaitI;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Samples.Gauges, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Imaging.GIFImg;

type
  TfrmWaitI = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    lblV: TLabel;
    bar: TGauge;
    img: TImage;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmWaitI: TfrmWaitI;

implementation

{$R *.dfm}

procedure TfrmWaitI.FormCreate(Sender: TObject);
begin

  (img.Picture.Graphic as TGIFImage).AnimateLoop:= glEnabled;
  (img.Picture.Graphic as TGIFImage).Animate:= true;

end;

end.
