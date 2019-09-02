unit ufrmSettings;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls
  , DSPack, DSUtil, DirectShow9,
  clLogAcceptor1, BaseFilterEditor, StdCtrls, Mask, ExtCtrls;

type
  TfrmSettings = class(TForm)
    TV1: TTreeView;
    FG: TFilterGraph;
    FL: TFilter;
    VW: TVideoWindow;
    SG: TSampleGrabber;
    P1: TPanel;
    L11: TLabel;
    ChB1: TCheckBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    L12: TLabel;
    L13: TLabel;
    L14: TLabel;
    L15: TLabel;
    L16: TLabel;
    UpDown1: TUpDown;
    ME1: TMaskEdit;
    ME2: TMaskEdit;
    ME3: TMaskEdit;
    ME4: TMaskEdit;
    UpDown2: TUpDown;
    UpDown3: TUpDown;
    UpDown4: TUpDown;
    P0: TPanel;
    ME01: TMaskEdit;
    ME02: TMaskEdit;
    ME03: TMaskEdit;
    ME04: TMaskEdit;
    ME05: TMaskEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    UD01: TUpDown;
    UD02: TUpDown;
    UD03: TUpDown;
    UD04: TUpDown;
    UD05: TUpDown;
    procedure FormShow(Sender: TObject);
    procedure UD05Changing(Sender: TObject; var AllowChange: Boolean);
    procedure UD04Changing(Sender: TObject; var AllowChange: Boolean);
    procedure UD03Changing(Sender: TObject; var AllowChange: Boolean);
    procedure UD02Changing(Sender: TObject; var AllowChange: Boolean);
    procedure UD01Changing(Sender: TObject; var AllowChange: Boolean);
    procedure TV1Change(Sender: TObject; Node: TTreeNode);
  private
    { Private declarations }
    CapEnum 	: TSysDevEnum;
    PinList 	: TPinList;
   	CrossBar  : IAMCrossBar;
    ConnType : String;

    procedure AddInputs(ind : Integer ; Node : TTreeNode);
    function defConnType(typ :  TPhysicalConnectorType) : String;
  public
    { Public declarations }
  end;

var
  frmSettings: TfrmSettings;

implementation
uses
	Unit1;
{$R *.dfm}

procedure TfrmSettings.AddInputs(ind : Integer ; Node : TTreeNode);
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
  FL.BaseFilter.Moniker := CapEnum.GetMoniker(ind);
  FG.Active := true;
  PinList := TPinList.Create(FL as IBaseFilter);
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
            if CbOutCount > 0 then
            	begin
              	for i := 0 to CbInCount - 1 do
              	begin
		              CrossBar.get_CrossbarPinInfo(true , i , fRelPin , fType);
                  ConnType := DefConnType(fType);
                  TV1.Items.AddChild(Node , ConnType);
                end;
              end
            else
            	TV1.Items.AddChild(Node , 'Input 0');

            end;
        	CrossBar := nil;

        end;

  FG.Active := False;

end;

function TfrmSettings.defConnType(typ: TPhysicalConnectorType) : String;
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

procedure TfrmSettings.FormShow(Sender: TObject);
begin
ME01.Text := IntToStr(Form1.SetCommon.DELAY_MOTION_DETECT);
UD01.Position  := Form1.SetCommon.DELAY_MOTION_DETECT;

ME02.Text := IntToStr(Form1.SetCommon.DELAY_BETWEEN_SNAPSHOT);
UD02.Position  := Form1.SetCommon.DELAY_BETWEEN_SNAPSHOT;

ME03.Text := IntToStr(Form1.SetCommon.DELAY_BEFORE_PLAY);
UD03.Position  := Form1.SetCommon.DELAY_BEFORE_PLAY;

ME04.Text := IntToStr(Form1.SetCommon.DELAY_AFTER_CHANGE_CAMERA);
UD04.Position  := Form1.SetCommon.DELAY_AFTER_CHANGE_CAMERA;

ME04.Text := IntToStr(Form1.SetCommon.DELAY_AFTER_SETTINGS_CAMERA);
UD04.Position  := Form1.SetCommon.DELAY_AFTER_SETTINGS_CAMERA;

end;

procedure TfrmSettings.TV1Change(Sender: TObject; Node: TTreeNode);
var
i , j : Integer;
ttn : TTreeNode ;
begin
  if ((Node.Level = 0) and (Node.Index = 0)) then
  	begin
     P0.Visible := true;
    end;
  if ((Node.Level = 0) and (Node.Index = 1)) then
  	begin
      if Node.HasChildren then
      	begin
         Node.DeleteChildren;
        end;

			CapEnum := TSysDevEnum.Create;
			CapEnum := TSysDevEnum.Create(CLSID_VideoInputDeviceCategory);

		  if CapEnum.CountFilters = 0 then
  			begin
		      ShowMessage('This Computer no have Video Input Device');
          CapEnum.Free;
    		  Close;
		    end;
      for i := 0 to CapEnum.CountFilters - 1 do
      	begin
         ttn := TV1.Items.AddChild(Node , CapEnum.Filters[i].FriendlyName);
         AddInputs(i , ttn);
        end;
    end;
  if ((Node.Level = 1) and (Node.Parent.Index = 1)) then
  	begin
     P1.Visible := true
    end
  else
  	begin
     P1.Visible := false;
    end;    
end;

procedure TfrmSettings.UD01Changing(Sender: TObject; var AllowChange: Boolean);
begin
	ME01.Text := IntToStr(UD01.Position);
end;

procedure TfrmSettings.UD02Changing(Sender: TObject; var AllowChange: Boolean);
begin
	ME02.Text := IntToStr(UD02.Position);
end;

procedure TfrmSettings.UD03Changing(Sender: TObject; var AllowChange: Boolean);
begin
	ME03.Text := IntToStr(UD03.Position);
end;

procedure TfrmSettings.UD04Changing(Sender: TObject; var AllowChange: Boolean);
begin
	ME04.Text := IntToStr(UD04.Position);
end;

procedure TfrmSettings.UD05Changing(Sender: TObject; var AllowChange: Boolean);
begin
	ME05.Text := IntToStr(UD05.Position);
end;

end.
