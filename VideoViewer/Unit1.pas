unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs
  , DSPack, DSUtil, DirectShow9,
  clLogAcceptor1, BaseFilterEditor,  ComCtrls,  activex,  ExtCtrls , jpeg,
  clReadThread1, MoDetect,
  uUtils, StdCtrls, ufrmSettings, Menus, Registry;


const
{$I DefConst.inc}

type
	TCommonParams = record
   PathJrn			: String;
   FileMask			: String;
   SaveImgPath	: String;
  end;

type
	TQueue = record
    InpIndex		: TStringList;
    sMessage		: TStringList;
  end;

type  
	TSetEventParams = record
  	Number						: Integer;
    condition1				: String;
    typeCondition1 		: String;
    condition2 				: String;
    typeCondition2 		: String;
    condition3 				: String;
    typeCondition3 		: String;
    Text							: String;
    Enabled						: boolean;
  end;

type
	TSetCommonParams = record
		DELAY_MOTION_DETECT         : Integer;
		DELAY_BETWEEN_SNAPSHOT      : Integer;
		DELAY_BEFORE_PLAY           : Integer;
		DELAY_AFTER_CHANGE_CAMERA   : Integer;
		DELAY_AFTER_SETTINGS_CAMERA : Integer;
		TEXT_FONT										: TFont;
		TEXT_COLOR									: TColor;
		TEXT_BACKGROUND							: TColor;
		TEXT_PLACE									: String;
		TEXT_ALIGN									: String;
  end;
type
	TSetInputParams = record
  	INP_MAIN										: boolean;
		INP_ON                      : boolean;
    INP_MOTION_PERCENT					: Integer;
		INP_MOTION_GRID							: String;
		INP_MOTION_GLOBAL_SENS			: Integer;

		INP_MEDIA_TYPE              : Integer;
		INP_REGULAR_PERIOD          : Integer;
		INP_BACKLIGTHCOMPENSATION   : Integer;
		INP_BRIGHTNESS              : Integer;
		INP_COLORENABLE             : boolean;
		INP_CONTRAST                : Integer;
		INP_DIGITALMULTIPLIER       : Integer;
		INP_GAIN                    : Integer;
		INP_GAMMA                   : Integer;
		INP_HUE                     : Integer;
		INP_POWERLINEFREQUENCY      : Integer;
		INP_SATURATION              : Integer;
		INP_SHARPNESS               : Integer;
		INP_WHITEBALANCE            : Integer;
		INP_WHITEBALANCECOMPONENT   : Integer;
    INP_EVENT										: array of Integer;
  end;
type
	TSetDeviceParams = record
		DEV_ON						: boolean;
		DEV_MOTION 				: boolean;
		DEV_PREVIEW 			: boolean;
		DEV_PREVIEW_IMAGE : boolean;
		DEV_WINDOW_LEFT 	: Integer;
		DEV_WINDOW_TOP		: Integer;
		DEV_WINDOW_WIDTH 	: Integer;
		DEV_WINDOW_HEIGTH : Integer;
    DEV_INPUTS				: array of TSetInputParams;
   end;

type
	TInput = record
  	inpMediaTypeIndex : Integer;
   	inpIndex						: Integer;
   	inpName						: String;
   	inpType						: String;
   	inpIsMain					: boolean;
   	inpIsEvent					: boolean;
   	inpIsRegular				: boolean;
   	inpRegularPeriod		: Integer;
   	inpEvent						: array of Integer;

		inpBacklightCompensation		: Integer; // eturns the camera's backlight compensation setting.
		inpBrightness								: Integer; // Returns the camera's brightness setting.
		inpColorEnable							: boolean; // Returns the camera's color-enable setting.
		inpContrast									: Integer; // Returns the camera's contrast setting.
		inpDigitalMultiplier				: Integer; // Returns the camera's digital zoom level.
		inpGain											: Integer; // Returns the camera's gain setting.
		inpGamma										: Integer; // Returns the camera's gamma setting.
		inpHue											: Integer; // Returns the camera's hue setting.
		inpPowerlineFrequency				: Integer; // Returns the camera's power line frequency setting.
		inpSaturation								: Integer; // Returns the camera's saturation setting.
		inpSharpness								: Integer; // Returns the camera's sharpness setting.
		inpWhiteBalance							: Integer; // Returns the camera's white balance, specified as a color temperature.
		inpWhiteBalanceComponent    : Integer; //
    inpMotionGrid								: String;
    inpMotionPercent						: Integer;
    inpMotionSensitive					: Integer;
  end;


type
	TDevice = record
   devName						: String;
   devIndex						: Integer;
   devInputs					: array of TInput;
   devCurInputs				: Integer;
   devFG							: TFilterGraph;
   devFl							: TFilter;
   devSG							: TSampleGrabber;
   devVW							: TVideoWindow;
   devMoniker					: IMoniker;
   PinList						: TPinList;
   devIsCrossBar 			: boolean;
   devCrossBar  			: IAMCrossBar;
   devIsVideoProcAmp	: boolean;
   devVideoProcAmp 		: IAMVideoProcAmp;
   devStreamConfig		: IAMStreamConfig;
   DevPmt							: PAMMediaType;
   MediaEnum	: TEnumMediaType;

   CapGraph						: ICaptureGraphBuilder2;
   CapFilter					: IBaseFilter;
   CapGrabber					: IBaseFilter;
   CapWindov					: IBaseFilter;

   devIsEvent					: boolean;
   CapImg							: TImage;
   CapBmp							: TBitmap;
   CapJPG							: TJpegImage;

   devIsMotionDetect  : boolean;
   MoDet							: TMotionDetector;
   MoDetRatio					: Integer;

   Queue		: TQueue;
// Setting Param
		DELAY_BEFORE_PLAY           : Integer;
		DEV_MOTION 									: boolean;
		DELAY_MOTION_DETECT         : Integer;
		DELAY_AFTER_CHANGE_CAMERA   : Integer;
		DELAY_AFTER_SETTINGS_CAMERA : Integer;
		DELAY_BETWEEN_SNAPSHOT      : Integer;
		DEV_PREVIEW 								: boolean;
		DEV_PREVIEW_IMAGE 					: boolean;
		DEV_WINDOW_LEFT 						: Integer;
		DEV_WINDOW_TOP							: Integer;
		DEV_WINDOW_WIDTH 						: Integer;
		DEV_WINDOW_HEIGTH 					: Integer;
  end;

type
  TForm1 = class(TForm)
    T1: TTimer;
    TTest: TTimer;
    Image1: TImage;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    procedure N3Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure T1Timer(Sender: TObject);
    procedure TTestTimer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    fIndMo : Integer;
    procedure EventShot;
//    procedure Utils.fDefInitParam;
  public
    { Public declarations }
    fLog : TLogAcceptor;
    fReg : TRegistry;
    CapEnum : TSysDevEnum;
    fCommoParams : TCommonParams;
    ReadJrn : TReadThread;
    aDev 		: array of TDevice;

    SetDevice : array of TSetDeviceParams;
    SetCommon	: TSetCommonParams;
    SetEvent : array of TSetEventParams;

  	pMin ,pMax , pStep , pDefault , pVal : Integer;
  	pFlags : tagVideoProcAmpFlags;

		procedure fOnReadInfo(Sender : TObject ; Info : PChar);
		procedure fOnSnapShot(Sender : TObject ; TypeEvent : Integer ; strMsg : String);

	  procedure fOnMotionDetected (Sender: TObject; GlobalMotionRatio: Double);
  	procedure fOnGridOversizesFrame (Sender: TObject; Width, Height: integer);

    procedure fOnMotionNotDetected(sender : TObject);
    procedure fOnSettingsChanged(sender : TObject);
    procedure fOnNewFrameSize(sender : TObject);


  end;

var
  Form1: TForm1;
  iTest : Integer;
implementation

{$R *.dfm}


procedure TForm1.EventShot;
begin
	uUtils.fCreateEventShot;
  if ReadJrn.Suspended then
  	ReadJrn.Resume;
end;

procedure TForm1.fOnReadInfo(Sender: TObject; Info: PChar);
begin
// fLog.Write('On Read Info. ' + Info + '.');
end;

procedure TForm1.fOnSettingsChanged(sender: TObject);
begin
// fLog.Write('On MoDetect Setting Changed on Device - ' + IntToStr((Sender as TMotionDetector).Tag- 1));
end;

procedure TForm1.fOnSnapShot(Sender: TObject; TypeEvent: Integer; strMsg: String);
begin
 fLog.Write('On SnapShot. Type - ' + IntToStr(TypeEvent) + '. Message - ' + strMsg);

uUtils.fDefEventCamera(TypeEvent , strMsg);
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 	fLog.Free;
  if Assigned(ReadJrn) then
  	begin
		  if ReadJrn.Suspended then
  			ReadJrn.Resume;
		  ReadJrn.Terminate;
      ReadJrn.Free;
    end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
   fLog := TLogAcceptor.Create('main');
   fLog.Write(' ========= START PROGRAM ============= ');
	 CapEnum := TSysDevEnum.Create(CLSID_VideoInputDeviceCategory);
  if CapEnum.CountFilters = 0 then
  	begin
      ShowMessage('This Computer no have Video Input Device');
      Close;
    end;
   fReg := TRegistry.Create;
   fReg.RootKey := HKEY_LOCAL_MACHINE;
	 if not fReg.KeyExists(REG_KEY) then
  	begin
      ShowMessage('This Program not Setting. Run please SetVideo.exe');
      fReg.Free;
      Close;
    end;


iTest := 0;
  uUtils.fDefInitParam;
  uUtils.fDefMotionDetector;

  uUtils.fStartCapture;
  EventShot;
//  TTest.Enabled := true;
  fIndMo := 0;

end;

procedure TForm1.N2Click(Sender: TObject);
begin
Close;
end;

procedure TForm1.N3Click(Sender: TObject);
var
i : Integer;
begin
T1.Enabled := false;
TTest.Enabled := false;
for i := 0 to Length(aDev) - 1 do
	begin
	  aDev[i].devFG.Active := false;
  end;

// frmSettings.ShowModal;
for i := 0 to Length(aDev) - 1 do
	begin
	  aDev[i].devFG.Active := true;
  end;
T1.Enabled := true;
TTest.Enabled := true;
end;

procedure TForm1.N4Click(Sender: TObject);
begin
Close;
end;



procedure TForm1.fOnGridOversizesFrame(Sender: TObject; Width, Height: integer);
begin
// fLog.Write('On Grid OverSizesFrame on Device - ' + IntToStr((Sender as TMotionDetector).Tag - 1) + '. Width - ' + IntToStr(Width) + '. Height - ' + IntToStr(Height));
end;

procedure TForm1.fOnMotionDetected(Sender: TObject; GlobalMotionRatio: Double);
begin
// fLog.Write('On MotionDetected on Device - ' + IntToStr((Sender as TMotionDetector).Tag - 1) + '. GlobalRatio - ' + FloatToStrF(GlobalMotionRatio , ffFixed , 18 , 10 ));
if Trunc(GlobalMotionRatio * 100) > aDev[(Sender as TMotionDetector).Tag - 1].MoDetRatio then
  AddToQueue((Sender as TMotionDetector).Tag - 1 , aDev[(Sender as TMotionDetector).Tag - 1].devCurInputs , DateTimeToStr(NOW) + '. ��������. ' + FloatToStrF(GlobalMotionRatio * 100 , ffFixed , 10 , 2 ) + '%');
end;

procedure TForm1.fOnMotionNotDetected(sender: TObject);
begin
// fLog.Write('Detect Motion. Device - ' + IntToStr((Sender as TMotionDetector).Tag - 1));
fLog.Write('device - ' + IntToStr((Sender as TMotionDetector).Tag - 1) + '. Motion Ratio - ' + FloatToStrF(aDev[(Sender as TMotionDetector).Tag - 1].MoDet.GlobalMotionRatio , ffFixed , 18 ,10));
end;

procedure TForm1.fOnNewFrameSize(sender: TObject);
var
Fr : TBitmap;
begin
//	Fr := fMoDet.LastFrame;
// fLog.Write('On Motion on Device - ' + IntToStr((Sender as TMotionDetector).Tag - 1) + '. New Frame Size. ' + IntToStr(Fr.Width) + 'x' + IntToStr(fr.Height));
end;

procedure TForm1.T1Timer(Sender: TObject);
var
i : Integer;
begin
T1.Enabled := false;
for i := 0 to Length(aDev) - 1 do
	begin
		if aDev[i].devIsEvent then
			begin
		   aDev[i].MoDet.Reset;
       T1.Enabled := true;
		   exit;
		  end;
	  if Assigned(aDev[i].MoDet) then
  		begin
    	 if aDev[i].devSG.GetBitmap(aDev[i].CapBmp) then
     			begin

// fLog.Write('GetBitmap. ' + IntToStr(i));
			 		 	if aDev[i].MoDet.DetectMotion(aDev[i].CapBmp) then
			  			begin
// fLog.Write('Detect Motion. ' + IntToStr(i));
//							fLog.Write('Motion Ratio - ' + FloatToStrF(aDev[i].MoDet.GlobalMotionRatio , ffFixed , 18 ,10));
				    	end;
  		    end;
    	end;
 end;
T1.Enabled := true;
end;

procedure TForm1.TTestTimer(Sender: TObject);
var
i : Integer;
begin
{
fLog.Write('In Timer test');
	case iTest of
  	0 : iTest := 1;
    1 : iTest := 0;
  end;
  uUtils.fRouteInput(0 , 0 , iTest);
}
TTest.Enabled := false;
for i := 0 to Length(aDev) - 1 do
 begin
// fLog.Write('DOSNAPSHOT. dev - ' + IntToStr(i) + '. count - ' + IntToStr(aDev[i].Queue.InpIndex.Count));
  if aDev[i].Queue.InpIndex.Count > 0 then
  	begin
     DoSnapShot(i , StrToInt(aDev[i].Queue.InpIndex[0]) , aDev[i].Queue.sMessage[0]);
     aDev[i].Queue.InpIndex.Delete(0);
     aDev[i].Queue.sMessage.Delete(0);     
    end;
 end;
TTest.Enabled := true;

end;

end.
