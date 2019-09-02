unit MainUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, IdBaseComponent, IdComponent, IdCustomTCPServer,
  IdTCPServer, IdContext, IdThread, IdGlobal, IdExceptionCore, IdSocketHandle,
  ExtCtrls, JPEG
  , IniFiles
  , clLogAcceptor1
  , clThServer
  ;

const
  SHOTWIDTH = 320;
  SHOTHEIGHT = 240;

type
  TRecMainParam = record
    IsLog : boolean;
    Left : Integer;
    Top : Integer;
    Width : Integer;
    Height : Integer;
  end;

type
  TRecMainPointParam = record
    InfoLeft    : Integer;
    InfoTop     : Integer;
    InfoWidth   : Integer;
    InfoHeight  : Integer;
    AcpectRatio : boolean;
  end;

type
  TRecPointParam = record
    IsLog : boolean;
    Enabled : boolean;
    Name : String;
    Address : String;
    StartPort : Integer;
    MonitorNum : Integer;
  end;

type
	TMyForm = class(TCustomForm)
      private
        fIsLog : boolean;
        fEnabled : boolean;
        fLog : TLogAcceptor;
        fName : String;
        fLabel   : array of TLabel;
        fImg     : array of TImage;
//        fTCPServer : array of TIdTCPServer;
        fServer : array of TThServer;
        fAddress     : String;
        fStartPort   : Integer;
        fMonitorNum  : Integer;

        fLastStatus : TIdStatus;
        fCurrStatus : TIdStatus;

        fInfoLeft    : Integer;
        fInfoTop     : Integer;
        fInfoWidth   : Integer;
        fInfoHeight  : Integer;
        fAcpectRatio : boolean;

        procedure fOnReceiveFile(Sender : TObject ; Img : TJPEGImage);
        procedure fDefImgSize;
      public
      	constructor Create(AOwner : TComponent);
         destructor Destroy;
         procedure Init;
         procedure Start;
         property Name : String read fName write fName;
         property IsLog : boolean read fIsLog write fIsLog;
         property Enabled : boolean read fEnabled write fEnabled;
         property Address     : String  read fAddress    write fAddress;
         property StartPort   : Integer read fStartPort  write fStartPort;
         property MonitorNum  : Integer read fMonitorNum write fMonitorNum;
         property InfoLeft    : Integer read fInfoLeft    write fInfoLeft   ;
         property InfoTop     : Integer read fInfoTop     write fInfoTop    ;
         property InfoWidth   : Integer read fInfoWidth   write fInfoWidth  ;
         property InfoHeight  : Integer read fInfoHeight  write fInfoHeight ;
         property AcpectRatio : boolean read fAcpectRatio write fAcpectRatio;

   end;


type
  TForm2 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    M1: TMemo;
    Image1: TImage;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    fIni : TIniFile;
    fLog : TLogAcceptor;
    fRecMainParam : TRecMainParam;
    fRecMainPointParam : TRecMainPointParam;
    fRecPointParam : array of TRecPointParam;
    fCountPoint : Integer;
    fCountMonitor : Integer;
    fPrimaryMonitor : Integer;
    fMyForm : array of TMyForm;

    function fDefIniFileName : String;
    procedure fDefMainParam;
    procedure fDefMainPointParam;
    procedure fDefCountPoint;
    procedure fDefPointParam(Ind : Integer);
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.FormCreate(Sender: TObject);
var
  i : Integer;
  cntEnabled : Integer;
begin
  fIni := TIniFile.Create(fDefIniFileName);
  fDefMainParam;
  fDefMainPointParam;
  if fRecMainParam.IsLog then
    fLog := TLogAcceptor.Create('main' , '');
  fDefCountPoint;
  SetLength(fRecPointParam , fCountPoint);
  SetLength(fMyForm , fCountPoint);
  if cntEnabled = 0 then
    begin
      ShowMessage('No Enabled Point');
      Application.Terminate;
    end;
  for i := 0 to fCountPoint - 1 do
    begin
      fDefPointParam(i);
    end;

  fCountMonitor := Screen.MonitorCount;
  fPrimaryMonitor := Screen.PrimaryMonitor.MonitorNum;
  Left := fRecMainParam.Left;
  Top := Screen.Monitors[fPrimaryMonitor].Height - fRecMainParam.Height;
  Height := fRecMainParam.Height;
  if fRecMainParam.Width <> 0 then
    Width := fRecMainParam.Width
  else
    Width := Screen.PrimaryMonitor.Width;
  Caption := '�������� ���� ��������� ���������������';
  for i := 0 to Length(fMyForm) - 1 do
    begin
      fMyForm[i] := TMyForm.Create(self);
      fMyForm[i].IsLog        := fRecPointParam[i].IsLog;
      fMyForm[i].Enabled      := fRecPointParam[i].Enabled;
      fMyForm[i].Name         := fRecPointParam[i].Name;
      fMyForm[i].Address      := fRecPointParam[i].Address;
      fMyForm[i].StartPort    := fRecPointParam[i].StartPort;
      fMyForm[i].MonitorNum   := fRecPointParam[i].MonitorNum;
      fMyForm[i].Tag          := i + 1;
    end;
end;

procedure TForm2.FormShow(Sender: TObject);
var
i : Integer;
begin
  for i := 0 to Length(fMyForm) - 1 do
    begin
      fMyForm[i] := TMyForm.Create(self);
      fMyForm[i].IsLog        := fRecPointParam[i].IsLog;
      fMyForm[i].Enabled      := fRecPointParam[i].Enabled;
      fMyForm[i].Name         := fRecPointParam[i].Name;
      fMyForm[i].Address      := fRecPointParam[i].Address;
      fMyForm[i].StartPort    := fRecPointParam[i].StartPort;
      fMyForm[i].MonitorNum   := fRecPointParam[i].MonitorNum;
    end;

  for i := 0 to Length(fMyForm) - 1 do
    begin
      fMyForm[i].BorderIcons := [];
      fMyForm[i].DefaultMonitor := dmDesktop;
      fMyForm[i].Position := poDesigned;
      if fRecPointParam[i].MonitorNum <> fPrimaryMonitor then
      	begin
	        fMyForm[i].BoundsRect:=Screen.Monitors[fRecPointParam[i].MonitorNum].WorkareaRect;
         end
      else
  	    begin
      	   fMyForm[i].Top := Screen.Monitors[fRecPointParam[i].MonitorNum].Top;
           fMyForm[i].Left := Screen.Monitors[fRecPointParam[i].MonitorNum].Left;
      	   fMyForm[i].Height := Screen.Monitors[fRecPointParam[i].MonitorNum].Height - Height;
    	     fMyForm[i].Width := Screen.Monitors[fRecPointParam[i].MonitorNum].Width;
         end;
      fMyForm[i].InfoLeft     := fRecMainPointParam.InfoLeft;
      fMyForm[i].InfoTop      := fRecMainPointParam.InfoTop;
      fMyForm[i].InfoWidth    := fRecMainPointParam.InfoWidth;
      fMyForm[i].InfoHeight   := fRecMainPointParam.InfoHeight;
      fMyForm[i].AcpectRatio  := fRecMainPointParam.AcpectRatio;

      fMyForm[i].Visible := true;
      fMyForm[i].Name := fRecPointParam[i].Name;
      fMyForm[i].Init;
      fMyForm[i].Start;
    end;

end;


function TForm2.fDefIniFileName: String;
var
  retVal : String;
  retExt : Integer;
begin
  retVal := Application.ExeName;
  retExt := Pos('.exe',  retVal);
  retVal := Copy(retVal , 1 , retExt) + 'ini';
  Result := retVal;
end;

procedure TForm2.fDefCountPoint;
var
  tmpCnt : Integer;
begin
  tmpCnt := 0;
  while true do
    begin
      if fIni.SectionExists('Point' + IntToStr(tmpCnt + 1)) then
        begin
          Inc(tmpCnt);
        end
      else
        begin
          break;
        end;
    end;
  if tmpCnt = 0 then
    begin
      ShowMessage('No defined Point to VIEW');
      Application.Terminate;
    end;
  fCountPoint := tmpCnt;
end;

procedure TForm2.fDefMainParam;
begin
  fRecMainParam.IsLog           := fIni.ReadBool    ('Main' , 'IsLog' , false);
  fRecMainParam.Left            := fIni.ReadInteger ('Main' , 'Left'  , 0);
  fRecMainParam.Top             := fIni.ReadInteger ('Main' , 'Top'   , 0);
  fRecMainParam.Width           := fIni.ReadInteger ('Main' , 'Width' , 640);
  fRecMainParam.Height          := fIni.ReadInteger ('Main' , 'Height', 480);
end;

procedure TForm2.fDefMainPointParam;
begin
  fRecMainPointParam.InfoLeft     := fIni.ReadInteger('MainPoint' , 'InfoLeft'   , 0);
  fRecMainPointParam.InfoTop      := fIni.ReadInteger('MainPoint' , 'InfoTop'     , 0);
  fRecMainPointParam.InfoWidth    := fIni.ReadInteger('MainPoint' , 'InfoWidth'   , 0);
  fRecMainPointParam.InfoHeight   := fIni.ReadInteger('MainPoint' , 'InfoHeight'  , 150);
  fRecMainPointParam.AcpectRatio  := fIni.ReadBool('MainPoint' , 'AcpectRatio' , true);
end;

procedure TForm2.fDefPointParam(Ind: Integer);
begin
  fRecPointParam[Ind].IsLog          := fIni.ReadBool   ('Point' + IntToStr(Ind + 1) , 'IsLog' , false);
  fRecPointParam[Ind].Enabled        := fIni.ReadBool   ('Point' + IntToStr(Ind + 1) , 'Enabled' , true);
  fRecPointParam[Ind].Name           := fIni.ReadString ('Point' + IntToStr(Ind + 1) , 'Name' , '�� ���������');
  fRecPointParam[Ind].Address        := fIni.ReadString ('Point' + IntToStr(Ind + 1) , 'Address' , '127.0.0.1');
  fRecPointParam[Ind].StartPort      := fIni.ReadInteger('Point' + IntToStr(Ind + 1) , 'StartPort' , 9900);
  fRecPointParam[Ind].MonitorNum     := fIni.ReadInteger('Point' + IntToStr(Ind + 1) , 'MonitorNum' , 0);
end;

{ TMyForm }

constructor TMyForm.Create(AOwner: TComponent);
var
  i: Integer;
begin
   CreateNew(AOwner , 0);
//	inherited Create(AOwner);
  SetLength(fLabel , 5);
  SetLength(fImg , 4);
  SetLength(fServer , 4);
  for i := 0 to Length(fLabel) - 1 do
    begin
     fLabel[i] := TLabel.Create(self);
     fLabel[i].Parent := self;
     fLabel[i].Font.Size := 18;
     fLabel[i].Font.Style := [fsBold];
    end;
  for i := 0 to Length(fImg) - 1 do
    begin
     fImg[i] := TImage.Create(self);
     fImg[i].Parent := self;
    end;
  for i := 0 to Length(fServer) - 1 do
    begin
      fServer[i] := TThServer.Create(i + 1 , true , false , 'Form' + IntToStr(Tag) + '_ThServer_' + IntToStr(i) , '');
      fServer[i].OnReceiveFile := fOnReceiveFile;
    end;
end;

destructor TMyForm.Destroy;
var
i : Integer;
begin
  for i := 0 to Length(fServer) - 1 do
    begin
  if Assigned(fServer[i]) then
    begin
      fServer[i].Destroy;
    end;
    end;
  if Assigned(fLog) then FreeAndNil(fLog);
end;

procedure TMyForm.fDefImgSize;
var
  tmpRatio : Double;
  RatioForm : Double;
  tmpHeight : Integer;
  tmpWidth : Integer;
begin
  tmpRatio := SHOTWIDTH / SHOTHEIGHT;
  RatioForm := Width / (Height - fInfoHeight);
  if RatioForm >= tmpRatio then
    begin
      tmpHeight := Trunc((Height - fInfoHeight) / 2) - 1;
      tmpWidth  := Trunc(tmpHeight * tmpRatio) - 1;
    end
  else
    begin
      tmpWidth  := Trunc(Width / 2) - 1;;
      tmpHeight := Trunc(tmpWidth / tmpRatio) - 1;
    end;
      fImg[0].Top := 0 + fInfoHeight;
      fImg[0].Left := 0;
       fImg[0].Width := tmpWidth - 1;
       fImg[0].Height := tmpHeight - 1;

       fImg[0].Stretch := true;
//     fImg[0].Proportional := true;

       fImg[1].Top := 0 + fInfoHeight;
       fImg[1].Left := tmpWidth + 1;
       fImg[1].Width := tmpWidth - 1;
       fImg[1].Height := tmpHeight - 1;
       fImg[1].Stretch := true;
//     fImg[1].Proportional := true;

       fImg[2].Top := tmpHeight + fInfoHeight + 1;
       fImg[2].Left := 0;
       fImg[2].Width := tmpWidth - 1;
       fImg[2].Height := tmpHeight - 1;
       fImg[2].Stretch := true;
//     fImg[2].Proportional := true;

       fImg[3].Top := tmpHeight + fInfoHeight + 1;
       fImg[3].Left := tmpWidth + 1;
       fImg[3].Width := tmpWidth - 1;
       fImg[3].Height := tmpHeight - 1;
       fImg[3].Stretch := true;
//     fImg[3].Proportional := true;

end;

procedure TMyForm.fOnReceiveFile(Sender: TObject; Img: TJPEGImage);
var
  ind : Integer;
begin
  ind := (Sender as TThServer).Tag - 1;
  fImg[ind].Picture.Assign(Img);
end;

procedure TMyForm.Init;
var
  i : Integer;
  ImgLeft : Integer;
  ImgTop : Integer;
  ImgWidth : Integer;
  ImgHeight : Integer;
begin
  if fIsLog then
    fLog := TLogAcceptor.Create('Point_' + IntToStr(Tag) , '');
  if Assigned(fLog) then fLog.Write('point - ' + IntToStr(Tag) + ' started');

  for i := 0 to Length(fServer) - 1 do
    begin
      fServer[i].Port := fStartPort + i;
    end;

  fLabel[0].Left := fInfoLeft;
  fLabel[0].Top := fInfoTop;
  fLabel[0].AutoSize := true;
  fLabel[0].Caption := fName + '. ' + fAddress;
  InsertControl(fLabel[0]);

  fLabel[1].Left := fLabel[0].Left + fLabel[0].Width + 3;
  fLabel[1].Top := fLabel[0].Top;
  fLabel[1].AutoSize := true;
  fLabel[1].Caption := '����� - ' + '�� ���.';
  fLabel[1].Font.Color := clBlue;
  InsertControl(fLabel[1]);

  fLabel[2].Font.Size := 10;
  fLabel[2].Left := fLabel[0].Left;
  fLabel[2].Top := fLabel[0].Top + fLabel[0].Height + 3;
  fLabel[2].AutoSize := true;
  fLabel[2].Caption := '����. �� ����� - ' + '�� ���.' + '. N/A' + '%';
  InsertControl(fLabel[2]);

  fLabel[3].Font.Size := 10;
  fLabel[3].Left := fLabel[0].Left + fLabel[2].Width + 3;
  fLabel[3].Top := fLabel[2].Top;
  fLabel[3].AutoSize := true;
  fLabel[3].Caption := '����. ������ - ' + '�� ���.' + '. ���. ����� - ' + '�/�';
  fLabel[3].Font.Color := clBlue;
  InsertControl(fLabel[3]);

  fLabel[4].Font.Size := 10;
  fLabel[4].Left := fLabel[3].Left + fLabel[3].Width + 3;
  fLabel[4].Top := fLabel[2].Top;
  fLabel[4].AutoSize := true;
  fLabel[4].Caption := '����. ����. - ' + '�� ���.' + '%';
  InsertControl(fLabel[4]);


  ImgLeft := 0;
  ImgTop := fInfoHeight;
  ImgWidth := Width;
  ImgHeight := Height - fInfoHeight;

  if fAcpectRatio then
    begin
      fDefImgSize;
    end
  else
    begin
      fImg[0].Top := 0 + fInfoHeight;
      fImg[0].Left := 0;
       fImg[0].Width := (Width div 2) - 1;
       fImg[0].Height := ((Height - fInfoHeight) div 2) - 1;

       fImg[0].Stretch := true;
//     fImg[0].Proportional := true;

       fImg[1].Top := 0 + fInfoHeight;
       fImg[1].Left := (Width div 2) + 1;
       fImg[1].Width := (Width div 2) - 1;
       fImg[1].Height := ((Height - fInfoHeight) div 2) - 1;
       fImg[1].Stretch := true;
//     fImg[1].Proportional := true;

       fImg[2].Top := ((Height - fInfoHeight) div 2) + 1;
       fImg[2].Left := 0;
       fImg[2].Width := (Width div 2) - 1;
       fImg[2].Height := ((Height - fInfoHeight) div 2) - 1;
       fImg[2].Stretch := true;
//     fImg[2].Proportional := true;

       fImg[3].Top := ((Height - fInfoHeight) div 2) + 1;
       fImg[3].Left := (Width div 2) + 1;
       fImg[3].Width := (Width div 2) - 1;
       fImg[3].Height := ((Height - fInfoHeight) div 2) - 1;
       fImg[3].Stretch := true;
//     fImg[3].Proportional := true;
    end;

       InsertControl(fImg[0]);
       InsertControl(fImg[1]);
       InsertControl(fImg[2]);
       InsertControl(fImg[3]);

end;

procedure TMyForm.Start;
var
i : Integer;
begin
  for i := 0 to Length(fServer) - 1 do
    begin
      if fServer[i].Suspended then
        fServer[i].Resume;
    end;
end;

end.
