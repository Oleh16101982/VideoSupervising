unit uUtils;

interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs
  , DSPack, DSUtil, DirectShow9,
  clLogAcceptor1, BaseFilterEditor,  ComCtrls,  activex,  ExtCtrls , jpeg,
  clReadThread1, MoDetect;

procedure fReadCommonParam;
procedure fDefInitParam;
procedure fDefCapture;
procedure fDefMotionDetector;
procedure fStartCapture;
procedure fSettingsCamera(DevIndex , InIndex : Integer);
procedure fSetProcAmp(DevIndex , InIndex : Integer);
procedure fSetShotSize(DevIndex , InIndex : Integer);
procedure fCreateEventShot;
procedure fDefEventCamera(evType : Integer ; evText : String);
procedure AddToQueue(DevIndex , InpIndex : Integer; sMesg : String);
procedure DoSnapShot(DevIndex , Inpindex : Integer ; Msg : String);
procedure DoInsertText(DevIndex : Integer ; Msg : String);
procedure DoSaveToFile(DevIndex , InpIndex : Integer);
procedure fCheckDiskSpace;
procedure DeleteOldDir;

function fRouteInput(DevIndex , OutIndex , InIndex : Integer) : boolean;
function fDefFileName(dev , num : Integer) : String;

implementation
	uses Unit1;

function fDefFileName(Dev , Num: Integer): String;
var
	yy , mm , dd , hh , min , ss , msec : WORD;
	syy , smm , sdd , shh , smin , sss , smsec : String;
  sDev , sNum : String;
  sDirName : String;
  sFullDirPath : String;
begin
  DecodeDate(NOW , yy , mm , dd);
  DecodeTime(NOW , hh , min , ss , msec);
  syy := IntToStr(yy);

  smm := IntToStr(mm);
  if mm < 10 then
  	smm := '0' + smm;

  sdd := IntToStr(dd);
  if dd < 10 then
  	sdd := '0' + sdd;

  shh := IntToStr(hh);
  if hh < 10 then
  	shh := '0' + shh;

  smin := IntToStr(min);
  if min < 10 then
  	smin := '0' + smin;

  sss := IntToStr(ss);
  if ss < 10 then
  	sss := '0' + sss;

  smsec := IntToStr(msec);
  if msec < 100 then
  	smsec := '0' + smsec;
  if msec < 10 then
  	smsec := '0' + smsec;

	sNum := IntToStr(Form1.aDev[dev].devInputs[num].inpIndex);
    if num < 10 then
    	sNum := '0' + sNum;
  sDev := IntToStr(Dev);
    if Dev < 10 then
      sDev := '0' + sDev;

	sDirName :=  syy + smm + sdd;
  sFullDirPath := Form1.fCommoParams.SaveImgPath + '\' + sDirName;
  if not DirectoryExists(sFullDirPath) then
  	if not ForceDirectories(sFullDirPath) then
    	begin
       ShowMessage('Unable to create directory - ' + sFullDirPath);
       Result := '-1';
       exit;
      end;

	Result := sFullDirPath + '\' + shh + smin + sss + '_' + smsec + '_' + sDev + '_' + sNum + '.jpg';
end;

procedure fReadCommonParam;
begin

end;


procedure fDefCapture;
var
i , j : Integer;
hs : HResult;
begin
with Form1 do
begin
for i:= 0 to Length(aDev) - 1 do
 begin
 	aDev[i].devFG := TFilterGraph.Create(Form1);
  aDev[i].devFG.Tag := i + 1;
  aDev[i].devFG.Active 				:= false;
	aDev[i].devFG.AutoCreate 		:= false;
	aDev[i].devFG.GraphEdit 		:= false;
	aDev[i].devFG.LinearVolume 	:= true;
	aDev[i].devFG.Mode 					:= gmCapture;
  aDev[i].devFG.ClearGraph;
  aDev[i].devFl	:= TFilter.Create(Form1);
	aDev[i].devFl.FilterGraph := aDev[i].devFG;
  aDev[i].devFl.Tag := i + 1;
  aDev[i].devFl.BaseFilter.Moniker := CapEnum.GetMoniker(aDev[i].devIndex);
  aDev[i].devSG := TSampleGrabber.Create(Form1);
  aDev[i].devSG.Tag := i + 1;
  aDev[i].devSG.FilterGraph := aDev[i].devFG;
  aDev[i].devVW := TVideoWindow.Create(Form1);
  aDev[i].devVW.FilterGraph := aDev[i].devFG;
	aDev[i].devVW.Parent := Form1;
	aDev[i].devVW.Tag := i + 1;
	aDev[i].devVW.Visible := false;

	aDev[i].devVW.Align := alNone;
	aDev[i].devVW.AlignWithMargins := false;
	aDev[i].devVW.Anchors := [akLeft,akTop];
	aDev[i].devVW.Canvas.Brush.Color := clWhite;
	aDev[i].devVW.Canvas.Brush.Style := bsSolid;


	aDev[i].devVW.Color := clBlack;
	aDev[i].devVW.Cursor := crDefault;
	aDev[i].devVW.FullScreenTopMost := false;
	aDev[i].devVW.FullScreen := false;
	aDev[i].devVW.Height := 120;
	aDev[i].devVW.Left := 5 + (i * (160 + 10));
fLog.Write('i - ' + IntToStr(i) + '. Left - ' + IntToStr(aDev[i].devVW.Left));
	aDev[i].devVW.Mode := vmNormal;
	aDev[i].devVW.VMROptions.KeepAspectRatio := true;
	aDev[i].devVW.VMROptions.Mode := vmrWindowed;
	aDev[i].devVW.VMROptions.Preferences := [vpForceMixer];
	aDev[i].devVW.Top := 40 ;
	aDev[i].devVW.Width := 160;
	aDev[i].devVW.Visible := true;
  	for j := 0 to Length(aDev[i].devInputs) - 1 do
     	begin
       if aDev[i].devInputs[j].inpIsMain then
        aDev[i].devCurInputs := j;
      end;
  aDev[i].devIsMotionDetect := aDev[i].DEV_MOTION;
  with Form1.aDev[i].Queue do
  begin
      InpIndex	:= TStringList.Create;
      InpIndex.Clear;
      sMessage	:= TStringList.Create;
      sMessage.Clear;
  end;
  aDev[i].CapImg := TImage.Create(Form1);
  aDev[i].CapImg.Parent := Form1;
  aDev[i].CapImg.AutoSize := false;
  aDev[i].CapImg.Center := true;
  aDev[i].CapImg.Left := 5 + (i * (120+10));
  aDev[i].CapImg.Top := 200;
  aDev[i].CapImg.Width := 120;
  aDev[i].CapImg.Height := 80;
  aDev[i].CapImg.Stretch := true;
  aDev[i].CapImg.Visible := true;
  aDev[i].CapBmp	:= TBitmap.Create;
  aDev[i].CapJPG	:= TJpegImage.Create;
  aDev[i].CapJPG.CompressionQuality := 80;

  aDev[i].devFG.Active := true;
  hs := (Form1.aDev[i].devFG as ICaptureGraphBuilder2).FindInterface(@LOOK_UPSTREAM_ONLY,nil,(Form1.aDev[i].devFl as IBaseFilter),IID_IAMCrossBar,Form1.aDev[i].devCrossBar);
  if (SUCCEEDED(hs)) then
  	Form1.aDev[i].devIsCrossBar := true
  else
  	Form1.aDev[i].devIsCrossBar := false;
  hs := (Form1.aDev[i].devFG as ICaptureGraphBuilder2).FindInterface(@PIN_CATEGORY_CAPTURE, @MEDIATYPE_Video, Form1.aDev[i].devFl as IBaseFilter, IID_IAMVideoProcAmp, Form1.aDev[i].devVideoProcAmp);
  if (SUCCEEDED(hs)) then
  	Form1.aDev[i].devIsVideoProcAmp := true
  else
  	Form1.aDev[i].devIsVideoProcAmp := false;

	Form1.aDev[i].MediaEnum := TEnumMediaType.Create;
  Form1.aDev[i].PinList := TPinList.Create(aDev[i].devFl as IBaseFilter);
  Form1.aDev[i].MediaEnum.Assign(Form1.aDev[i].PinList.First);
  aDev[i].devFG.Active := false;
  aDev[i].devIsEvent := false;
end;
end;

end;

procedure fDefInitParam;
var
hs : HResult;
sKeysDev , sKeysInp : TStringList;
i , j : INteger;
iDev , jInp : Integer;
isOn : boolean;
begin
  Form1.fLog.Write(' In Def Init Param');
	Form1.fReg.CloseKey;
	if not Form1.fReg.OpenKeyReadOnly(REG_KEY + '\Common') then
  	begin
     ShowMessage('Not Defined Common Params');
     exit;
    end;
	Form1.fCommoParams.PathJrn := Form1.fReg.ReadString('PathJournal');
	Form1.fCommoParams.FileMask := Form1.fReg.ReadString('MaskJournal');
	Form1.fCommoParams.SaveImgPath := Form1.fReg.ReadString('PathSnapShot');
	Form1.fReg.CloseKey;
  SetLength(Form1.aDev , 0);
	if Form1.fReg.OpenKeyReadOnly(REG_KEY + '\Device') then
    begin

    end
  else
    begin
     ShowMessage('Not Defined Params');
     exit;
    end;
  sKeysDev := TStringList.Create;
  sKeysInp := TStringList.Create;
	if Form1.fReg.HasSubKeys then
  	begin
     Form1.fReg.GetKeyNames(sKeysDev);
     for i := 0 to sKeysDev.Count - 1 do
     	begin
        Form1.fReg.CloseKey;
        Form1.fReg.OpenKeyReadOnly(REG_KEY + '\Device\' + sKeysDev[i]);
        isOn := Form1.fReg.ReadBool('DevOn');
        if not isOn then
//        	SetLength(Form1.aDev , Length(Form1.aDev) - 1)
        else
        	begin
			     	SetLength(Form1.aDev , Length(Form1.aDev) + 1);
    		    Form1.aDev[Length(Form1.aDev) - 1].devName := sKeysDev[i];
		        with Form1 do
    		    	begin
                iDev := Length(Form1.aDev) - 1;
Form1.fLog.Write(intToStr(i) + '. ' + 'ind - ' + IntToStr(iDev));                
        		    aDev[iDev].devIndex 											 := fReg.ReadInteger('DevIndex');
		            aDev[iDev].DELAY_BEFORE_PLAY							 := fReg.ReadInteger('DelayPlay');
                aDev[iDev].DEV_MOTION                      := fReg.ReadBool('DevMotion');
                aDev[iDev].DELAY_MOTION_DETECT             := fReg.ReadInteger('DelayMotionDetect');
                aDev[iDev].DELAY_AFTER_CHANGE_CAMERA       := fReg.ReadInteger('DelayChangeCamera');
                aDev[iDev].DELAY_AFTER_SETTINGS_CAMERA     := fReg.ReadInteger('DelaySettingCamera');
                aDev[iDev].DELAY_BETWEEN_SNAPSHOT          := fReg.ReadInteger('DelaySnapShot');
                aDev[iDev].DEV_PREVIEW                     := fReg.ReadBool('DevPreview');
                aDev[iDev].DEV_PREVIEW_IMAGE               := fReg.ReadBool('DevPreviewImage');
                aDev[iDev].DEV_WINDOW_LEFT                 := fReg.ReadInteger('WindowLeft');
                aDev[iDev].DEV_WINDOW_TOP                  := fReg.ReadInteger('WindowTop');
                aDev[iDev].DEV_WINDOW_WIDTH                := fReg.ReadInteger('WindowWidth');
                aDev[iDev].DEV_WINDOW_HEIGTH               := fReg.ReadInteger('WindowHeigth');
                if Form1.fReg.HasSubKeys then
                	begin
                   Form1.fReg.GetKeyNames(sKeysInp);
                   SetLength(Form1.aDev[iDev].devInputs, 0);
                   for j := 0 to sKeysInp.Count - 1 do
                      begin
//                      	SetLength(Form1.aDev[iDev].devInputs , Length(Form1.aDev[iDev].devInputs) + 1);
//	     		     	        Form1.aDev[iDev].devInputs[Length(Form1.aDev[iDev].devInputs) - 1].inpName := sKeysInp[j];
	     		     	        Form1.fReg.CloseKey;
	     		     	        Form1.fReg.OpenKeyReadOnly(REG_KEY + '\Device\' + sKeysDev[iDev] + '\' + sKeysInp[j]);
	     		     	        isOn := Form1.fReg.ReadBool('InpOn');
                        if not isOn then
                        	begin
//		                      	SetLength(Form1.aDev[iDev].devInputs, Length(Form1.aDev[iDev].devInputs) - 1);
                          end
                        else
                        	begin
														SetLength(Form1.aDev[iDev].devInputs , Length(Form1.aDev[iDev].devInputs) + 1);
														Form1.aDev[iDev].devInputs[Length(Form1.aDev[iDev].devInputs) - 1].inpName := sKeysInp[j];
                          	jInp := Length(Form1.aDev[iDev].devInputs) - 1;
                            with Form1 do
                            	begin
Form1.fLog.Write(intToStr(i) + '. ' +  sKeysInp[j] + '. ind - ' + IntToStr(jInp));
                                aDev[iDev].devInputs[jInp].inpIndex 											:= fReg.ReadInteger('InpIndex');
                                aDev[iDev].devInputs[jInp].inpMediaTypeIndex             	:= fReg.ReadInteger('MediaType');
Form1.fLog.Write(intToStr(i) + '. ' +  sKeysInp[j] + '. Media Index - ' + IntToStr(aDev[iDev].devInputs[jInp].inpMediaTypeIndex));
                                aDev[iDev].devInputs[jInp].inpIsMain 											:= fReg.ReadBool('InpMain');
                                aDev[iDev].devInputs[jInp].inpType                        := '';
                                aDev[iDev].devInputs[jInp].inpIsEvent                     := true;
                                aDev[iDev].devInputs[jInp].inpIsRegular                   := true;
                                aDev[iDev].devInputs[jInp].inpRegularPeriod               := fReg.ReadInteger('RegularPeriod');
                                aDev[iDev].devInputs[jInp].inpBacklightCompensation 			:= fReg.ReadInteger('BackLigthCompensatuion');
                                aDev[iDev].devInputs[jInp].inpBrightness                  := fReg.ReadInteger('Brightness');
                                aDev[iDev].devInputs[jInp].inpColorEnable                 := fReg.ReadBool('ColorEnable');
                                aDev[iDev].devInputs[jInp].inpContrast                    := fReg.ReadInteger('Contrast');
                                aDev[iDev].devInputs[jInp].inpDigitalMultiplier           := fReg.ReadInteger('DigitalMultiplier');
                                aDev[iDev].devInputs[jInp].inpGain                        := fReg.ReadInteger('Gain');
                                aDev[iDev].devInputs[jInp].inpGamma                       := fReg.ReadInteger('Gamma');
                                aDev[iDev].devInputs[jInp].inpHue                         := fReg.ReadInteger('Hue');
                                aDev[iDev].devInputs[jInp].inpPowerlineFrequency          := fReg.ReadInteger('PowerLineFrequency');
                                aDev[iDev].devInputs[jInp].inpSaturation                  := fReg.ReadInteger('Saturation');
                                aDev[iDev].devInputs[jInp].inpSharpness                   := fReg.ReadInteger('Sharpness');
                                aDev[iDev].devInputs[jInp].inpWhiteBalance                := fReg.ReadInteger('WhiteBalance');
                                aDev[iDev].devInputs[jInp].inpWhiteBalanceComponent       := fReg.ReadInteger('WhiteBalanceComponent');

                                aDev[iDev].devInputs[jInp].inpMotionGrid									:= fReg.ReadString	('MotionGrid'			);
                                aDev[iDev].devInputs[jInp].inpMotionPercent								:= fReg.ReadInteger	('MotionPercent'	);
                                aDev[iDev].devInputs[jInp].inpMotionSensitive							:= fReg.ReadInteger	('MotionSensitive');
                              end;
                          end;
                      end;
                  end;
    		      end;
          end;
      end;
    end;
  if Assigned(sKeysDev) then
  	sKeysDev.Free;
  if Assigned(sKeysInp) then
  	sKeysInp.Free;

  fDefCapture;

	with Form1.aDev[0] do
  	begin
         SetLength(DevInputs[0].inpEvent , 15);
         	DevInputs[0].inpEvent[0] := 1;
         	DevInputs[0].inpEvent[1] := 3;
         	DevInputs[0].inpEvent[2] := 5;
         	DevInputs[0].inpEvent[3] := 7;
          DevInputs[0].inpEvent[4] := 9;
          DevInputs[0].inpEvent[5] := 11;
          DevInputs[0].inpEvent[6] := 13;
          DevInputs[0].inpEvent[7] := 15;
          DevInputs[0].inpEvent[8] := 17;
          DevInputs[0].inpEvent[9] := 19;
          DevInputs[0].inpEvent[10] := 21;
          DevInputs[0].inpEvent[11] := 23;
          DevInputs[0].inpEvent[12] := 25;
          DevInputs[0].inpEvent[13] := 27;
          DevInputs[0].inpEvent[14] := 29;

         SetLength(DevInputs[1].inpEvent , 15);
         	DevInputs[1].inpEvent[0] := 2;
         	DevInputs[1].inpEvent[1] := 4;
         	DevInputs[1].inpEvent[2] := 6;
         	DevInputs[1].inpEvent[3] := 8;
          DevInputs[1].inpEvent[4] := 10;
          DevInputs[1].inpEvent[5] := 12;
          DevInputs[1].inpEvent[6] := 14;
          DevInputs[1].inpEvent[7] := 16;
          DevInputs[1].inpEvent[8] := 18;
          DevInputs[1].inpEvent[9] := 20;
          DevInputs[1].inpEvent[10] := 22;
          DevInputs[1].inpEvent[11] := 24;
          DevInputs[1].inpEvent[12] := 26;
          DevInputs[1].inpEvent[13] := 28;
          DevInputs[1].inpEvent[14] := 30;
        end;

end;

procedure fDefMotionDetector;
var
	i , j : Integer;
begin
with Form1 do
	begin
	  for i := 0 to Length(aDev) - 1 do
   		begin
        	  if aDev[i].devIsMotionDetect then
              begin
               	aDev[i].MoDet := TMotionDetector.Create(Form1);
								  aDev[i].MoDet.OnGridOversizesFrame		:= Form1.fOnGridOversizesFrame;
								  aDev[i].MoDet.OnMotionDetected				:= Form1.fOnMotionDetected;
								  aDev[i].MoDet.OnMotionNotDetected			:= Form1.fOnMotionNotDetected;
								  aDev[i].MoDet.OnNewFrameSize					:= Form1.fOnNewFrameSize;
								  aDev[i].MoDet.OnSettingsChanged				:= Form1.fOnSettingsChanged;
               	aDev[i].MoDet.Tag := i + 1;
               	aDev[i].MoDetRatio := aDev[i].devInputs[aDev[i].devCurInputs].inpMotionPercent;
				         for j := 0 to Length(aDev[i].devInputs) - 1 do
        				 	begin
				          	if aDev[i].devInputs[i].inpIsMain then
                    	begin
                				if aDev[i].DevInputs[j].inpColorEnable then
				                	begin
														aDev[i].MoDet.CompareBlue := true;
													  aDev[i].MoDet.CompareGreen := true;
													  aDev[i].MoDet.CompareRed := true;
													  aDev[i].MoDet.CompareMonochrome := false;
                				  end
				                else
      			          		begin
														aDev[i].MoDet.CompareBlue := false;
													  aDev[i].MoDet.CompareGreen := false;
													  aDev[i].MoDet.CompareRed := false;
													  aDev[i].MoDet.CompareMonochrome := true;
      	      			      end; // aDev[i].devInputs[i].inpIsMain
	           	   	end;  // for j := 0 to Length(aDev[i].devInputs) - 1
							   aDev[i].MoDet.Grid := aDev[i].devInputs[aDev[i].devCurInputs].inpMotionGrid;
                 aDev[i].MoDet.ReduceVideoNoise := true;
                 aDev[i].MoDet.RejectDifferentFrameSize := true;
                 aDev[i].MoDet.ReleaseFrame := false;
                 aDev[i].MoDet.SetGlobalSensitivity(aDev[i].devInputs[aDev[i].devCurInputs].inpMotionSensitive);
              end; // aDev[i].devIsMotionDetect
      end; // for i := 0 to Length(aDev) - 1
  	  end;
    TTest.Enabled := true;
  end; // with fORM1

end;

procedure fStartCapture;
var
	i , j : Integer;
  hs : HResult;
begin
with Form1 do
begin
	for i := 0 to Length(aDev) - 1 do
   	begin
      aDev[i].devFG.Active := true;
 fLog.Write('fStartCapture. For for DEVICE. i - ' + IntToStr(i) + '. devinputs - ' + IntToStr(Length(aDev[i].devInputs)));
      if Length(aDev[i].devInputs) > 1 then
      	begin
         for j := 0 to Length(aDev[i].devInputs) - 1 do
         	begin
 fLog.Write('fStartCapture. For for Input. i - ' + IntToStr(i) + '. j - ' + IntTostr(j) );
          	if aDev[i].devInputs[j].inpIsMain then
            	begin
 fLog.Write('fStartCapture. inp IsMain. i - ' + IntToStr(i) + '. j - ' + IntTostr(j) );
							  if Form1.aDev[i].devIsCrossBar then
                  begin
 fLog.Write('fStartCapture. iBefore fRouteInput. ' + IntToStr(aDev[i].devInputs[j].inpIndex));
//	              		fRouteInput(i , 0 , aDev[i].devInputs[j].inpIndex);
	              		fRouteInput(i , 0 , j);
                  end;
               break;
              end;
          end;
        end;
				hs := (Form1.aDev[i].devFG as ICaptureGraphBuilder2).RenderStream(@PIN_CATEGORY_PreVIEW, nil, (Form1.aDev[i].devFl as IBaseFilter),(Form1.aDev[i].devSG as IBaseFilter), (Form1.aDev[i].devVW as IBaseFilter));
// fLog.Write('Render - ' + IntToStr(hs));
 fSettingsCamera( i , aDev[i].devCurInputs);
      	Form1.aDev[i].devFG.Play;
        sleep(aDev[i].DELAY_BEFORE_PLAY);
    end;
for i := 0 to Length(aDev) - 1 do
	begin
   if Assigned(aDev[i].MoDet) then
   	aDev[i].MoDet.Reset;
  end;

	Form1.T1.Enabled := true;
end;
end;

procedure fSettingsCamera(DevIndex , InIndex : Integer);
begin
// Form1.fLog.Write('In SettingsCamera. Dev - ' + IntToStr(DevIndex) + '. inp - ' + IntToStr(InIndex));
	fSetProcAmp(DevIndex , InIndex);
// Form1.fLog.Write('In SettingsCamera. AfterProcAmp');
  fSetShotSize(DevIndex , InIndex);
// Form1.fLog.Write('In SettingsCamera. ShotSize');
end;

procedure fSetProcAmp(DevIndex , InIndex : Integer);
var
hr : HResult;
pFlags : tagVideoProcAmpFlags;
begin
// Form1.fLog.Write('In ProcAmp. Dev Ind - ' + IntToStr(DevIndex) + '. InInd - ' + IntToStr(InIndex) + '. Satur - ' + IntToStr(Form1.aDev[DevIndex].DevInputs[InIndex].inpSaturation));
if Form1.aDev[DevIndex].devIsVideoProcAmp then
	begin
		hr := Form1.aDev[DevIndex].devVideoProcAmp.GetRange(VideoProcAmp_Brightness , Form1.pMin , Form1.pMax , Form1.pStep , Form1.pDefault , Form1.pFlags);
    Form1.pFlags := VideoProcAmp_Flags_Manual;
// Form1.fLog.Write('Flag - Manual');


		hr := Form1.aDev[DevIndex].devVideoProcAmp.Set_(VideoProcAmp_Brightness , Form1.aDev[DevIndex].DevInputs[InIndex].inpBrightness , Form1.pFlags);

		hr := Form1.aDev[DevIndex].devVideoProcAmp.GetRange(VideoProcAmp_Contrast , Form1.pMin , Form1.pMax , Form1.pStep , Form1.pDefault , Form1.pFlags);
    Form1.pFlags := VideoProcAmp_Flags_Manual;
		hr := Form1.aDev[DevIndex].devVideoProcAmp.Set_(VideoProcAmp_Contrast , Form1.aDev[DevIndex].DevInputs[InIndex].inpContrast , Form1.pFlags);

		hr := Form1.aDev[DevIndex].devVideoProcAmp.GetRange(VideoProcAmp_Hue , Form1.pMin , Form1.pMax , Form1.pStep , Form1.pDefault , Form1.pFlags);
    Form1.pFlags := VideoProcAmp_Flags_Manual;
		hr := Form1.aDev[DevIndex].devVideoProcAmp.Set_(VideoProcAmp_Hue , Form1.aDev[DevIndex].DevInputs[InIndex].inpHue , Form1.pFlags);

		hr := Form1.aDev[DevIndex].devVideoProcAmp.GetRange(VideoProcAmp_Saturation , Form1.pMin , Form1.pMax , Form1.pStep , Form1.pDefault , Form1.pFlags);
    Form1.pFlags := VideoProcAmp_Flags_Manual;
		hr := Form1.aDev[DevIndex].devVideoProcAmp.Set_(VideoProcAmp_Saturation , Form1.aDev[DevIndex].DevInputs[InIndex].inpSaturation , Form1.pFlags);

		hr := Form1.aDev[DevIndex].devVideoProcAmp.GetRange(VideoProcAmp_Sharpness , Form1.pMin , Form1.pMax , Form1.pStep , Form1.pDefault , Form1.pFlags);
    Form1.pFlags := VideoProcAmp_Flags_Manual;
		hr := Form1.aDev[DevIndex].devVideoProcAmp.Set_(VideoProcAmp_Sharpness , Form1.aDev[DevIndex].DevInputs[InIndex].inpSharpness , Form1.pFlags);

		hr := Form1.aDev[DevIndex].devVideoProcAmp.GetRange(VideoProcAmp_Gamma , Form1.pMin , Form1.pMax , Form1.pStep , Form1.pDefault , Form1.pFlags);
    Form1.pFlags := VideoProcAmp_Flags_Manual;
		hr := Form1.aDev[DevIndex].devVideoProcAmp.Set_(VideoProcAmp_Gamma , Form1.aDev[DevIndex].DevInputs[InIndex].inpGamma , Form1.pFlags);

		hr := Form1.aDev[DevIndex].devVideoProcAmp.GetRange(VideoProcAmp_ColorEnable , Form1.pMin , Form1.pMax , Form1.pStep , Form1.pDefault , Form1.pFlags);
    Form1.pFlags := VideoProcAmp_Flags_Manual;
    if Form1.aDev[DevIndex].DevInputs[InIndex].inpColorEnable then
    	hr := Form1.aDev[DevIndex].devVideoProcAmp.Set_(VideoProcAmp_ColorEnable , 1 , Form1.pFlags)
    else
    	hr := Form1.aDev[DevIndex].devVideoProcAmp.Set_(VideoProcAmp_ColorEnable , 0 , Form1.pFlags);
		hr := Form1.aDev[DevIndex].devVideoProcAmp.GetRange(VideoProcAmp_WhiteBalance , Form1.pMin , Form1.pMax , Form1.pStep , Form1.pDefault , Form1.pFlags);
    Form1.pFlags := VideoProcAmp_Flags_Manual;
		hr := Form1.aDev[DevIndex].devVideoProcAmp.Set_(VideoProcAmp_WhiteBalance , Form1.aDev[DevIndex].DevInputs[InIndex].inpWhiteBalance , Form1.pFlags);

		hr := Form1.aDev[DevIndex].devVideoProcAmp.GetRange(VideoProcAmp_BacklightCompensation , Form1.pMin , Form1.pMax , Form1.pStep , Form1.pDefault , Form1.pFlags);
//    Form1.pFlags := VideoProcAmp_Flags_Manual;
    Form1.pFlags := VideoProcAmp_Flags_Auto;
		hr := Form1.aDev[DevIndex].devVideoProcAmp.Set_(VideoProcAmp_BacklightCompensation , Form1.aDev[DevIndex].DevInputs[InIndex].inpBacklightCompensation , Form1.pFlags);

		hr := Form1.aDev[DevIndex].devVideoProcAmp.GetRange(VideoProcAmp_Gain , Form1.pMin , Form1.pMax , Form1.pStep , Form1.pDefault , Form1.pFlags);
    Form1.pFlags := VideoProcAmp_Flags_Manual;
		hr := Form1.aDev[DevIndex].devVideoProcAmp.Set_(VideoProcAmp_Gain , Form1.aDev[DevIndex].DevInputs[InIndex].inpGain , Form1.pFlags);

  end;
end;

procedure fSetShotSize(DevIndex , InIndex : Integer);
var
hr : HResult;
begin
		if not Assigned(Form1.aDev[DevIndex].PinList) then
    	begin
// Form1.fLog.Write('Create PinList for dev - ' + IntToStr(DevIndex));
	    	Form1.aDev[DevIndex].PinList := TPinList.Create(Form1.aDev[DevIndex].devFl as IBaseFilter);
				Form1.aDev[DevIndex].MediaEnum.Assign(Form1.aDev[DevIndex].PinList.First);
      end;
// Form1.fLog.Write('Set Size. PinCount for dev - ' + IntToStr(DevIndex) + '. - ' + IntToStr(Form1.aDev[DevIndex].PinList.Count));
// Form1.fLog.Write('Set Size. dev - ' + IntToStr(DevIndex) + '. inp - ' + IntToStr(InIndex) + 'Ind Media - ' + IntToStr(Form1.aDev[DevIndex].DevInputs[InIndex].inpMediaTypeIndex));
  	with Form1.aDev[DevIndex] do
    	begin
// Form1.fLog.Write('Set MediaEnum. dev - ' + IntToStr(DevIndex) + '. in - ' + IntToStr(InIndex) + '. ind media - ' +  IntToStr(DevInputs[InIndex].inpMediaTypeIndex));

		hr := (PinList.First as IAMStreamConfig).SetFormat(MediaEnum.Items[DevInputs[InIndex].inpMediaTypeIndex].AMMediaType^);
      end;
// Form1.fLog.Write('Set Size. hr - ' + IntToStr(hr));
end;

function fRouteInput(DevIndex , OutIndex , InIndex : Integer) : boolean;
var
hs : HResult;
begin
 Form1.fLog.Write('fRouteInput. ' + IntToStr(Form1.aDev[DevIndex].devCurInputs) + '. Dev - ' + IntToStr(DevIndex) + '. In - ' + IntToStr(InIndex));
	hs := Form1.aDev[DevIndex].devCrossBar.Route(OutIndex , Form1.aDev[DevIndex].devInputs[InIndex].inpIndex);
//	hs := Form1.aDev[DevIndex].devCrossBar.Route(0 , 2);
// Form1.fLog.Write('1 fRouteInput. ' + IntToStr(hs) + '. Dev - ' + IntToStr(DevIndex) + '. Out - ' + IntToStr(OutIndex) + '. In - ' + IntToStr(Form1.aDev[DevIndex].devInputs[InIndex].inpIndex));
//  	if (SUCCEEDED(hs)) then
//    	begin
      	Form1.aDev[DevIndex].devCurInputs := InIndex;
        fSettingsCamera(DevIndex , InIndex );
        sleep(Form1.aDev[DevIndex].DELAY_AFTER_CHANGE_CAMERA);
      	Result := true;
//      end
//    else
//    	begin

//	    	Result := false;
//      end;
end;

procedure fCreateEventShot;
begin
with Form1 do
begin
  ReadJrn := TReadThread.Create(true , true);
  ReadJrn.FilePath := Form1.fCommoParams.PathJrn;
  ReadJrn.FlMask := Form1.fCommoParams.FileMask;
  ReadJrn.OnReadInfo := fOnReadInfo;
  ReadJrn.OnSnapShot := fOnSnapShot;
end;
end;

procedure fDefEventCamera(evType : Integer ; evText : String);
var
i , j , k : Integer;
begin
with Form1 do
begin
	for i := 0 to Length(aDev) - 1 do
    begin
      for j := 0 to Length(aDev[i].devInputs) - 1 do
       begin
        for k := 0 to Length(aDev[i].devInputs[j].inpEvent) - 1 do
        	begin
	          if aDev[i].devInputs[j].inpEvent[k] = evType then
            	begin
                aDev[i].devIsEvent := true;
// fLog.Write('Event Shot. Dev - ' + IntToStr(i) + '. Camera - ' + IntToStr(j));
              	AddToQueue( i , j , evText);
                aDev[i].devIsEvent := false;
              end;
          end;
       end;
    end;
end;
end;

procedure DoSnapShot(DevIndex , Inpindex : Integer ; Msg : String);
var
hs : HResult;
i : Integer;
begin
// Form1.TTest.Enabled := false;
// Form1.fLog.Write('DoSnapShot. Dev - ' + IntToStr(DevIndex) + '. Camera - ' + IntToStr(InpIndex) + '. Txt - ' + Msg);
with Form1 do
begin
	if aDev[DevIndex].devCurInputs <> InpIndex then
  	begin
      fRouteInput(DevIndex , 0 , InpIndex);
      sleep(aDev[DevIndex].DELAY_AFTER_SETTINGS_CAMERA);      
    end;
  aDev[DevIndex].devSG.GetBitmap(aDev[DevIndex].CapBmp);
  DoInsertText(DevIndex, Msg);
  DoSaveToFile(DevIndex , InpIndex);
  aDev[DevIndex].CapImg.Picture.Bitmap := aDev[DevIndex].CapBmp;
  if not aDev[DevIndex].devInputs[InpIndex].inpIsMain then
  	begin
         for i := 0 to Length(aDev[DevIndex].devInputs) - 1 do
         	begin
          	if aDev[DevIndex].devInputs[i].inpIsMain then
            	begin
							  if Form1.aDev[DevIndex].devIsCrossBar then
                  begin
	              		fRouteInput(DevIndex , 0 , i);
                    sleep(aDev[DevIndex].DELAY_AFTER_SETTINGS_CAMERA);
                  end;
               break;
              end;
          end;
    end;
end;
// Form1.TTest.Enabled := true;
end;

procedure DoInsertText(DevIndex : Integer ; Msg : String);
begin
 with Form1 do
 begin
  aDev[DevIndex].CapBmp.Canvas.TextOut(0 , 0 , Msg);
 end;
end;

procedure DoSaveToFile(DevIndex , InpIndex: Integer );
var
	fNam : String;
begin
fCheckDiskSpace;
with Form1 do
begin
	fNam := fDefFileName(DevIndex , InpIndex);
Form1.fLog.Write('In Do Save To File. fNam - ' + fNam);
  if fNam = '-1' then
  	begin
      exit;
    end;
  aDev[DevIndex].CapJPG.Assign(aDev[DevIndex].CapBMP);
  aDev[DevIndex].CapJPG.SaveToFile(fNam);
end;

end;

procedure fCheckDiskSpace;
var
tmpPath : String;
iSpace : Int64;
sDrive : Char;
iDrive : Integer;
begin
	tmpPath := UpperCase(Form1.fCommoParams.SaveImgPath);
	sDrive := Form1.fCommoParams.SaveImgPath[1];
  iDrive := Ord(sDrive) - Ord('A') + 1;
	iSpace := DiskFree(iDrive);
Form1.fLog.Write('Drive - ' + sDrive + '. i - ' + IntToStr(iDrive) + '. Space - ' + IntToStr(iSpace));
	if iSpace < 40000000 then
  	while true do
    begin
	  	DeleteOldDir;
			iSpace := DiskFree(iDrive);
			if iSpace > 40000000 then
      	break;
    end;
  
end;

procedure DeleteOldDir;
var
  sr : TSearchRec;
  tmpDir : String;
begin
tmpDir := '';
  if FindFirst(Form1.fCommoParams.SaveImgPath + '\*.*' , faDirectory , sr) = 0 then
    begin
      if Pos('.' , sr.Name) = 0 then
	      tmpDir := sr.Name;
      repeat
	      if ((Pos('.' , sr.Name) = 0) and (tmpDir = '')) then
        	begin
           tmpDir := sr.Name;
          end
        else
        	if Pos('.' , sr.Name) = 0 then
		        if sr.Name < tmpDir then
    		      begin
        		   tmpDir := sr.Name;
		          end;
    	until FindNext(sr) <> 0;
    end;
FindClose(sr);
  if FindFirst(Form1.fCommoParams.SaveImgPath + '\' + tmpDir + '\*.*' , faAnyFile , sr) = 0 then
  	begin
			repeat
      	if sr.Attr and faDirectory = 0 then
		      begin
    		    DeleteFile(Form1.fCommoParams.SaveImgPath + '\' + tmpDir + '\' + sr.name);
		      end;
    	until	FindNext(sr) <> 0;
  end;
  FindClose(sr);
  RemoveDirectory(PChar(Form1.fCommoParams.SaveImgPath + '\' + tmpDir));
end;

procedure AddToQueue(DevIndex , InpIndex : Integer; sMesg : String);
begin
Form1.fLog.Write('In Add to Queue');
with Form1 do
begin
 aDev[DevIndex].Queue.InpIndex.Add(IntToStr(InpIndex));
 aDev[DevIndex].Queue.sMessage.Add(sMesg);
end;
end;

end.
