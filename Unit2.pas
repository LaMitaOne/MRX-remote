unit Unit2;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Objects, IdBaseComponent, IdComponent,
  IdUDPBase, IdUDPServer, IdUDPClient, FMX.PhoneDialer.Android, FMX.PhoneDialer,
  System.Rtti, Androidapi.Helpers,
  FMX.Edit,fmx.Platform, IdGlobal, IdSocketHandle, FMX.Layouts;


type
  TForm2 = class(TForm)
    IdUDPClient1: TIdUDPClient;
    Layout1: TLayout;
    Image10: TImage;
    Image13: TImage;
    Image16: TImage;
    Image6: TImage;
    Image8: TImage;
    Text15: TText;
    Text17: TText;
    Text4: TText;
    Text6: TText;
    Text8: TText;
    Layout3: TLayout;
    Text10: TText;
    Text11: TText;
    Text12: TText;
    TrackBar1: TTrackBar;
    TrackBar2: TTrackBar;
    TrackBar3: TTrackBar;
    Text13: TText;
    TrackBar4: TTrackBar;
    Layout4: TLayout;
    Layout2: TLayout;
    Image11: TImage;
    Image15: TImage;
    Image7: TImage;
    Image9: TImage;
    Text16: TText;
    Text5: TText;
    Text7: TText;
    Text9: TText;
    Image2: TImage;
    Text1: TText;
    Image3: TImage;
    Image1: TImage;
    Image5: TImage;
    Text2: TText;
    Text3: TText;
    Text14: TText;
    edtSearch: TEdit;
    Image4: TImage;
    Image12: TImage;
    Layout5: TLayout;
    Text18: TText;
    Image14: TImage;
    imgRLYClose: TImage;
    btnRLYClose: TText;
    Text19: TText;
    procedure Text2Click(Sender: TObject);
    procedure Text3Click(Sender: TObject);
    procedure Text4Click(Sender: TObject);
    procedure Text5Click(Sender: TObject);
    procedure Text6Click(Sender: TObject);
    procedure Text7Click(Sender: TObject);
    procedure Text8Click(Sender: TObject);
    procedure Text9Click(Sender: TObject);
    procedure TrackBar1Change(Sender: TObject);
    procedure TrackBar2Change(Sender: TObject);
    procedure TrackBar3Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Text17Click(Sender: TObject);
    procedure Text15Click(Sender: TObject);
    procedure Text16Click(Sender: TObject);
    procedure Text1Click(Sender: TObject);
    procedure IdUDPServer1UDPRead(AThread: TIdUDPListenerThread;
      const AData: TIdBytes; ABinding: TIdSocketHandle);
    procedure TrackBar4Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Image12Click(Sender: TObject);
    procedure Text18Click(Sender: TObject);
    procedure btnRLYCloseClick(Sender: TObject);
    procedure Text19Click(Sender: TObject);
  private
    { Private-Deklarationen }
    FPhoneDialerService: IFMXPhoneDialerService;
    procedure DetectIsCallStateChanged(const ACallID: string; const ACallState: TCallState);
  public
    { Public-Deklarationen }
  end;

var
  Form2: TForm2;

implementation

{$R *.fmx}

procedure TForm2.FormCreate(Sender: TObject);
begin
   TPlatformServices.Current.SupportsPlatformService(IFMXPhoneDialerService, IInterface(FPhoneDialerService));
    if Assigned(FPhoneDialerService) then
    begin
      FPhoneDialerService.OnCallStateChanged := DetectIsCallStateChanged;
    end;
end;


procedure TForm2.FormShow(Sender: TObject);
begin
  //IdUDPClient1.Send('192.168.0.255', 1777, 'MRGETTITLE');
  //IdUDPClient1.Send('192.168.0.255', 1777, 'MRGETPOSITION');
end;

procedure TForm2.IdUDPServer1UDPRead(AThread: TIdUDPListenerThread;
  const AData: TIdBytes; ABinding: TIdSocketHandle);
//var
//  CommandText : String;
//  OutText : String;
begin
{
  CommandText := bytestostring(AData);

  if Pos('MRXVRTITEL',CommandText) <> 0 then begin
    OutText := StringReplace(CommandText, 'MRXVRTITEL', '', [rfReplaceAll]);
    txtActPlaying.Text := OutText;
  end;


  if Pos('MRPOSITION',CommandText) <> 0 then begin
    OutText := StringReplace(CommandText, 'MRPOSITION', '', [rfReplaceAll]);

  end;  }

end;

procedure TForm2.Image12Click(Sender: TObject);
begin
  IdUDPClient1.Send('192.168.0.255', 1777, 'MRSEARCH' + edtSearch.Text);
end;

procedure TForm2.btnRLYCloseClick(Sender: TObject);
begin
  IdUDPClient1.Send('192.168.0.255', 1777, 'MRCLOSE');
  imgRLYClose.Visible := False;
end;

procedure TForm2.DetectIsCallStateChanged(const ACallID: string; const ACallState: TCallState);
begin
  case ACallState of
        //TCallState.None:
        //TCallState.Connected:
        //TCallState.Dialing:
        //TCallState.Disconnected:
    TCallState.Disconnected:
      begin
         IdUDPClient1.Send('192.168.0.255', 1777, 'MRPLAYANDROID');
      end;
    TCallState.Incoming:
      begin
         IdUDPClient1.Send('192.168.0.255', 1777, 'MRPAUSECALL');
      end;
  end;
end;

procedure TForm2.Text15Click(Sender: TObject);
begin
  IdUDPClient1.Send('192.168.0.255', 1777, 'MRASPECT');
end;

procedure TForm2.Text16Click(Sender: TObject);
begin
  IdUDPClient1.Send('192.168.0.255', 1777, 'MRSUBNEXT');
end;

procedure TForm2.Text17Click(Sender: TObject);
begin
  IdUDPClient1.Send('192.168.0.255', 1777, 'MRFULLSCREEN');
end;

procedure TForm2.Text18Click(Sender: TObject);
begin
  IdUDPClient1.Send('192.168.0.255', 1777, 'MRSWITCHSP');
end;

procedure TForm2.Text19Click(Sender: TObject);
begin
  imgRLYClose.Visible := False;
end;

procedure TForm2.Text1Click(Sender: TObject);
begin
  imgRLYClose.Visible := True;
end;

procedure TForm2.Text2Click(Sender: TObject);
begin
  IdUDPClient1.Send('192.168.0.255', 1777, 'MRPLAY');
end;

procedure TForm2.Text3Click(Sender: TObject);
begin
  IdUDPClient1.Send('192.168.0.255', 1777, 'MRSTOP');
end;

procedure TForm2.Text4Click(Sender: TObject);
begin
  IdUDPClient1.Send('192.168.0.255', 1777, 'MRBACKWARD');
end;

procedure TForm2.Text5Click(Sender: TObject);
begin
  IdUDPClient1.Send('192.168.0.255', 1777, 'MRFORWARD');
end;

procedure TForm2.Text6Click(Sender: TObject);
begin
  IdUDPClient1.Send('192.168.0.255', 1777, 'MRREPEAT');
end;

procedure TForm2.Text7Click(Sender: TObject);
begin
  IdUDPClient1.Send('192.168.0.255', 1777, 'MRAUDIONEXT');
end;

procedure TForm2.Text8Click(Sender: TObject);
begin
  IdUDPClient1.Send('192.168.0.255', 1777, 'MRFOLDERBACKWARD');
end;

procedure TForm2.Text9Click(Sender: TObject);
begin
  IdUDPClient1.Send('192.168.0.255', 1777, 'MRFOLDERFORWARD');
end;

procedure TForm2.TrackBar1Change(Sender: TObject);
begin
  IdUDPClient1.Send('192.168.0.255', 1777, 'MRSETZOOM' + inttostr(Trunc(Trackbar1.Value)));
end;

procedure TForm2.TrackBar2Change(Sender: TObject);
begin
  IdUDPClient1.Send('192.168.0.255', 1777, 'MRSETVOL' + inttostr(Trunc(TrackBar2.Value)));
end;

procedure TForm2.TrackBar3Change(Sender: TObject);
begin
  IdUDPClient1.Send('192.168.0.255', 1777, 'MRSETPOS' + inttostr(Trunc(TrackBar3.Value)));
end;

procedure TForm2.TrackBar4Change(Sender: TObject);
begin
  IdUDPClient1.Send('192.168.0.255', 1777, 'MRSETSPEED' + inttostr(Trunc(TrackBar4.Value)));
end;

end.
