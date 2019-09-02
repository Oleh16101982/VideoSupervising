unit SetUnits;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DSPack, DSUtil, DirectShow9,
  clLogAcceptor1, BaseFilterEditor, ComCtrls, Registry, StdCtrls, ExtCtrls, FileCtrl,
  Mask;

const
{$I DefConst.inc}

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
		TEXT_FONT										: TFont;
		TEXT_BACKGROUND							: TColor;
		TEXT_PLACE									: String;
		TEXT_ALIGN									: String;
    JRN_FILEPATH                : String;
    JRN_FILEMASK								: String;
    PATH_SAVE_IMAGE							: String;
  end;
type
	TSetInputParams = record
  	INP_NAME										: String;
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
  	Dev_NAME										: String;
		DEV_ON											: boolean;
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
    DEV_INPUTS									: array of TSetInputParams;
   end;


type
  TForm1 = class(TForm)
    TV1: TTreeView;
    FG: TFilterGraph;
    VW: TVideoWindow;
    FL: TFilter;
    SG: TSampleGrabber;
    P0: TPanel;
    E01: TEdit;
    E02: TEdit;
    B01: TButton;
    B02: TButton;
    E03: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    E04: TEdit;
    B03: TButton;
    P1: TPanel;
    Label5: TLabel;
    Label6: TLabel;
    ChB11: TCheckBox;
    ChB12: TCheckBox;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    ME11: TMaskEdit;
    ME12: TMaskEdit;
    ME13: TMaskEdit;
    ME14: TMaskEdit;
    ME15: TMaskEdit;
    Label12: TLabel;
    P2: TPanel;
    ChB21: TCheckBox;
    ChB22: TCheckBox;
    ME210: TMaskEdit;
    ME211: TMaskEdit;
    ME212: TMaskEdit;
    ME213: TMaskEdit;
    ME214: TMaskEdit;
    ME215: TMaskEdit;
    ME216: TMaskEdit;
    ME217: TMaskEdit;
    ME218: TMaskEdit;
    ME219: TMaskEdit;
    TB21: TTrackBar;
    TB22: TTrackBar;
    TB23: TTrackBar;
    TB24: TTrackBar;
    TB25: TTrackBar;
    TB26: TTrackBar;
    TB27: TTrackBar;
    ChB24: TCheckBox;
    TB28: TTrackBar;
    TB29: TTrackBar;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    ChB23: TCheckBox;
    Label22: TLabel;
    ME21: TMaskEdit;
    ME22: TMaskEdit;
    ME23: TMaskEdit;
    ME24: TMaskEdit;
    ME25: TMaskEdit;
    ME26: TMaskEdit;
    ME27: TMaskEdit;
    ME28: TMaskEdit;
    ME29: TMaskEdit;
    ME220: TMaskEdit;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    CB1: TComboBox;
    Label23: TLabel;
    Label36: TLabel;
    ME221: TMaskEdit;
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure ME221Exit(Sender: TObject);
    procedure CB1Change(Sender: TObject);
    procedure E02Exit(Sender: TObject);
    procedure E01Exit(Sender: TObject);
    procedure E03Change(Sender: TObject);
    procedure E01Change(Sender: TObject);
    procedure ME15Exit(Sender: TObject);
    procedure ME14Exit(Sender: TObject);
    procedure ME13Exit(Sender: TObject);
    procedure ME12Exit(Sender: TObject);
    procedure ME219Exit(Sender: TObject);
    procedure ME218Exit(Sender: TObject);
    procedure ME217Exit(Sender: TObject);
    procedure ME216Exit(Sender: TObject);
    procedure ME215Exit(Sender: TObject);
    procedure ME214Exit(Sender: TObject);
    procedure ME213Exit(Sender: TObject);
    procedure ME212Exit(Sender: TObject);
    procedure ME211Exit(Sender: TObject);
    procedure ME210Exit(Sender: TObject);
    procedure ME220Exit(Sender: TObject);
    procedure ChB22Click(Sender: TObject);
    procedure ChB21Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ME29Exit(Sender: TObject);
    procedure ME28Exit(Sender: TObject);
    procedure ME27Exit(Sender: TObject);
    procedure ME26Exit(Sender: TObject);
    procedure ME25Exit(Sender: TObject);
    procedure ME24Exit(Sender: TObject);
    procedure ME23Exit(Sender: TObject);
    procedure ME22Exit(Sender: TObject);
    procedure ME21Exit(Sender: TObject);
    procedure TB29Change(Sender: TObject);
    procedure TB28Change(Sender: TObject);
    procedure TB27Change(Sender: TObject);
    procedure TB26Change(Sender: TObject);
    procedure TB25Change(Sender: TObject);
    procedure TB24Change(Sender: TObject);
    procedure TB23Change(Sender: TObject);
    procedure TB22Change(Sender: TObject);
    procedure TB21Change(Sender: TObject);
    procedure ChB23Click(Sender: TObject);
    procedure ME11Exit(Sender: TObject);
    procedure ChB12Click(Sender: TObject);
    procedure ChB11Click(Sender: TObject);
    procedure E03Exit(Sender: TObject);
    procedure B02Click(Sender: TObject);
    procedure B01Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TV1Change(Sender: TObject; Node: TTreeNode);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    Reg				: TRegistry;
    CapEnum 	: TSysDevEnum;
    PinList 	: TPinList;
   	CrossBar  : IAMCrossBar;
    VideoProcAmp : IAMVideoProcAmp;
		VideoMediaTypes	: TEnumMediaType;
    ConnType : String;
  	pMin ,pMax , pStep , pDefault , pVal : Integer;
  	pFlags : tagVideoProcAmpFlags;
    currNode : TTreeNode;
    SetDevice : array of TSetDeviceParams;
    SetCommon	: TSetCommonParams;
    SetEvent : array of TSetEventParams;

    function AddInputs(ind : Integer ; Node : TTreeNode) : boolean;
    function defConnType(typ :  TPhysicalConnectorType) : String;
    procedure LoadDefaultParams;
    procedure LoadParams;
    procedure LoadCommon;
    procedure LoadDefCommon;
    procedure LoadDevice(Dev : Integer);
    procedure LoadDefDevice(Dev : Integer);
    procedure LoadInput(Dev , Inp : Integer);
    procedure LoadDefInput(Dev , Inp : Integer);
    procedure LoadEvent;
    procedure LoadDefEvent;
    procedure SaveToReg;
    procedure SaveSetCommon;
    procedure SaveSetDevice(Dev : Integer);
    procedure SaveSetInput(Dev , Inp : Integer);
    procedure StartPreview(Dev , Inp : Integer);
    procedure StopPreview;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

function TForm1.AddInputs(ind: Integer; Node: TTreeNode) : boolean;
var
i : Integer;
OutCount : Integer;
CbInCount : Integer;
CbOutCount : Integer;
hs : HResult;
fType :  TPhysicalConnectorType;
fRelPin : Integer;
begin
	FG.Active := false;
  FG.ClearGraph;
try
  FL.BaseFilter.Moniker := CapEnum.GetMoniker(ind);
except
	on E : EIntfCastError do
  	begin
      ShowMessage('EIntfCastError. ' + E.Message + '. ')
    end;

	on E : Exception do
  	begin
      ShowMessage('1Except. ' + E.Message + '. ' + E.ClassName );
    end;
end;
try
  FG.Active := true;
except
	on E : EIntfCastError do
  	begin
//      ShowMessage('EIntfCastError. ' + E.Message + '. ')
    	Result := false;
      exit;
    end;
	on E : Exception do
  	begin
//      ShowMessage('2Except. ' + E.Message + '. ' + E.ClassName );
    	Result := false;
      exit;
    end;
end;
try
  PinList := TPinList.Create(FL as IBaseFilter);
except
	on E : EIntfCastError do
  	begin
//      ShowMessage('EIntfCastError. ' + E.Message + '. ')
    	Result := false;
      exit;
    end;
	on E : Exception do
  	begin
//      ShowMessage('3Except. ' + E.Message + '. ' + E.ClassName );
    	Result := false;
      exit;
    end;
end;
  if PinList.Count > 0 then
  	begin
    	OutCount := 0;
      for i := 0 to PinList.Count - 1 do
       begin
        if PinList.PinInfo[i].dir = PINDIR_OUTPUT then
        	Inc(OutCount);
       end;
  PinList.Free;
  FG.Active := false;
  FG.ClearGraph;
  FL.BaseFilter.Moniker := CapEnum.GetMoniker(ind);
  FG.Active := true;

       if OutCount > 0 then
       	begin
          hs := (FG as ICaptureGraphBuilder2).FindInterface(@LOOK_UPSTREAM_ONLY,nil,(FL as IBaseFilter),IID_IAMCrossBar,CrossBar);
          if SUCCEEDED(hs) then
            begin
            	CrossBar.get_PinCounts(CbOutCount , CbInCount);
            end;
            if CbInCount > 0 then
            	begin
              	SetLength(SetDevice[ind].DEV_INPUTS , CbInCount);
              	for i := 0 to CbInCount - 1 do
              	begin
		              CrossBar.get_CrossbarPinInfo(true , i , fRelPin , fType);
                  ConnType := DefConnType(fType);
                  TV1.Items.AddChild(Node , ConnType);
                  SetDevice[ind].DEV_INPUTS[i].INP_NAME := ConnType;
                end;
              end
            else
            	begin
	            	TV1.Items.AddChild(Node , 'Input 0');
                SetLength(SetDevice[ind].DEV_INPUTS , 1);
                SetDevice[ind].DEV_INPUTS[0].INP_NAME := 'Input 0';
              end;
            end;
        	CrossBar := nil;
        end;
  FG.Active := False;
end;

procedure TForm1.B01Click(Sender: TObject);
var
	Dir : String;
begin
Dir := SetCommon.JRN_FILEPATH;
if SelectDirectory(Dir, [sdAllowCreate, sdPerformCreate, sdPrompt],0) then
	begin
		SetCommon.JRN_FILEPATH := Dir;
    E01.Text := SetCommon.JRN_FILEPATH;
  end;
end;

procedure TForm1.B02Click(Sender: TObject);
var
	Dir : String;
begin
Dir := SetCommon.PATH_SAVE_IMAGE;
if SelectDirectory(Dir, [sdAllowCreate, sdPerformCreate, sdPrompt],0) then
	begin
		SetCommon.PATH_SAVE_IMAGE := Dir;
    E02.Text := SetCommon.PATH_SAVE_IMAGE;
  end;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
i , j : Integer;
begin
	SaveToReg;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
	LoadDefaultParams;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
SaveToReg;
end;

procedure TForm1.CB1Change(Sender: TObject);
begin
// ShowMessage(IntToStr(CB1.ItemIndex));
	SetDevice[CurrNode.Parent.Index].DEV_INPUTS[CurrNode.Index].INP_MEDIA_TYPE := CB1.ItemIndex;
end;

procedure TForm1.ChB11Click(Sender: TObject);
begin
	SetDevice[CurrNode.Index].DEV_ON := ChB11.Checked;
end;

procedure TForm1.ChB12Click(Sender: TObject);
begin
	SetDevice[CurrNode.Index].DEV_MOTION := ChB12.Checked;
end;

procedure TForm1.ChB21Click(Sender: TObject);
begin
  SetDevice[CurrNode.Parent.Index].DEV_INPUTS[CurrNode.Index].INP_MAIN := ChB21.Checked;
end;

procedure TForm1.ChB22Click(Sender: TObject);
begin
  SetDevice[CurrNode.Parent.Index].DEV_INPUTS[CurrNode.Index].INP_ON := ChB22.Checked;
end;

procedure TForm1.ChB23Click(Sender: TObject);
begin
  if ChB23.Checked then
  	begin
     StartPreview(CurrNode.Parent.Index , CurrNode.Index);
    end
  else
  	begin
     StopPreview;
    end;
end;

function TForm1.defConnType(typ: TPhysicalConnectorType): String;
begin
case typ of
		PhysConn_Video_Tuner:            Result :=  'Video Tuner';
    PhysConn_Video_Composite:        Result :=  'Video Composite';
    PhysConn_Video_SVideo:           Result :=  'S-Video';
    PhysConn_Video_RGB:              Result :=  'Video RGB';
    PhysConn_Video_YRYBY:            Result :=  'Video YRYBY';
    PhysConn_Video_SerialDigital:    Result :=  'Video Serial Digital';
    PhysConn_Video_ParallelDigital:  Result :=  'Video Parallel Digital';
    PhysConn_Video_SCSI:             Result :=  'Video SCSI';
    PhysConn_Video_AUX:              Result :=  'Video AUX';
    PhysConn_Video_1394:             Result :=  'Video 1394';
    PhysConn_Video_USB:              Result :=  'Video USB';
    PhysConn_Video_VideoDecoder:     Result :=  'Video Decoder';
    PhysConn_Video_VideoEncoder:     Result :=  'Video Encoder';

    PhysConn_Audio_Tuner:            Result :=  'Audio Tuner';
    PhysConn_Audio_Line:             Result :=  'Audio Line';
    PhysConn_Audio_Mic:              Result :=  'Audio Microphone';
    PhysConn_Audio_AESDigital:       Result :=  'Audio AES/EBU Digital';
    PhysConn_Audio_SPDIFDigital:     Result :=  'Audio S/PDIF';
    PhysConn_Audio_SCSI:             Result :=  'Audio SCSI';
    PhysConn_Audio_AUX:              Result :=  'Audio AUX';
    PhysConn_Audio_1394:             Result :=  'Audio 1394';
    PhysConn_Audio_USB:              Result :=  'Audio USB';
    PhysConn_Audio_AudioDecoder:     Result :=  'Audio Decoder';

    else                              Result :=  'Unknown Type';
end;
end;

procedure TForm1.E01Change(Sender: TObject);
begin
//  SetCommon.JRN_FILEPATH := E03.Text;
end;

procedure TForm1.E01Exit(Sender: TObject);
begin
  SetCommon.JRN_FILEPATH := E01.Text;
end;

procedure TForm1.E02Exit(Sender: TObject);
begin
  SetCommon.PATH_SAVE_IMAGE := E02.Text;
end;

procedure TForm1.E03Change(Sender: TObject);
begin
  SetCommon.PATH_SAVE_IMAGE := E03.Text;
end;

procedure TForm1.E03Exit(Sender: TObject);
begin
  SetCommon.JRN_FILEMASK := E03.Text;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
	if Assigned(Reg) then Reg.Free;

end;

procedure TForm1.FormCreate(Sender: TObject);
var
i , j : Integer;
ttn , node : TTreeNode ;
begin
	CapEnum := TSysDevEnum.Create;
	CapEnum := TSysDevEnum.Create(CLSID_VideoInputDeviceCategory);
 	Reg := TRegistry.Create;
  Reg.RootKey := HKEY_LOCAL_MACHINE;

		  if CapEnum.CountFilters = 0 then
  			begin
		      ShowMessage('This Computer no have Video Input Device');
          if Reg.ValueExists(REG_KEY) then
          	Reg.DeleteKey(REG_KEY);
          Reg.Free;
          CapEnum.Free;
    		  Close;
		    end;

TV1.Items.Add(nil , '�����');
TV1.Items.Add(nil , '����������');
TV1.Items.Add(nil , '�������');

      for i := 0 to CapEnum.CountFilters - 1 do
      	begin
         Node := TV1.Items.Item[1];
ShowMessage(CapEnum.Filters[i].FriendlyName);
         ttn := TV1.Items.AddChild(TV1.Items.Item[1] , CapEnum.Filters[i].FriendlyName);
         SetLength(SetDevice , i + 1);
         SetDevice[i].Dev_NAME := CapEnum.Filters[i].FriendlyName;
         if AddInputs(i , ttn) then
          begin

          end;
        end;
  if not Reg.KeyExists(REG_KEY) then
    begin
      LoadDefaultParams;
    end
  else
  	begin
			LoadParams;
    end;

end;

procedure TForm1.LoadCommon;
begin
      Reg.CloseKey;
	Reg.OpenKey(REG_KEY + '\Common', true);
		SetCommon.TEXT_BACKGROUND     := TEXT_BACKGROUND;
    SetCommon.TEXT_PLACE          := TEXT_PLACE;
    SetCommon.TEXT_ALIGN          := TEXT_ALIGN;
    if Reg.ValueExists('PathJournal') then
    	SetCommon.JRN_FILEPATH        := Reg.ReadString('PathJournal')
    else
	    SetCommon.JRN_FILEPATH        := JRN_FILEPATH;
    if Reg.ValueExists('MaskJournal') then
    	SetCommon.JRN_FILEMASK        := Reg.ReadString('MaskJournal')
    else
	    SetCommon.JRN_FILEMASK        := JRN_FILEMASK;
    if Reg.ValueExists('PathSnapShot') then
    	SetCommon.PATH_SAVE_IMAGE     := Reg.ReadString('PathSnapShot')
    else
	    SetCommon.PATH_SAVE_IMAGE     := PATH_SAVE_IMAGE;
end;

procedure TForm1.LoadDefaultParams;
var
	i , j : Integer;
begin
//  	TEXT_FONT						:= TEXT_FONT;
	LoadDefCommon;
	for i := 0 to Length(SetDevice) - 1 do
   	begin
    	LoadDefDevice(i);
		    for j := 0 to Length(SetDevice[i].DEV_INPUTS) - 1 do
		    	begin
          	LoadDefInput(i , j);
		      end;
    end;
  LoadDefEvent;
end;

procedure TForm1.LoadDefCommon;
begin
    SetCommon.TEXT_BACKGROUND     := TEXT_BACKGROUND;
    SetCommon.TEXT_PLACE          := TEXT_PLACE;
    SetCommon.TEXT_ALIGN          := TEXT_ALIGN;
    SetCommon.JRN_FILEPATH        := JRN_FILEPATH;
    SetCommon.JRN_FILEMASK        := JRN_FILEMASK;
    SetCommon.PATH_SAVE_IMAGE     := PATH_SAVE_IMAGE;

end;

procedure TForm1.LoadDefDevice(Dev: Integer);
begin
		  	SetDevice[Dev].DEV_ON												:= DEV_ON;
				SetDevice[Dev].DELAY_BEFORE_PLAY						:= DELAY_BEFORE_PLAY;
				SetDevice[Dev].DELAY_MOTION_DETECT          := DELAY_MOTION_DETECT;
				SetDevice[Dev].DELAY_AFTER_CHANGE_CAMERA    := DELAY_AFTER_CHANGE_CAMERA;
				SetDevice[Dev].DELAY_AFTER_SETTINGS_CAMERA  := DELAY_AFTER_SETTINGS_CAMERA;
				SetDevice[Dev].DELAY_BETWEEN_SNAPSHOT				:= DELAY_BETWEEN_SNAPSHOT;
			  SetDevice[Dev].DEV_MOTION 									:= DEV_MOTION;
		  	SetDevice[Dev].DEV_PREVIEW 									:= DEV_PREVIEW;
			  SetDevice[Dev].DEV_PREVIEW_IMAGE 						:= DEV_PREVIEW_IMAGE;
			  SetDevice[Dev].DEV_WINDOW_LEFT 							:= DEV_WINDOW_LEFT;
		  	SetDevice[Dev].DEV_WINDOW_TOP								:= DEV_WINDOW_TOP;
			  SetDevice[Dev].DEV_WINDOW_WIDTH 						:= DEV_WINDOW_WIDTH;
		  	SetDevice[Dev].DEV_WINDOW_HEIGTH 						:= DEV_WINDOW_HEIGTH;

end;

procedure TForm1.LoadDefEvent;
begin

end;

procedure TForm1.LoadDefInput(Dev, Inp: Integer);
begin
	SetDevice[Dev].DEV_INPUTS[Inp].INP_MAIN            				 := INP_MAIN;
  SetDevice[Dev].DEV_INPUTS[Inp].INP_ON                      := INP_ON;
  SetDevice[Dev].DEV_INPUTS[Inp].INP_MOTION_PERCENT          := INP_MOTION_PERCENT;
  SetDevice[Dev].DEV_INPUTS[Inp].INP_MOTION_GRID             := INP_MOTION_GRID;
  SetDevice[Dev].DEV_INPUTS[Inp].INP_MOTION_GLOBAL_SENS      := INP_MOTION_GLOBAL_SENS;
  SetDevice[Dev].DEV_INPUTS[Inp].INP_MEDIA_TYPE              := INP_MEDIA_TYPE;
  SetDevice[Dev].DEV_INPUTS[Inp].INP_REGULAR_PERIOD          := INP_REGULAR_PERIOD;
  SetDevice[Dev].DEV_INPUTS[Inp].INP_BACKLIGTHCOMPENSATION   := INP_BACKLIGTHCOMPENSATION;
  SetDevice[Dev].DEV_INPUTS[Inp].INP_BRIGHTNESS              := INP_BRIGHTNESS;
  SetDevice[Dev].DEV_INPUTS[Inp].INP_COLORENABLE             := INP_COLORENABLE;
  SetDevice[Dev].DEV_INPUTS[Inp].INP_CONTRAST                := INP_CONTRAST;
  SetDevice[Dev].DEV_INPUTS[Inp].INP_DIGITALMULTIPLIER       := INP_DIGITALMULTIPLIER;
  SetDevice[Dev].DEV_INPUTS[Inp].INP_GAIN                    := INP_GAIN;
  SetDevice[Dev].DEV_INPUTS[Inp].INP_GAMMA                   := INP_GAMMA;
  SetDevice[Dev].DEV_INPUTS[Inp].INP_HUE                     := INP_HUE;
  SetDevice[Dev].DEV_INPUTS[Inp].INP_POWERLINEFREQUENCY      := INP_POWERLINEFREQUENCY;
  SetDevice[Dev].DEV_INPUTS[Inp].INP_SATURATION              := INP_SATURATION;
  SetDevice[Dev].DEV_INPUTS[Inp].INP_SHARPNESS               := INP_SHARPNESS;
  SetDevice[Dev].DEV_INPUTS[Inp].INP_WHITEBALANCE            := INP_WHITEBALANCE;
  SetDevice[Dev].DEV_INPUTS[Inp].INP_WHITEBALANCECOMPONENT   := INP_WHITEBALANCECOMPONENT;
end;

procedure TForm1.LoadDevice(Dev: Integer);
var
i : Integer;
begin
  if Reg.KeyExists(REG_KEY + '\Device\' + SetDevice[Dev].Dev_NAME) then
  	begin
      Reg.CloseKey;
	  	Reg.OpenKey(REG_KEY + '\Device\' + SetDevice[Dev].Dev_NAME , false);
      if Reg.ValueExists('DevOn') then
				SetDevice[Dev].DEV_ON												:= Reg.ReadBool('DevOn')
      else
		  	SetDevice[Dev].DEV_ON												:= DEV_ON;
      if Reg.ValueExists('DelayPlay') then
				SetDevice[Dev].DELAY_BEFORE_PLAY						:= Reg.ReadInteger('DelayPlay')
      else
				SetDevice[Dev].DELAY_BEFORE_PLAY						:= DELAY_BEFORE_PLAY;
      if Reg.ValueExists('DelayMotionDetect') then
				SetDevice[Dev].DELAY_MOTION_DETECT          := Reg.ReadInteger('DelayMotionDetect')
      else
					SetDevice[Dev].DELAY_MOTION_DETECT          := DELAY_MOTION_DETECT;
      if Reg.ValueExists('DelayChangeCamera') then
				SetDevice[Dev].DELAY_AFTER_CHANGE_CAMERA    := Reg.ReadInteger('DelayChangeCamera')
      else
				SetDevice[Dev].DELAY_AFTER_CHANGE_CAMERA    := DELAY_AFTER_CHANGE_CAMERA;
      if Reg.ValueExists('DelaySettingCamera') then
				SetDevice[Dev].DELAY_AFTER_SETTINGS_CAMERA  := Reg.ReadInteger('DelaySettingCamera')
      else
				SetDevice[Dev].DELAY_AFTER_SETTINGS_CAMERA  := DELAY_AFTER_SETTINGS_CAMERA;
      if Reg.ValueExists('DelaySnapShot') then
				SetDevice[Dev].DELAY_BETWEEN_SNAPSHOT				:= Reg.ReadInteger('DelaySnapShot')
      else
				SetDevice[Dev].DELAY_BETWEEN_SNAPSHOT				:= DELAY_BETWEEN_SNAPSHOT;
      if Reg.ValueExists('DevMotion') then
				SetDevice[Dev].DEV_MOTION 									:= Reg.ReadBool('DevMotion')
      else
			  SetDevice[Dev].DEV_MOTION 									:= DEV_MOTION;
      if Reg.ValueExists('DevPrewiev') then
				SetDevice[Dev].DEV_PREVIEW 									:= Reg.ReadBool('DevPrewiev')
      else
		  	SetDevice[Dev].DEV_PREVIEW 									:= DEV_PREVIEW;
      if Reg.ValueExists('DevPreviewImage') then
				SetDevice[Dev].DEV_PREVIEW_IMAGE 						:= Reg.ReadBool('DevPreviewImage')
      else
			  SetDevice[Dev].DEV_PREVIEW_IMAGE 						:= DEV_PREVIEW_IMAGE;
      if Reg.ValueExists('DevWindowLeft') then
				SetDevice[Dev].DEV_WINDOW_LEFT 							:= Reg.ReadInteger('DevWindowLeft')
      else
			  SetDevice[Dev].DEV_WINDOW_LEFT 							:= DEV_WINDOW_LEFT;
      if Reg.ValueExists('DevWindowTop') then
				SetDevice[Dev].DEV_WINDOW_TOP								:= Reg.ReadInteger('DevWindowTop')
      else
      	SetDevice[Dev].DEV_WINDOW_TOP								:= DEV_WINDOW_TOP;
      if Reg.ValueExists('DevWindowWidth') then
				SetDevice[Dev].DEV_WINDOW_WIDTH 						:= Reg.ReadInteger('DevWindowWidth')
	    else
			  SetDevice[Dev].DEV_WINDOW_WIDTH 						:= DEV_WINDOW_WIDTH;
      if Reg.ValueExists('DevWindowHeigth') then
				SetDevice[Dev].DEV_WINDOW_HEIGTH 						:= Reg.ReadInteger('DevWindowHeigth')
      else
		  	SetDevice[Dev].DEV_WINDOW_HEIGTH 						:= DEV_WINDOW_HEIGTH;
    end
  else
  	begin
		  	SetDevice[Dev].DEV_ON												:= DEV_ON;
				SetDevice[Dev].DELAY_BEFORE_PLAY						:= DELAY_BEFORE_PLAY;
				SetDevice[Dev].DELAY_MOTION_DETECT          := DELAY_MOTION_DETECT;
				SetDevice[Dev].DELAY_AFTER_CHANGE_CAMERA    := DELAY_AFTER_CHANGE_CAMERA;
				SetDevice[Dev].DELAY_AFTER_SETTINGS_CAMERA  := DELAY_AFTER_SETTINGS_CAMERA;
				SetDevice[Dev].DELAY_BETWEEN_SNAPSHOT				:= DELAY_BETWEEN_SNAPSHOT;
			  SetDevice[Dev].DEV_MOTION 									:= DEV_MOTION;
		  	SetDevice[Dev].DEV_PREVIEW 									:= DEV_PREVIEW;
			  SetDevice[Dev].DEV_PREVIEW_IMAGE 						:= DEV_PREVIEW_IMAGE;
			  SetDevice[Dev].DEV_WINDOW_LEFT 							:= DEV_WINDOW_LEFT;
		  	SetDevice[Dev].DEV_WINDOW_TOP								:= DEV_WINDOW_TOP;
			  SetDevice[Dev].DEV_WINDOW_WIDTH 						:= DEV_WINDOW_WIDTH;
		  	SetDevice[Dev].DEV_WINDOW_HEIGTH 						:= DEV_WINDOW_HEIGTH;
    end;

end;

procedure TForm1.LoadEvent;
begin

end;

procedure TForm1.LoadInput(Dev, Inp: Integer);
begin
	if Reg.KeyExists(REG_KEY + '\Device' + '\' + SetDevice[Dev].Dev_NAME + '\' + SetDevice[Dev].DEV_INPUTS[Inp].INP_NAME) then
  	begin
    	Reg.CloseKey;
    	Reg.OpenKey(REG_KEY + '\Device' + '\' + SetDevice[Dev].Dev_NAME + '\' + SetDevice[Dev].DEV_INPUTS[Inp].INP_NAME , false);
      if Reg.ValueExists('InpMain') then
      	SetDevice[Dev].DEV_INPUTS[Inp].INP_MAIN            				 := Reg.ReadBool('InpMain')
      else
				SetDevice[Dev].DEV_INPUTS[Inp].INP_MAIN            				 := INP_MAIN;

      if Reg.ValueExists('BackLigthCompensatuion') then
      	SetDevice[Dev].DEV_INPUTS[Inp].INP_BACKLIGTHCOMPENSATION   := Reg.ReadInteger('BackLigthCompensatuion')
      else
      	SetDevice[Dev].DEV_INPUTS[Inp].INP_BACKLIGTHCOMPENSATION   := INP_BACKLIGTHCOMPENSATION;

      if Reg.ValueExists('Brightness') then
      	SetDevice[Dev].DEV_INPUTS[Inp].INP_BRIGHTNESS              := Reg.ReadInteger('Brightness')
      else
      	SetDevice[Dev].DEV_INPUTS[Inp].INP_BRIGHTNESS              :=  INP_BRIGHTNESS;

      if Reg.ValueExists('ColorEnable') then
				SetDevice[Dev].DEV_INPUTS[Inp].INP_COLORENABLE             := Reg.ReadBool('ColorEnable')
      else
				SetDevice[Dev].DEV_INPUTS[Inp].INP_COLORENABLE             :=  INP_COLORENABLE;

      if Reg.ValueExists('Contrast') then
      	SetDevice[Dev].DEV_INPUTS[Inp].INP_CONTRAST                := Reg.ReadInteger('Contrast')
      else
      	SetDevice[Dev].DEV_INPUTS[Inp].INP_CONTRAST                := INP_CONTRAST;

      if Reg.ValueExists('DigitalMultiplier') then
      	SetDevice[Dev].DEV_INPUTS[Inp].INP_DIGITALMULTIPLIER       := Reg.ReadInteger('DigitalMultiplier')
      else
      	SetDevice[Dev].DEV_INPUTS[Inp].INP_DIGITALMULTIPLIER       := INP_DIGITALMULTIPLIER;

      if Reg.ValueExists('Gain') then
      	SetDevice[Dev].DEV_INPUTS[Inp].INP_GAIN                    := Reg.ReadInteger('Gain')
      else
      	SetDevice[Dev].DEV_INPUTS[Inp].INP_GAIN                    := INP_GAIN;

      if Reg.ValueExists('Gamma') then
      	SetDevice[Dev].DEV_INPUTS[Inp].INP_GAMMA                   := Reg.ReadInteger('Gamma')
      else
      	SetDevice[Dev].DEV_INPUTS[Inp].INP_GAMMA                   := INP_GAMMA;

      if Reg.ValueExists('Hue') then
      	SetDevice[Dev].DEV_INPUTS[Inp].INP_HUE                     := Reg.ReadInteger('Hue')
      else
      	SetDevice[Dev].DEV_INPUTS[Inp].INP_HUE                     := INP_HUE;

      if Reg.ValueExists('InpOn') then
      	SetDevice[Dev].DEV_INPUTS[Inp].INP_ON                      := Reg.ReadBool('InpOn')
      else
      	SetDevice[Dev].DEV_INPUTS[Inp].INP_ON                      := INP_ON;

      if Reg.ValueExists('MediaType') then
      	SetDevice[Dev].DEV_INPUTS[Inp].INP_MEDIA_TYPE              := Reg.ReadInteger('MediaType')
      else
      	SetDevice[Dev].DEV_INPUTS[Inp].INP_MEDIA_TYPE              := INP_MEDIA_TYPE;

      if Reg.ValueExists('MotionGrid') then
      	SetDevice[Dev].DEV_INPUTS[Inp].INP_MOTION_GRID             := Reg.ReadString('MotionGrid')
      else
      	SetDevice[Dev].DEV_INPUTS[Inp].INP_MOTION_GRID             := INP_MOTION_GRID;

      if Reg.ValueExists('MotionPercent') then
      	SetDevice[Dev].DEV_INPUTS[Inp].INP_MOTION_PERCENT          := Reg.ReadInteger('MotionPercent')
      else
      	SetDevice[Dev].DEV_INPUTS[Inp].INP_MOTION_PERCENT          := INP_MOTION_PERCENT;

      if Reg.ValueExists('MotionSensitive') then
				SetDevice[Dev].DEV_INPUTS[Inp].INP_MOTION_GLOBAL_SENS      := Reg.ReadInteger('MotionSensitive')
      else
      	SetDevice[Dev].DEV_INPUTS[Inp].INP_MOTION_GLOBAL_SENS      := INP_MOTION_GLOBAL_SENS;

      if Reg.ValueExists('PowerLineFrequency') then
				SetDevice[Dev].DEV_INPUTS[Inp].INP_POWERLINEFREQUENCY      := Reg.ReadInteger('PowerLineFrequency')
      else
				SetDevice[Dev].DEV_INPUTS[Inp].INP_POWERLINEFREQUENCY      := INP_POWERLINEFREQUENCY;

			if Reg.ValueExists('RegularPeriod') then
				SetDevice[Dev].DEV_INPUTS[Inp].INP_REGULAR_PERIOD          := Reg.ReadInteger('RegularPeriod')
      else
				SetDevice[Dev].DEV_INPUTS[Inp].INP_REGULAR_PERIOD          := INP_REGULAR_PERIOD;

      if Reg.ValueExists('Saturation') then
				SetDevice[Dev].DEV_INPUTS[Inp].INP_SATURATION              := Reg.ReadInteger('Saturation')
      else
				SetDevice[Dev].DEV_INPUTS[Inp].INP_SATURATION              := INP_SATURATION;

      if Reg.ValueExists('Sharpness') then
				SetDevice[Dev].DEV_INPUTS[Inp].INP_SHARPNESS               := Reg.ReadInteger('Sharpness')
      else
				SetDevice[Dev].DEV_INPUTS[Inp].INP_SHARPNESS               := INP_SHARPNESS;

      if Reg.ValueExists('WhiteBalance') then
				SetDevice[Dev].DEV_INPUTS[Inp].INP_WHITEBALANCE            := Reg.ReadInteger('WhiteBalance')
      else
				SetDevice[Dev].DEV_INPUTS[Inp].INP_WHITEBALANCE            := INP_WHITEBALANCE;

      if Reg.ValueExists('WhiteBalanceComponent') then
				SetDevice[Dev].DEV_INPUTS[Inp].INP_WHITEBALANCECOMPONENT   := Reg.ReadInteger('WhiteBalanceComponent')
      else
				SetDevice[Dev].DEV_INPUTS[Inp].INP_WHITEBALANCECOMPONENT   := INP_WHITEBALANCECOMPONENT;

    end;
end;

procedure TForm1.LoadParams;
var
  i , j : Integer;
begin
if Reg.KeyExists(REG_KEY + '\Common') then
	begin
		LoadCommon
  end
else
	begin
	  LoadDefCommon;
  end;
if Reg.KeyExists(REG_KEY + '\Device') then
	begin

  	for i := 0 to Length(SetDevice) - 1 do
    	begin
				LoadDevice(i);
        for j := 0 to Length(SetDevice[i].DEV_INPUTS) - 1 do
        	begin
            if Reg.KeyExists(REG_KEY + '\Device' + '\' + SetDevice[i].Dev_NAME + '\' + SetDevice[i].DEV_INPUTS[j].INP_NAME) then
            	begin
            		LoadInput(i , j)
              end
            else
            	begin
            		LoadDefInput(i , j);
              end;
          end;
      end;
  end
else
	begin
  	for i := 0 to Length(SetDevice) - 1 do
    	begin
			  LoadDefDevice(i);
      end;
  end;

end;

procedure TForm1.ME11Exit(Sender: TObject);
begin
 	SetDevice[currNode.Index].DELAY_BEFORE_PLAY := StrToInt(Trim(ME11.Text));
end;

procedure TForm1.ME12Exit(Sender: TObject);
begin
 	SetDevice[currNode.Index].DELAY_MOTION_DETECT := StrToInt(Trim(ME12.Text));
end;

procedure TForm1.ME13Exit(Sender: TObject);
begin
 	SetDevice[currNode.Index].DELAY_AFTER_CHANGE_CAMERA := StrToInt(Trim(ME13.Text));
end;

procedure TForm1.ME14Exit(Sender: TObject);
begin
 	SetDevice[currNode.Index].DELAY_AFTER_SETTINGS_CAMERA := StrToInt(Trim(ME14.Text));
end;

procedure TForm1.ME15Exit(Sender: TObject);
begin
	SetDevice[currNode.Index].DELAY_BETWEEN_SNAPSHOT := StrToInt(Trim(ME15.Text));
end;

procedure TForm1.ME210Exit(Sender: TObject);
begin
  SetDevice[CurrNode.Parent.Index].DEV_INPUTS[CurrNode.Index].INP_MOTION_GRID := ME210.Text + ' ' + ME211.Text + ' ' + ME212.Text + ' ' + ME213.Text + ' ' + ME214.Text + ' ' + ME215.Text + ' ' + ME216.Text + ' ' + ME217.Text + ' ' + ME218.Text + ' ' + ME219.Text;
end;

procedure TForm1.ME211Exit(Sender: TObject);
begin
  SetDevice[CurrNode.Parent.Index].DEV_INPUTS[CurrNode.Index].INP_MOTION_GRID := ME210.Text + ' ' + ME211.Text + ' ' + ME212.Text + ' ' + ME213.Text + ' ' + ME214.Text + ' ' + ME215.Text + ' ' + ME216.Text + ' ' + ME217.Text + ' ' + ME218.Text + ' ' + ME219.Text;
end;

procedure TForm1.ME212Exit(Sender: TObject);
begin
  SetDevice[CurrNode.Parent.Index].DEV_INPUTS[CurrNode.Index].INP_MOTION_GRID := ME210.Text + ' ' + ME211.Text + ' ' + ME212.Text + ' ' + ME213.Text + ' ' + ME214.Text + ' ' + ME215.Text + ' ' + ME216.Text + ' ' + ME217.Text + ' ' + ME218.Text + ' ' + ME219.Text;
end;

procedure TForm1.ME213Exit(Sender: TObject);
begin
  SetDevice[CurrNode.Parent.Index].DEV_INPUTS[CurrNode.Index].INP_MOTION_GRID := ME210.Text + ' ' + ME211.Text + ' ' + ME212.Text + ' ' + ME213.Text + ' ' + ME214.Text + ' ' + ME215.Text + ' ' + ME216.Text + ' ' + ME217.Text + ' ' + ME218.Text + ' ' + ME219.Text;
end;

procedure TForm1.ME214Exit(Sender: TObject);
begin
  SetDevice[CurrNode.Parent.Index].DEV_INPUTS[CurrNode.Index].INP_MOTION_GRID := ME210.Text + ' ' + ME211.Text + ' ' + ME212.Text + ' ' + ME213.Text + ' ' + ME214.Text + ' ' + ME215.Text + ' ' + ME216.Text + ' ' + ME217.Text + ' ' + ME218.Text + ' ' + ME219.Text;
end;

procedure TForm1.ME215Exit(Sender: TObject);
begin
  SetDevice[CurrNode.Parent.Index].DEV_INPUTS[CurrNode.Index].INP_MOTION_GRID := ME210.Text + ' ' + ME211.Text + ' ' + ME212.Text + ' ' + ME213.Text + ' ' + ME214.Text + ' ' + ME215.Text + ' ' + ME216.Text + ' ' + ME217.Text + ' ' + ME218.Text + ' ' + ME219.Text;
end;

procedure TForm1.ME216Exit(Sender: TObject);
begin
  SetDevice[CurrNode.Parent.Index].DEV_INPUTS[CurrNode.Index].INP_MOTION_GRID := ME210.Text + ' ' + ME211.Text + ' ' + ME212.Text + ' ' + ME213.Text + ' ' + ME214.Text + ' ' + ME215.Text + ' ' + ME216.Text + ' ' + ME217.Text + ' ' + ME218.Text + ' ' + ME219.Text;
end;

procedure TForm1.ME217Exit(Sender: TObject);
begin
  SetDevice[CurrNode.Parent.Index].DEV_INPUTS[CurrNode.Index].INP_MOTION_GRID := ME210.Text + ' ' + ME211.Text + ' ' + ME212.Text + ' ' + ME213.Text + ' ' + ME214.Text + ' ' + ME215.Text + ' ' + ME216.Text + ' ' + ME217.Text + ' ' + ME218.Text + ' ' + ME219.Text;
end;

procedure TForm1.ME218Exit(Sender: TObject);
begin
  SetDevice[CurrNode.Parent.Index].DEV_INPUTS[CurrNode.Index].INP_MOTION_GRID := ME210.Text + ' ' + ME211.Text + ' ' + ME212.Text + ' ' + ME213.Text + ' ' + ME214.Text + ' ' + ME215.Text + ' ' + ME216.Text + ' ' + ME217.Text + ' ' + ME218.Text + ' ' + ME219.Text;
end;

procedure TForm1.ME219Exit(Sender: TObject);
begin
  SetDevice[CurrNode.Parent.Index].DEV_INPUTS[CurrNode.Index].INP_MOTION_GRID := ME210.Text + ' ' + ME211.Text + ' ' + ME212.Text + ' ' + ME213.Text + ' ' + ME214.Text + ' ' + ME215.Text + ' ' + ME216.Text + ' ' + ME217.Text + ' ' + ME218.Text + ' ' + ME219.Text;
end;

procedure TForm1.ME21Exit(Sender: TObject);
var
hs : HResult;
begin
 TB21.Position := StrToInt(Trim(ME21.Text));
end;

procedure TForm1.ME220Exit(Sender: TObject);
begin
  SetDevice[CurrNode.Parent.Index].DEV_INPUTS[CurrNode.Index].INP_MOTION_GLOBAL_SENS := StrToInt(Trim(ME220.Text));
end;

procedure TForm1.ME221Exit(Sender: TObject);
begin
  SetDevice[CurrNode.Parent.Index].DEV_INPUTS[CurrNode.Index].INP_MOTION_PERCENT := StrToInt(Trim(ME221.Text));
end;

procedure TForm1.ME22Exit(Sender: TObject);
begin
 TB22.Position := StrToInt(Trim(ME22.Text));
end;

procedure TForm1.ME23Exit(Sender: TObject);
begin
 TB23.Position := StrToInt(Trim(ME23.Text));
end;

procedure TForm1.ME24Exit(Sender: TObject);
begin
 TB24.Position := StrToInt(Trim(ME24.Text));
end;

procedure TForm1.ME25Exit(Sender: TObject);
begin
 TB25.Position := StrToInt(Trim(ME25.Text));
end;

procedure TForm1.ME26Exit(Sender: TObject);
begin
 TB26.Position := StrToInt(Trim(ME26.Text));
end;

procedure TForm1.ME27Exit(Sender: TObject);
begin
 TB27.Position := StrToInt(Trim(ME27.Text));
end;

procedure TForm1.ME28Exit(Sender: TObject);
begin
 TB28.Position := StrToInt(Trim(ME28.Text));
end;

procedure TForm1.ME29Exit(Sender: TObject);
begin
 TB29.Position := StrToInt(Trim(ME29.Text));
end;

procedure TForm1.SaveSetCommon;
begin
	SetCommon.JRN_FILEPATH := E01.Text;
  SetCommon.JRN_FILEMASK	:= E03.Text;
  SetCommon.PATH_SAVE_IMAGE := E02.Text;
end;

procedure TForm1.SaveSetDevice(Dev: Integer);
begin
	SetDevice[Dev].DEV_ON := ChB11.Checked;
   SetDevice[Dev].DELAY_BEFORE_PLAY	:= StrToInt(Trim(ME11.Text));
  SetDevice[Dev].DEV_MOTION	:= ChB12.Checked;
   SetDevice[Dev].DELAY_MOTION_DETECT	:= StrToInt(Trim(ME12.Text));
   SetDevice[Dev].DELAY_AFTER_CHANGE_CAMERA	:= StrToInt(Trim(ME13.Text));
   SetDevice[Dev].DELAY_AFTER_SETTINGS_CAMERA	:= StrToInt(Trim(ME14.Text));
   SetDevice[Dev].DELAY_BETWEEN_SNAPSHOT	:= StrToInt(Trim(ME15.Text));
end;

procedure TForm1.SaveSetInput(Dev, Inp: Integer);
begin
  with SetDevice[Dev] do
  begin
    Dev_Inputs[Inp].INP_MAIN := ChB21.Checked;
    Dev_Inputs[Inp].INP_ON		:= ChB22.Checked;
    Dev_Inputs[Inp].INP_MOTION_PERCENT := StrToInt(ME221.Text);
    Dev_Inputs[Inp].INP_MOTION_GRID := ME210.Text + ' ' + ME211.Text + ' ' + ME212.Text + ' ' + ME213.Text + ' ' + ME214.Text + ' ' + ME215.Text + ' ' + ME216.Text + ' ' + ME217.Text + ' ' + ME218.Text + ' ' + ME219.Text;
   	Dev_Inputs[Inp].INP_MOTION_GLOBAL_SENS := StrToInt(ME220.Text);
    Dev_Inputs[Inp].INP_MEDIA_TYPE := CB1.ItemIndex;
/////  	Dev_Inputs[Inp].INP_REGULAR_PERIOD := ;

 		Dev_Inputs[Inp].INP_BACKLIGTHCOMPENSATION := StrToInt(Trim(ME28.Text));
 		Dev_Inputs[Inp].INP_BRIGHTNESS := StrToInt(Trim(ME21.Text));
		Dev_Inputs[Inp].INP_COLORENABLE := ChB24.Checked;
 		Dev_Inputs[Inp].INP_CONTRAST := StrToInt(Trim(ME22.Text));
//		Dev_Inputs[Inp].INP_DIGITALMULTIPLIER := ;
 		Dev_Inputs[Inp].INP_GAIN := StrToInt(Trim(ME29.Text));
 		Dev_Inputs[Inp].INP_GAMMA := StrToInt(Trim(ME26.Text));
     Dev_Inputs[Inp].INP_HUE := StrToInt(Trim(ME23.Text));
//    Dev_Inputs[Inp].INP_POWERLINEFREQUENCY := ;
     Dev_Inputs[Inp].INP_SATURATION := StrToInt(Trim(ME24.Text));
     Dev_Inputs[Inp].INP_SHARPNESS := StrToInt(Trim(ME25.Text));
    Dev_Inputs[Inp].INP_WHITEBALANCE := StrToInt(Trim(ME27.Text));
//    Dev_Inputs[Inp].INP_WHITEBALANCECOMPONENT := ;


  end;
end;

procedure TForm1.SaveToReg;
var
i , j : Integer;
begin
  if not Reg.KeyExists(REG_KEY) then
    begin
    	Reg.CreateKey(REG_KEY);
      Reg.CreateKey(Reg_KEY + '\Common');
      Reg.CreateKey(Reg_KEY + '\Device');
      Reg.CreateKey(Reg_KEY + '\Events');
    end;
      Reg.CloseKey;
      Reg.OpenKey(REG_KEY + '\Common', true);
      Reg.WriteString('PathJournal' , SetCommon.JRN_FILEPATH);
      Reg.WriteString('MaskJournal' , SetCommon.JRN_FILEMASK);
      Reg.WriteString('PathSnapShot' , SetCommon.PATH_SAVE_IMAGE);
      Reg.CloseKey;
      Reg.OpenKey(REG_KEY + '\Device', true);
			if Length(SetDevice) > 0 then
      	begin
		     	for i := 0 to Length(SetDevice) - 1 do
    	    	begin
				      Reg.CloseKey;
              Reg.OpenKey(REG_KEY + '\Device\' + SetDevice[i].Dev_NAME , true);
              Reg.WriteBool('DevOn' , SetDevice[i].DEV_ON);
              Reg.WriteBool('DevMotion' , SetDevice[i].DEV_MOTION);
              Reg.WriteBool('DevPreview' , SetDevice[i].DEV_PREVIEW);
              Reg.WriteBool('DevPreviewImage' , SetDevice[i].DEV_PREVIEW_IMAGE);
              Reg.WriteInteger('DelayPlay' , SetDevice[i].DELAY_BEFORE_PLAY);
              Reg.WriteInteger('DelayMotionDetect' , SetDevice[i].DELAY_MOTION_DETECT);
              Reg.WriteInteger('DelayChangeCamera' , SetDevice[i].DELAY_AFTER_CHANGE_CAMERA);
              Reg.WriteInteger('DelaySettingCamera' , SetDevice[i].DELAY_AFTER_SETTINGS_CAMERA);
              Reg.WriteInteger('DelaySnapShot' , SetDevice[i].DELAY_BETWEEN_SNAPSHOT);
              Reg.WriteInteger('WindowLeft' , SetDevice[i].DEV_WINDOW_LEFT);
              Reg.WriteInteger('WindowTop' , SetDevice[i].DEV_WINDOW_TOP);
              Reg.WriteInteger('WindowWidth' , SetDevice[i].DEV_WINDOW_WIDTH);
              Reg.WriteInteger('WindowHeigth' , SetDevice[i].DEV_WINDOW_HEIGTH);
              if Length(SetDevice[i].DEV_INPUTS) > 0 then
              	begin
                 	for j := 0 to Length(SetDevice[i].DEV_INPUTS) - 1 do
                  	begin
								      Reg.CloseKey;
				              Reg.OpenKey(REG_KEY + '\Device\' + SetDevice[i].Dev_NAME + '\' + SetDevice[i].DEV_INPUTS[j].INP_NAME, true);
                      Reg.WriteBool('InpMain' , SetDevice[i].DEV_INPUTS[j].INP_MAIN);
                      Reg.WriteBool('InpOn' , SetDevice[i].DEV_INPUTS[j].INP_ON);
                      Reg.WriteBool('ColorEnable' 								, SetDevice[i].DEV_INPUTS[j].INP_COLORENABLE);
                      Reg.WriteInteger('MotionPercent' 						, SetDevice[i].DEV_INPUTS[j].INP_MOTION_PERCENT);
                      Reg.WriteInteger('MotionSensitive' 					, SetDevice[i].DEV_INPUTS[j].INP_MOTION_GLOBAL_SENS);
                      Reg.WriteInteger('MediaType' 								, SetDevice[i].DEV_INPUTS[j].INP_MEDIA_TYPE);
                      Reg.WriteInteger('RegularPeriod' 						, SetDevice[i].DEV_INPUTS[j].INP_REGULAR_PERIOD);
                      Reg.WriteInteger('BackLigthCompensatuion' 	, SetDevice[i].DEV_INPUTS[j].INP_BACKLIGTHCOMPENSATION);
                      Reg.WriteInteger('Brightness' 							, SetDevice[i].DEV_INPUTS[j].INP_BRIGHTNESS);
                      Reg.WriteInteger('Contrast' 								, SetDevice[i].DEV_INPUTS[j].INP_CONTRAST);
                      Reg.WriteInteger('DigitalMultiplier' 				, SetDevice[i].DEV_INPUTS[j].INP_DIGITALMULTIPLIER);
                      Reg.WriteInteger('Gain' 										, SetDevice[i].DEV_INPUTS[j].INP_GAIN);
                      Reg.WriteInteger('Gamma' 										, SetDevice[i].DEV_INPUTS[j].INP_GAMMA);
                      Reg.WriteInteger('Hue' 											, SetDevice[i].DEV_INPUTS[j].INP_HUE);
                      Reg.WriteInteger('PowerLineFrequency' 			, SetDevice[i].DEV_INPUTS[j].INP_POWERLINEFREQUENCY);
                      Reg.WriteInteger('Saturation' 							, SetDevice[i].DEV_INPUTS[j].INP_SATURATION);
                      Reg.WriteInteger('Sharpness' 								, SetDevice[i].DEV_INPUTS[j].INP_SHARPNESS);
                      Reg.WriteInteger('WhiteBalance' 						, SetDevice[i].DEV_INPUTS[j].INP_WHITEBALANCE);
                      Reg.WriteInteger('WhiteBalanceComponent' 		, SetDevice[i].DEV_INPUTS[j].INP_WHITEBALANCECOMPONENT);
                      Reg.WriteString('MotionGrid' , SetDevice[i].DEV_INPUTS[j].INP_MOTION_GRID );
                    end;
                end;

      	    end;
        end;

end;

procedure TForm1.StartPreview(Dev, Inp: Integer);
var
hs : HResult;
begin
	FG.Active := false;
  FG.ClearGraph;
  FL.BaseFilter.Moniker := CapEnum.GetMoniker(Dev);
  FG.Active := true;
  hs := (FG as ICaptureGraphBuilder2).FindInterface(@LOOK_UPSTREAM_ONLY,nil,(FL as IBaseFilter),IID_IAMCrossBar,CrossBar);
  if (SUCCEEDED(hs)) then
  	begin
				hs := CrossBar.Route(0 , Inp);
    end;

  hs := (FG as ICaptureGraphBuilder2).RenderStream(@PIN_CATEGORY_PreVIEW, nil, (FL as IBaseFilter),(SG as IBaseFilter), (VW as IBaseFilter));
  FG.Play;
end;

procedure TForm1.StopPreview;
begin
	FG.Active := false;
  FG.ClearGraph;
end;

procedure TForm1.TB21Change(Sender: TObject);
var
hs : HResult;
begin
	ME21.Text := IntToStr(TB21.Position);
  SetDevice[CurrNode.Parent.Index].DEV_INPUTS[CurrNode.Index].INP_BRIGHTNESS := TB21.Position;
  if TB21.Position = TB21.Tag then
  	ME21.Color := clYellow
  else
  	ME21.Color := clWhite;
 if FG.Active then
	begin
		hs := VideoProcAmp.Set_(VideoProcAmp_Brightness , StrToInt(Trim(ME21.Text)) , pFlags);
  end;
end;

procedure TForm1.TB22Change(Sender: TObject);
var
hs : HResult;
begin
	ME22.Text := IntToStr(TB22.Position);
  SetDevice[CurrNode.Parent.Index].DEV_INPUTS[CurrNode.Index].INP_CONTRAST := TB22.Position;
  if TB22.Position = TB22.Tag then
  	ME22.Color := clYellow
  else
  	ME22.Color := clWhite;
 if FG.Active then
	begin
		hs := VideoProcAmp.Set_(VideoProcAmp_Contrast , StrToInt(Trim(ME22.Text)) , pFlags);
  end;
end;

procedure TForm1.TB23Change(Sender: TObject);
var
hs : HResult;
begin
	ME23.Text := IntToStr(TB23.Position);
  SetDevice[CurrNode.Parent.Index].DEV_INPUTS[CurrNode.Index].INP_HUE := TB23.Position;
  if TB23.Position = TB23.Tag then
  	ME23.Color := clYellow
  else
  	ME23.Color := clWhite;
 if FG.Active then
	begin
		hs := VideoProcAmp.Set_(VideoProcAmp_Hue , StrToInt(Trim(ME23.Text)) , pFlags);
  end;
end;

procedure TForm1.TB24Change(Sender: TObject);
var
hs : HResult;
begin
	ME24.Text := IntToStr(TB24.Position);
  SetDevice[CurrNode.Parent.Index].DEV_INPUTS[CurrNode.Index].INP_SATURATION := TB24.Position;
  if TB24.Position = TB24.Tag then
  	ME24.Color := clYellow
  else
  	ME24.Color := clWhite;
 if FG.Active then
	begin
		hs := VideoProcAmp.Set_(VideoProcAmp_Saturation , StrToInt(Trim(ME24.Text)) , pFlags);
  end;
end;

procedure TForm1.TB25Change(Sender: TObject);
var
hs : HResult;
begin
	ME25.Text := IntToStr(TB25.Position);
  SetDevice[CurrNode.Parent.Index].DEV_INPUTS[CurrNode.Index].INP_SHARPNESS := TB25.Position;
  if TB25.Position = TB25.Tag then
  	ME25.Color := clYellow
  else
  	ME25.Color := clWhite;
 if FG.Active then
	begin
		hs := VideoProcAmp.Set_(VideoProcAmp_Sharpness , StrToInt(Trim(ME25.Text)) , pFlags);
  end;
end;

procedure TForm1.TB26Change(Sender: TObject);
var
hs : HResult;
begin
	ME26.Text := IntToStr(TB26.Position);
  SetDevice[CurrNode.Parent.Index].DEV_INPUTS[CurrNode.Index].INP_GAMMA := TB26.Position;
  if TB26.Position = TB26.Tag then
  	ME26.Color := clYellow
  else
  	ME26.Color := clWhite;
 if FG.Active then
	begin
		hs := VideoProcAmp.Set_(VideoProcAmp_Gamma , StrToInt(Trim(ME26.Text)) , pFlags);
  end;
end;

procedure TForm1.TB27Change(Sender: TObject);
var
hs : HResult;
begin
	ME27.Text := IntToStr(TB27.Position);
  SetDevice[CurrNode.Parent.Index].DEV_INPUTS[CurrNode.Index].INP_WHITEBALANCE := TB27.Position;
  if TB27.Position = TB27.Tag then
  	ME27.Color := clYellow
  else
  	ME27.Color := clWhite;
 if FG.Active then
	begin
		hs := VideoProcAmp.Set_(VideoProcAmp_Whitebalance , StrToInt(Trim(ME27.Text)) , pFlags);
  end;
end;

procedure TForm1.TB28Change(Sender: TObject);
var
hs : HResult;
begin
	ME28.Text := IntToStr(TB28.Position);
  SetDevice[CurrNode.Parent.Index].DEV_INPUTS[CurrNode.Index].INP_BACKLIGTHCOMPENSATION := TB28.Position;
  if TB28.Position = TB28.Tag then
  	ME28.Color := clYellow
  else
  	ME28.Color := clWhite;
 if FG.Active then
	begin
		hs := VideoProcAmp.Set_(VideoProcAmp_Backlightcompensation , StrToInt(Trim(ME28.Text)) , pFlags);
  end;
end;

procedure TForm1.TB29Change(Sender: TObject);
var
hs : HResult;
begin
	ME29.Text := IntToStr(TB29.Position);
  SetDevice[CurrNode.Parent.Index].DEV_INPUTS[CurrNode.Index].INP_GAIN := TB29.Position;
  if TB29.Position = TB29.Tag then
  	ME29.Color := clYellow
  else
  	ME29.Color := clWhite;
 if FG.Active then
	begin
		hs := VideoProcAmp.Set_(VideoProcAmp_Gain , StrToInt(Trim(ME29.Text)) , pFlags);
  end;
end;

procedure TForm1.TV1Change(Sender: TObject; Node: TTreeNode);
var
	GridSens : String;
  hs , hr : HResult;
  i : Integer;
begin
	if CurrNode <> nil then
  	begin
	    if ((CurrNode.Level = 0) and (CurrNode.Index = 0)) then
  	  	begin
    	   SaveSetCommon;
      	end;

			if ((CurrNode.Parent.Index = 1) and (CurrNode.Level <> 1)) then
  		  begin
    		 SaveSetInput(CurrNode.Parent.Index , CurrNode.Index);
	    	end;
	    if ((CurrNode.Level = 1) and (CurrNode.Parent.Index = 1)) then
  	    begin
    	  	SaveSetDevice(CurrNode.Index);
      	end;
    end;
CurrNode := Node;
if ((Node.Level = 0) and (Node.Index = 0)) then
  begin
  	E01.Text := SetCommon.JRN_FILEPATH;
    E02.Text := SetCommon.PATH_SAVE_IMAGE;
    E03.Text := SetCommon.JRN_FILEMASK;
    P0.Visible := true;
  end
else
	begin
   P0.Visible := false;
  end;
if ((Node.Level = 1)) then
  begin
    P1.Visible := true;
    Label22.Caption := Node.Text;
    SetDevice[Node.Index].Dev_NAME := Node.Text;
    ChB11.Checked := SetDevice[Node.Index].DEV_ON;
    ChB12.Checked := SetDevice[Node.Index].DEV_MOTION;
    ME11.Text := IntToStr(SetDevice[Node.Index].DELAY_BEFORE_PLAY);
    ME12.Text := IntToStr(SetDevice[Node.Index].DELAY_MOTION_DETECT);
    ME13.Text := IntToStr(SetDevice[Node.Index].DELAY_AFTER_CHANGE_CAMERA);
    ME14.Text := IntToStr(SetDevice[Node.Index].DELAY_AFTER_SETTINGS_CAMERA);
    ME15.Text := IntToStr(SetDevice[Node.Index].DELAY_BETWEEN_SNAPSHOT);

  end
else
	begin
   P1.Visible := false;
  end;
if Node.Level = 2 then
	begin
  	GridSens := SetDevice[Node.Parent.Index].DEV_INPUTS[Node.Index].INP_MOTION_GRID;

    FG.Active := false;
    FG.ClearGraph;
    FL.BaseFilter.Moniker := CapEnum.GetMoniker(currNode.Parent.Index);
    FG.Active := true;
    hs := (FG as ICaptureGraphBuilder2).FindInterface(@PIN_CATEGORY_CAPTURE, @MEDIATYPE_Video, FL as IBaseFilter, IID_IAMVideoProcAmp, VideoProcAmp);
		if SUCCEEDED(hs) then
    	begin
	    	hr := VideoProcAmp.GetRange(VideoProcAmp_Brightness , pMin , pMax , pStep , pDefault , pFlags);
        if SUCCEEDED(hr) then
          begin
            ME21.Enabled := true;
            TB21.Enabled := true;
            Label13.Enabled := true;

            TB21.LineSize := pStep;
            TB21.Frequency := pStep * 10;
            TB21.Tag := pDefault;
            if SetDevice[Node.Parent.Index].DEV_INPUTS[Node.Index].INP_BRIGHTNESS = -1 then
            	begin
    		      	if pDefault > TB21.Max then
                	begin
	                	TB21.Min := pMin;
		    		        TB21.Max := pMax;
                    TB21.Position := pDefault;
                  end
                else
                	begin
                    TB21.Position := pDefault;
	                	TB21.Min := pMin;
		    		        TB21.Max := pMax;
                  end;
              end
            else
            	begin
                if SetDevice[Node.Parent.Index].DEV_INPUTS[Node.Index].INP_BRIGHTNESS > TB21.Max then
                	begin
	                	TB21.Min := pMin;
		    		        TB21.Max := pMax;
		    		      	TB21.Position := SetDevice[Node.Parent.Index].DEV_INPUTS[Node.Index].INP_BRIGHTNESS;
                  end
                else
                	begin
  	    		      	TB21.Position := SetDevice[Node.Parent.Index].DEV_INPUTS[Node.Index].INP_BRIGHTNESS;
	                	TB21.Min := pMin;
		    		        TB21.Max := pMax;
                  end;
              end;
          end
        else
        	begin
          	ME21.Text := '0';
            ME21.Enabled := false;
            TB21.Position := 0;
            TB21.Enabled := false;
            Label13.Enabled := false;
          end;

	    	hr := VideoProcAmp.GetRange(VideoProcAmp_Contrast , pMin , pMax , pStep , pDefault , pFlags);
        if SUCCEEDED(hr) then
          begin
            ME22.Enabled := true;
            TB22.Enabled := true;
            Label14.Enabled := true;

            TB22.LineSize := pStep;
            TB22.Frequency := pStep * 10;
            TB22.Tag := pDefault;
            if SetDevice[Node.Parent.Index].DEV_INPUTS[Node.Index].INP_CONTRAST = -1 then
            	begin
    		      	if pDefault > TB22.Max then
                	begin
	                	TB22.Min := pMin;
		    		        TB22.Max := pMax;
                    TB22.Position := pDefault;
                  end
                else
                	begin
                    TB22.Position := pDefault;
	                	TB22.Min := pMin;
		    		        TB22.Max := pMax;
                  end;
              end
            else
            	begin
                if SetDevice[Node.Parent.Index].DEV_INPUTS[Node.Index].INP_CONTRAST > TB22.Max then
                	begin
	                	TB22.Min := pMin;
		    		        TB22.Max := pMax;
				          	TB22.Position := SetDevice[Node.Parent.Index].DEV_INPUTS[Node.Index].INP_CONTRAST;
                  end
                else
                	begin
				          	TB22.Position := SetDevice[Node.Parent.Index].DEV_INPUTS[Node.Index].INP_CONTRAST;
	                	TB22.Min := pMin;
		    		        TB22.Max := pMax;
                  end;
              end;
          end
        else
        	begin
          	ME22.Text := '0';
            ME22.Enabled := false;
            TB22.Position := 0;
            TB22.Enabled := false;
            Label14.Enabled := false;
          end;

	    	hr := VideoProcAmp.GetRange(VideoProcAmp_Hue , pMin , pMax , pStep , pDefault , pFlags);
        if SUCCEEDED(hr) then
          begin
          	ME23.Enabled := true;
            TB23.Enabled := true;
            Label15.Enabled := true;

            TB23.LineSize := pStep;
            TB23.Frequency := pStep * 10;
            TB23.Tag := pDefault;
            if SetDevice[Node.Parent.Index].DEV_INPUTS[Node.Index].INP_HUE = -1 then
            	begin
    		      	if pDefault > TB23.Max then
                	begin
	                	TB23.Min := pMin;
		    		        TB23.Max := pMax;
                    TB23.Position := pDefault;
                  end
                else
                	begin
                    TB23.Position := pDefault;
	                	TB23.Min := pMin;
		    		        TB23.Max := pMax;
                  end;
              end
            else
            	begin
                if SetDevice[Node.Parent.Index].DEV_INPUTS[Node.Index].INP_HUE > TB23.Max then
                	begin
	                	TB23.Min := pMin;
		    		        TB23.Max := pMax;
										TB23.Position := SetDevice[Node.Parent.Index].DEV_INPUTS[Node.Index].INP_HUE;
                  end
                else
                	begin
										TB23.Position := SetDevice[Node.Parent.Index].DEV_INPUTS[Node.Index].INP_HUE;
	                	TB23.Min := pMin;
		    		        TB23.Max := pMax;
                  end;
              end;
          end
        else
        	begin
          	ME23.Text := '0';
            ME23.Enabled := false;
            TB23.Position := 0;
            TB23.Enabled := false;
            Label15.Enabled := false;
          end;


	    	hr := VideoProcAmp.GetRange(VideoProcAmp_Saturation , pMin , pMax , pStep , pDefault , pFlags);
        if SUCCEEDED(hr) then
          begin
          	ME24.Enabled := true;
          	TB24.Enabled := true;
          	Label16.Enabled := true;
            TB24.LineSize := pStep;
            TB24.Frequency := pStep * 10;
            TB24.Tag := pDefault;
            if SetDevice[Node.Parent.Index].DEV_INPUTS[Node.Index].INP_SATURATION = -1 then
            	begin
    		      	if pDefault > TB24.Max then
                	begin
	                	TB24.Min := pMin;
		    		        TB24.Max := pMax;
                    TB24.Position := pDefault;
                  end
                else
                	begin
                    TB24.Position := pDefault;
	                	TB24.Min := pMin;
		    		        TB24.Max := pMax;
                  end;
              end
            else
            	begin
                if SetDevice[Node.Parent.Index].DEV_INPUTS[Node.Index].INP_SATURATION > TB24.Max then
                	begin
	                	TB24.Min := pMin;
		    		        TB24.Max := pMax;
										TB24.Position := SetDevice[Node.Parent.Index].DEV_INPUTS[Node.Index].INP_SATURATION;
                  end
                else
                	begin
										TB24.Position := SetDevice[Node.Parent.Index].DEV_INPUTS[Node.Index].INP_SATURATION;
	                	TB24.Min := pMin;
		    		        TB24.Max := pMax;
                  end;
              end;
          end
        else
        	begin
          	ME24.Text := '0';
            ME24.Enabled := false;
            TB24.Position := 0;
            TB24.Enabled := false;
            Label16.Enabled := false;
          end;

	    	hr := VideoProcAmp.GetRange(VideoProcAmp_Sharpness , pMin , pMax , pStep , pDefault , pFlags);
        if SUCCEEDED(hr) then
          begin
          	ME25.Enabled := true;
            TB25.Enabled := true;
            Label17.Enabled := true;
            TB25.Min := pMin;
            TB25.Max := pMax;
            TB25.LineSize := pStep;
            TB25.Frequency := pStep * 10;
            TB25.Tag := pDefault;
            if SetDevice[Node.Parent.Index].DEV_INPUTS[Node.Index].INP_SHARPNESS = -1 then
            	begin
    		      	if pDefault > TB25.Max then
                	begin
	                	TB25.Min := pMin;
		    		        TB25.Max := pMax;
                    TB25.Position := pDefault;
                  end
                else
                	begin
                    TB25.Position := pDefault;
	                	TB25.Min := pMin;
		    		        TB25.Max := pMax;
                  end;
              end
            else
            	begin
                if SetDevice[Node.Parent.Index].DEV_INPUTS[Node.Index].INP_SHARPNESS > TB25.Max then
                	begin
	                	TB25.Min := pMin;
		    		        TB25.Max := pMax;
										TB25.Position := SetDevice[Node.Parent.Index].DEV_INPUTS[Node.Index].INP_SHARPNESS;
                  end
                else
                	begin
										TB25.Position := SetDevice[Node.Parent.Index].DEV_INPUTS[Node.Index].INP_SHARPNESS;
	                	TB25.Min := pMin;
		    		        TB25.Max := pMax;
                  end;
              end;
          end
        else
        	begin
          	ME25.Text := '0';
            ME25.Enabled := false;
            TB25.Position := 0;
            TB25.Enabled := false;
            Label17.Enabled := false;
          end;

	    	hr := VideoProcAmp.GetRange(VideoProcAmp_Gamma , pMin , pMax , pStep , pDefault , pFlags);
        if SUCCEEDED(hr) then
          begin
            ME26.Enabled := true;
            TB26.Enabled := true;
            Label18.Enabled := true;
            TB26.LineSize := pStep;
            TB26.Frequency := pStep * 10;
            TB26.Tag := pDefault;
            if SetDevice[Node.Parent.Index].DEV_INPUTS[Node.Index].INP_GAMMA = -1 then
            	begin
    		      	if pDefault > TB26.Max then
                	begin
	                	TB26.Min := pMin;
		    		        TB26.Max := pMax;
                    TB26.Position := pDefault;
                  end
                else
                	begin
                    TB26.Position := pDefault;
	                	TB26.Min := pMin;
		    		        TB26.Max := pMax;
                  end;
              end
            else
            	begin
                if SetDevice[Node.Parent.Index].DEV_INPUTS[Node.Index].INP_GAMMA > TB26.Max then
                	begin
	                	TB26.Min := pMin;
		    		        TB26.Max := pMax;
										TB26.Position := SetDevice[Node.Parent.Index].DEV_INPUTS[Node.Index].INP_GAMMA;
                  end
                else
                	begin
										TB26.Position := SetDevice[Node.Parent.Index].DEV_INPUTS[Node.Index].INP_GAMMA;
	                	TB26.Min := pMin;
		    		        TB26.Max := pMax;
                  end;
              end;

            if SetDevice[Node.Parent.Index].DEV_INPUTS[Node.Index].INP_GAMMA = -1 then
          		TB26.Position := pDefault
          	else
	          	TB26.Position := SetDevice[Node.Parent.Index].DEV_INPUTS[Node.Index].INP_GAMMA;
          end
        else
        	begin
          	ME26.Text := '0';
            ME26.Enabled := false;
            TB26.Position := 0;
            TB26.Enabled := false;
            Label18.Enabled := false;
          end;

	    	hr := VideoProcAmp.GetRange(VideoProcAmp_WHITEBALANCE , pMin , pMax , pStep , pDefault , pFlags);
        if SUCCEEDED(hr) then
          begin
            ME27.Enabled := true;
            TB27.Enabled := true;
            Label19.Enabled := true;
            TB27.LineSize := pStep;
            TB27.Frequency := pStep * 10;
            TB27.Tag := pDefault;
            if SetDevice[Node.Parent.Index].DEV_INPUTS[Node.Index].INP_WHITEBALANCE = -1 then
            	begin
    		      	if pDefault > TB27.Max then
                	begin
	                	TB27.Min := pMin;
		    		        TB27.Max := pMax;
                    TB27.Position := pDefault;
                  end
                else
                	begin
                    TB27.Position := pDefault;
	                	TB27.Min := pMin;
		    		        TB27.Max := pMax;
                  end;
              end
            else
            	begin
                if SetDevice[Node.Parent.Index].DEV_INPUTS[Node.Index].INP_WHITEBALANCE > TB27.Max then
                	begin
	                	TB27.Min := pMin;
		    		        TB27.Max := pMax;
										TB27.Position := SetDevice[Node.Parent.Index].DEV_INPUTS[Node.Index].INP_WHITEBALANCE;
                  end
                else
                	begin
										TB27.Position := SetDevice[Node.Parent.Index].DEV_INPUTS[Node.Index].INP_WHITEBALANCE;
	                	TB27.Min := pMin;
		    		        TB27.Max := pMax;
                  end;
              end;
          end
        else
        	begin
          	ME27.Text := '0';
            ME27.Enabled := false;
            TB27.Position := 0;
            TB27.Enabled := false;
            Label19.Enabled := false;
          end;

	    	hr := VideoProcAmp.GetRange(VideoProcAmp_BacklightCompensation , pMin , pMax , pStep , pDefault , pFlags);
        if SUCCEEDED(hr) then
          begin
            ME28.Enabled := true;
            TB28.Enabled := true;
            Label20.Enabled := true;
            TB28.Min := pMin;
            TB28.Max := pMax;
            TB28.Frequency := pStep * 10;
            TB28.Tag := pDefault;
            if SetDevice[Node.Parent.Index].DEV_INPUTS[Node.Index].INP_BACKLIGTHCOMPENSATION = -1 then
            	begin
    		      	if pDefault > TB28.Max then
                	begin
	                	TB28.Min := pMin;
		    		        TB28.Max := pMax;
                    TB28.Position := pDefault;
                  end
                else
                	begin
                    TB28.Position := pDefault;
	                	TB28.Min := pMin;
		    		        TB28.Max := pMax;
                  end;
              end
            else
            	begin
                if SetDevice[Node.Parent.Index].DEV_INPUTS[Node.Index].INP_BACKLIGTHCOMPENSATION > TB28.Max then
                	begin
	                	TB28.Min := pMin;
		    		        TB28.Max := pMax;
										TB28.Position := SetDevice[Node.Parent.Index].DEV_INPUTS[Node.Index].INP_BACKLIGTHCOMPENSATION;
                  end
                else
                	begin
										TB28.Position := SetDevice[Node.Parent.Index].DEV_INPUTS[Node.Index].INP_BACKLIGTHCOMPENSATION;
	                	TB28.Min := pMin;
		    		        TB28.Max := pMax;
                  end;
              end;
          end
        else
        	begin
          	ME28.Text := '0';
            ME28.Enabled := false;
            TB28.Position := 0;
            TB28.Enabled := false;
            Label20.Enabled := false;
          end;

	    	hr := VideoProcAmp.GetRange(VideoProcAmp_Gain , pMin , pMax , pStep , pDefault , pFlags);
        if SUCCEEDED(hr) then
          begin
            ME29.Enabled := true;
            TB29.Enabled := true;
            Label21.Enabled := true;
            TB29.Min := pMin;
            TB29.Max := pMax;
            TB29.LineSize := pStep;
            TB29.Frequency := pStep * 10;
            TB29.Tag := pDefault;
            if SetDevice[Node.Parent.Index].DEV_INPUTS[Node.Index].INP_GAIN = -1 then
            	begin
    		      	if pDefault > TB29.Max then
                	begin
	                	TB29.Min := pMin;
		    		        TB29.Max := pMax;
                    TB29.Position := pDefault;
                  end
                else
                	begin
                    TB29.Position := pDefault;
	                	TB29.Min := pMin;
		    		        TB29.Max := pMax;
                  end;
              end
            else
            	begin
                if SetDevice[Node.Parent.Index].DEV_INPUTS[Node.Index].INP_GAIN > TB29.Max then
                	begin
	                	TB29.Min := pMin;
		    		        TB29.Max := pMax;
										TB29.Position := SetDevice[Node.Parent.Index].DEV_INPUTS[Node.Index].INP_GAIN;
                  end
                else
                	begin
										TB29.Position := SetDevice[Node.Parent.Index].DEV_INPUTS[Node.Index].INP_GAIN;
	                	TB29.Min := pMin;
		    		        TB29.Max := pMax;
                  end;
              end;
          end
        else
        	begin
          	ME29.Text := '0';
            ME29.Enabled := false;
            TB29.Position := 0;
            TB29.Enabled := false;
            Label21.Enabled := false;
          end;
      end
    else
    	begin

      end;
    ChB24.Checked := SetDevice[Node.Parent.Index].DEV_INPUTS[Node.Index].INP_COLORENABLE;
    Chb21.Checked := SetDevice[Node.Parent.Index].DEV_INPUTS[Node.Index].INP_MAIN;
    Chb22.Checked := SetDevice[Node.Parent.Index].DEV_INPUTS[Node.Index].INP_ON;
    ME220.Text := IntToStr(SetDevice[Node.Parent.Index].DEV_INPUTS[Node.Index].INP_MOTION_GLOBAL_SENS);
    ME221.Text := IntToStr(SetDevice[Node.Parent.Index].DEV_INPUTS[Node.Index].INP_MOTION_PERCENT);
    ChB23.Checked := false;
    ME210.Text := Copy(GridSens , 1 , 10);
    ME211.Text := Copy(GridSens , 12 , 10);
    ME212.Text := Copy(GridSens , 23 , 10);
    ME213.Text := Copy(GridSens , 34 , 10);
    ME214.Text := Copy(GridSens , 45 , 10);
    ME215.Text := Copy(GridSens , 56 , 10);
    ME216.Text := Copy(GridSens , 67 , 10);
    ME217.Text := Copy(GridSens , 78 , 10);
    ME218.Text := Copy(GridSens , 89 , 10);
    ME219.Text := Copy(GridSens , 100 , 10);
    CB1.Clear;
    FG.Active := false;
    FL.BaseFilter.Moniker := CapEnum.GetMoniker(CurrNode.Parent.Index);
    FG.Active := true;
		PinList := TPinList.Create(FL as IBaseFilter);
		VideoMediaTypes := TEnumMediaType.Create;
    VideoMediaTypes.Assign(PinList.First);
    for i := 0 to VideoMediaTypes.Count - 1 do
      CB1.Items.Add(VideoMediaTypes.MediaDescription[i]);
    FG.Active := false;
//    VideoMediaTypes := nil;
    VideoMediaTypes.Free;
    PinList.Free;
    if SetDevice[Node.Parent.Index].DEV_INPUTS[Node.Index].INP_MEDIA_TYPE < CB1.Items.Count then
	    CB1.Text := CB1.Items[SetDevice[Node.Parent.Index].DEV_INPUTS[Node.Index].INP_MEDIA_TYPE]
    else
    	CB1.Text := CB1.Items[0];
		P2.Visible := true;
  end
else
	begin
		P2.Visible := false;
  end;


end;

end.
