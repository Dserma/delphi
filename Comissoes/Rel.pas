unit Rel;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RLReport, RLFilters, RLPDFFilter,
  RLPreviewForm, RLXLSFilter;

type
  TfrmRel = class(TForm)
    rel: TRLReport;
    RLBand1: TRLBand;
    RLPDFFilter1: TRLPDFFilter;
    RLXLSFilter1: TRLXLSFilter;
    RLDetailGrid1: TRLDetailGrid;
    txtNome: TRLDBText;
    txtMeta: TRLDBText;
    RLDraw1: TRLDraw;
    RLBand2: TRLBand;
    RLLabel1: TRLLabel;
    RLLabel2: TRLLabel;
    RLLabel3: TRLLabel;
    procedure txtMetaBeforePrint(Sender: TObject; var Text: string;
      var PrintIt: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRel: TfrmRel;

implementation

{$R *.dfm}

procedure TfrmRel.txtMetaBeforePrint(Sender: TObject; var Text: string;
  var PrintIt: Boolean);
begin

  if text <> '' then
  begin

    text := formatcurr('R$ ,0.00', strtocurr(text));

  end;

end;

end.
