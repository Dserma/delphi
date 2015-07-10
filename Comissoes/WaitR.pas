unit WaitR;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Samples.Gauges, Vcl.StdCtrls,
  Vcl.Imaging.GIFImg, Vcl.ExtCtrls;

type
  TfrmWaitR = class(TForm)
    Panel1: TPanel;
    img: TImage;
    Label1: TLabel;
    bar: TGauge;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmWaitR: TfrmWaitR;

implementation

{$R *.dfm}

procedure TfrmWaitR.FormCreate(Sender: TObject);
begin

  (img.Picture.Graphic as TGIFImage).AnimateLoop:= glEnabled;
  (img.Picture.Graphic as TGIFImage).Animate:= true;

end;

end.
