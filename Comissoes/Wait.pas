unit Wait;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.GIFImg, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Grids, Vcl.Outline;
 
type
  TfrmWait = class(TForm)
    Panel1: TPanel;
    img: TImage;
    Label1: TLabel;
   
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmWait: TfrmWait;

implementation

{$R *.dfm}

procedure TfrmWait.FormCreate(Sender: TObject);
begin

  (img.Picture.Graphic as TGIFImage).AnimateLoop:= glEnabled;
  (img.Picture.Graphic as TGIFImage).Animate:= true;

end;
end.
