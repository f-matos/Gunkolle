RunMap(x)
{
	if (x == "4_3E")
	{
		4_3E()
	}
	else if(x == "3_2N")
	{
		3_2N()
	}
	else if(x == "5_4")
	{
		5_4()
	}
	else if(x == "5_4_friendly")
	{
		5_4_friendly()
	}
	else if(x == "0_2")
	{
		0_2()
	}
	else if(x == "5_2E")
	{
		5_2E()
	}
	else if(x == "1_6")
	{
		1_6()
	}
	else if(x == "2_6")
	{
		2_6()
	}
	else if(x == "3_6")
	{
		3_6()
	}
	else if(x == "4_6")
	{
		4_6()
	}
	else if(x == "5_6")
	{
		5_6()
	}
}

WaitBattle()
{
	GuiControl,, NB, In Battle
	FindClick(A_ScriptDir "\pics\CombatPause", "rNoxPlayer mc o30 Count1 n0 w30000,50")
	sleep 7500
	Loop
	{		
		Found := FindClick(A_ScriptDir "\pics\LoadScreen", "rNoxPlayer mc o50 n0 Count1 w100,50")
		if Found >= 1
		{
			GuiControl,, NB, Finished battle
			break
		}
		else
		{
			;Safex, Safey dont click in a valid position
			ClickS(700,400)
		}
	}
}

WaitTurn(turn)
{
	Global
	GuiControl,, NB, Waiting Turn %turn%
	loop
	{
		Found := FindClick(A_ScriptDir "\pics\Turn" turn, "rNoxPlayer mc o30 Count1 n0 w1000")
		if Found >= 1
		{
			break
		}
		else
		{
			TerminateFound := FindClick(A_ScriptDir "\pics\Terminate", "rNoxPlayer mc o30 Count1 n0 w1000")
			if TerminateFound >= 1
			{
				GuiControl,, NB, SF moving
			}
			else
			{
				WaitBattle()
			}	
		}		
	}
	GuiControl,, NB, G&K turn started
	TFindClick("Planning", "PlanningReady")
}

WaitExecution()
{
	Global
	loop
	{		
		Found := FindClick(A_ScriptDir "\pics\Planning", "rNoxPlayer mc o30 Count1 n0 w5000")
		if Found >= 1
		{
			break
		}
		else
		{
			EndTurnFound := FindClick(A_ScriptDir "\pics\EndTurn", "rNoxPlayer mc o30 Count1 n0 w1000")
			if EndTurnFound >= 1 
			{
				GuiControl,, NB, Executing Plan			
			}
			else
			{
				WaitBattle()
			}
		}		
	}
}

nodes(nodecount)
{
	Global
	loop, %nodecount%
	{
		Found := 0
		FindClick(A_ScriptDir "\pics\CombatPause", "rNoxPlayer mc o25 Count1 n0 w30000,50")
		sleep 5000
		while(Found == 0)
		{
			Found := 0
			Found := FindClick(A_ScriptDir "\pics\LoadScreen", "rNoxPlayer mc o50 n0 Count1 w100,50")
			if Found >= 1
			{

			}
			else
			{
				ClickS(Safex,Safey)
			}
			GuiControl,, NB, %found%
		}
		FindClick(A_ScriptDir "\pics\EndTurn", "rNoxPlayer mc o50 Count1 n0 w30000,50")
	}
}

GoHome()
{
	Global
	RetirementLoop := 1
	loop, %RetirementLoop%
	{
		Found1 := 0
		Found2 := 0
		Found3 := 0
		sleep 5000
		while(Found1 == 0 && Found2 == 0)
		{
			Found1 := FindClick(A_ScriptDir "\pics\WaitForHome", "rNoxPlayer mc o30 w250,50 Count1 n0 a1200,,,-600")
			Found2 := FindClick(A_ScriptDir "\pics\DailyMessage", "rNoxPlayer mc o40 Count1 n0")
			if (Found1 >= 1 or Found2 >= 1)
			{

			}
			else
			{
				Found3 := FindClick(A_ScriptDir "\pics\CombatReturn", "rNoxPlayer mc o40 Count1 w100,50")
				FoundExp := FindClick(A_ScriptDir "\pics\ExpeditionConfirm", "rNoxPlayer mc o30 Count1")
				if FoundExp >= 1
				{
					RetirementLoop++
				}
				ClickS(Homex+52,Homey)
			}
			GuiControl,, NB, %found1% %found2% %found3% 
		}
	}
}

FocusChapter(Chapter)
{
	Global
	Found := FindClick(A_ScriptDir "\pics\CombatSims\Data\CombatMissionClicked", "rNoxPlayer mc o30 w5000,50 n0")
	if (Found != 1) {
		FindClick(A_ScriptDir "\pics\CombatSims\Data\CombatMission", "rNoxPlayer mc o30")
	}
	Found := 0
	while (Found == 0) {
		NoStopFindClick("Maps\Chapters\" Chapter "NotClicked","rNoxPlayer mc o30")
		Found := FindClick(A_ScriptDir "\pics\Maps\Chapters\" Chapter "Clicked", "rNoxPlayer mc o30 Count1 w500,50 n0")
	}
}

1_6()
{
	Global
	FocusChapter(1)
	DragDownToUp(764, 665, 300)
	RFindClick("\Maps\1_6\1_6Map", "rNoxPlayer mc o20 w30000,50")
	sleep 500
	RFindClick("Battle", "rNoxPlayer mc o20 w30000,50")
	sleep 1000
	Found := FindClick(A_ScriptDir "\pics\Turn0", "rNoxPlayer mc o30 Count1 w5000,50 n0")
	if Found >= 1
	{		
	}
	Else
	{
		GuiControl,, NB, Paused
		Pause
	}
	ZoomOut(3)
	RFindClick("\Maps\1_6\CommandPost", "rNoxPlayer mc o10 w30000,50")
	RFindClick("Battleok", "rNoxPlayer mc o20 w30000,50")
	RFindClick("StartCombat", "rNoxPlayer mc o30 w3000,10 a1000,620")
	sleep 500
	TFindClick("\Maps\1_6\CommandPostResupply","\Maps\1_6\CommandPostResupply2")
	TFindClick("\Maps\1_6\CommandPostResupply2","ResupplyButton")
	RFindClick("ResupplyButton", " rNoxPlayer mc o10 w30000,50")
	sleep 500
	RFindClick("Planning", "rNoxPlayer mc o5 w30000,50")
	RFindClick("\Maps\1_6\Node1", "rNoxPlayer mc o30 w30000,50")
	RFindClick("\Maps\1_6\Node2", "rNoxPlayer mc o30 w30000,50")
	RFindClick("Execute", "rNoxPlayer mc o5 w30000,50")
	WaitExecution()
	sleep 500
	RFindClick("EndTurn", "rNoxPlayer mc o30 w30000,50 a1100,620")
	WaitTurn(2)
	DragDownToUp(670, 600, 150)
	TFindClick("\Maps\1_6\Node2Captured", "\Maps\1_6\Node2Captured2")
	TFindClick("\Maps\1_6\Node3", "\Maps\1_6\Node3Clicked")
	FindOneAndClick(["\pics\Maps\1_6\Node4SF", "\pics\Maps\1_6\Node4"])
	RFindClick("Execute", "rNoxPlayer mc o5 w30000,50")
	WaitExecution()
	sleep 500
	RFindClick("EndTurn", "rNoxPlayer mc o30 w30000,50 a1100,620")
	WaitTurn(3)
	DragDownToUp(550, 600, 200)
	RFindClick("\Maps\1_6\Node4Captured", "rNoxPlayer mc o30 w30000,50")
	RFindClick("\Maps\1_6\Node5", "rNoxPlayer mc o30 w30000,50")
	RFindClick("\Maps\1_6\Node6", "rNoxPlayer mc o30 w30000,50")
	RFindClick("\Maps\1_6\Node7", "rNoxPlayer mc o30 w30000,50")
	RFindClick("Execute", "rNoxPlayer mc o5 w30000,50")
	WaitExecution()
	sleep 500
	RFindClick("EndTurn", "rNoxPlayer mc o30 w30000,50 a1100,620")
	WaitTurn(4)
	DragDownToUp(550, 600, 200)
	RFindClick("\Maps\1_6\Node7After", "rNoxPlayer mc o30 w30000,50")	
	RFindClick("\Maps\1_6\Node8", "rNoxPlayer mc o30 w30000,50")
	RFindClick("\Maps\1_6\Node9", "rNoxPlayer mc o30 w30000,50")
	RFindClick("Execute", "rNoxPlayer mc o5 w30000,50")
	WaitExecution()
	sleep 500
	RFindClick("EndTurn", "rNoxPlayer mc o30 w30000,50 a1100,620")
	GoHome()
}

2_6()
{
	Global
	FocusChapter(2)
	DragDownToUp(764, 665, 300)
	RFindClick("\Maps\2_6\2_6Map", "rNoxPlayer mc o20 w30000,50")
	sleep 500
	RFindClick("Battle", "rNoxPlayer mc o20 w30000,50")
	sleep 1000
	Found := FindClick(A_ScriptDir "\pics\Turn0", "rNoxPlayer mc o30 Count1 w5000,50 n0")
	if Found >= 1
	{		
	}
	Else
	{
		GuiControl,, NB, Paused
		Pause
	}
	ZoomOut(3)
	ClickM(273, 359) ;CommandPost
	RFindClick("Battleok", "rNoxPlayer mc o30 w3000,10 a1000,620")
	RFindClick("StartCombat", "rNoxPlayer mc o30 w3000,10 a1000,620")
	sleep 2000
	CFindClick(273, 359, "ResupplyButton")
	RFindClick("ResupplyButton", " rNoxPlayer mc o10 w30000,50")
	sleep 500
	DragUpToDown(660, 150, 700)
	RFindClick("Planning", "rNoxPlayer mc o5 w30000,50")
	RFindClick("\Maps\2_6\Node1", "rNoxPlayer mc o30 w30000,50")
	RFindClick("\Maps\2_6\Node2", "rNoxPlayer mc o30 w30000,50")
	RFindClick("Execute", "rNoxPlayer mc o5 w30000,50")
	WaitExecution()
	sleep 500
	RFindClick("EndTurn", "rNoxPlayer mc o30 w30000,50 a1100,620")
	WaitTurn(2)
	RFindClick("\Maps\2_6\Node2Captured", "rNoxPlayer mc o30 w30000,50")
	RFindClick("\Maps\2_6\Node3", "rNoxPlayer mc o30 w30000,50")
	RFindClick("\Maps\2_6\Node4", "rNoxPlayer mc o30 w30000,50")
	RFindClick("Execute", "rNoxPlayer mc o5 w30000,50")
	WaitExecution()
	sleep 500
	RFindClick("EndTurn", "rNoxPlayer mc o30 w30000,50 a1100,620")
	GoHome()
}

3_6()
{
	Global
	FocusChapter(3)
	DragDownToUp(764, 665, 300)
	RFindClick("\Maps\3_6\3_6Map", "rNoxPlayer mc o20 w30000,50")
	sleep 500
	RFindClick("Battle", "rNoxPlayer mc o20 w30000,50")
	sleep 1000
	Found := FindClick(A_ScriptDir "\pics\Turn0", "rNoxPlayer mc o30 Count1 w5000,50 n0")
	if Found >= 1
	{		
	}
	Else
	{
		GuiControl,, NB, Paused
		Pause
	}
	ZoomOut(3)
	ClickM(717, 378) ;Heliport
	RFindClick("Battleok", "rNoxPlayer mc o5 w30000,50")
	ClickM(1059, 258) ;CommandPost 
	RFindClick("Battleok", "rNoxPlayer mc o30 w3000,10 a1000,620")
	RFindClick("StartCombat", "rNoxPlayer mc o30 w3000,10 a1000,620")
	CFindClick(717, 378, "ResupplyButton") ;Heliport
	RFindClick("ResupplyButton", "rNoxPlayer mc o10 w30000,50")
	sleep 500
	RFindClick("Planning", "rNoxPlayer mc o5 w30000,50")
	ClickM(566, 391) ;Node
	DragDownToUp(485, 730, 185)
	ClickM(415, 180) ;EventNode
	ClickM(385, 365) ;EnemyNode
	ClickM(520, 450) ;BossNode
	RFindClick("Execute", "rNoxPlayer mc o5 w30000,50")
	WaitExecution()
	sleep 500
	RFindClick("EndTurn", "rNoxPlayer mc o30 w30000,50 a1100,620")
	GoHome()
}

4_6()
{
	Global
	FocusChapter(4)
	DragDownToUp(764, 665, 300)
	RFindClick("\Maps\4_6\4_6Map", "rNoxPlayer mc o20 w30000,50")
	sleep 500
	RFindClick("Battle", "rNoxPlayer mc o20 w30000,50")
	sleep 1000
	Found := FindClick(A_ScriptDir "\pics\Turn0", "rNoxPlayer mc o30 Count1 w5000,50 n0")
	if Found >= 1
	{		
	}
	Else
	{
		GuiControl,, NB, Paused
		Pause
	}
	ZoomOut(3)
	RFindClick("\Maps\4_6\CommandPost", "rNoxPlayer mc o10 w30000,50")
	RFindClick("\Maps\4_6\Echelon2", "rNoxPlayer mc o10 w30000,50")
	RFindClick("Battleok", "rNoxPlayer mc o30 w3000,10 a1000,620")
	sleep 500
	DragUpToDown(773, 107, 715)
	RFindClick("\Maps\4_6\Heliport", "rNoxPlayer mc o5 w30000,50")
	RFindClick("Battleok", "rNoxPlayer mc o5 w30000,50")
	RFindClick("StartCombat", "rNoxPlayer mc o30 w3000,10 a1000,620")
	sleep 2000
	TFindClick("\Maps\4_6\HeliportResupply","\Maps\4_6\HeliportResupply2")
	TFindClick("\Maps\4_6\HeliportResupply2","ResupplyButton")
	RFindClick("ResupplyButton", " rNoxPlayer mc o10 w30000,50")
	sleep 500
	RFindClick("Planning", "rNoxPlayer mc o5 w30000,50")
	RFindClick("\Maps\4_6\Node1", "rNoxPlayer mc o30 w30000,50")
	RFindClick("\Maps\4_6\Node2", "rNoxPlayer mc o30 w30000,50")
	RFindClick("\Maps\4_6\Node3", "rNoxPlayer mc o30 w30000,50")
	RFindClick("\Maps\4_6\Node4", "rNoxPlayer mc o30 w30000,50")
	RFindClick("Execute", "rNoxPlayer mc o5 w30000,50")
	WaitExecution()
	sleep 500
	RFindClick("EndTurn", "rNoxPlayer mc o30 w30000,50 a1100,620")
	GoHome()
}

5_2E()
{
	Global
	RetirementLoop := 1
	while (RetirementLoop != 0)
	{
		FocusChapter(5)
		RFindClick("Emergency", "rNoxPlayer mc o5 w30000,50")
		sleep 250
		RFindClick("\Maps\5_2E\5_2E", "rNoxPlayer mc o5 w30000,50")
		RFindClick("battle", "rNoxPlayer mc o5 w30000,50")	
		Found := FindClick(A_ScriptDir "\pics\CombatTdollEnhancement", "rNoxPlayer mc o30 Count1 n0 w3000,50")
		if(Found == 1)
		{
			Retirement()
			RetirementLoop++
		}
		RetirementLoop--
	}
	Found := FindClick(A_ScriptDir "\pics\Maps\5_2E\HeliportBottomLeft", "rNoxPlayer mc o5 Count1 n0 w5000,50")
	if Found >= 1
	{

	}
	Else
	{
		GuiControl,, NB, Paused
		Pause
	}
	RFindClick("\Maps\5_2E\HeliportBottomLeft", "rNoxPlayer mc o5 w30000,50")
	RFindClick("Battleok", "rNoxPlayer mc o5 w30000,50")
	RFindClick("\Maps\5_2E\CommandPost", "rNoxPlayer mc o5 w30000,50")
	RFindClick("Battleok", "rNoxPlayer mc o5 w30000,50")
	RFindClick("StartCombat", "rNoxPlayer mc o25 w3000,10 a1000,620 n3 sleep200")
	sleep 2000
	RFindClick("\Maps\5_2E\CommandPost", "rNoxPlayer mc o5 w30000,50 n2 sleep1000")
	RFindClick("ResupplyButton", "rNoxPlayer mc o5 w30000,50")
	sleep 500
	RFindClick("Planning", "rNoxPlayer mc o5 w30000,50")
	RFindClick("\Maps\5_2E\HeliportBottomLeftPlanning", "rNoxPlayer mc o5 w30000,50")
	RFindClick("\Maps\5_2E\Enemy1", "rNoxPlayer mc o30 w30000,50")
	RFindClick("\Maps\5_2E\Enemy2", "rNoxPlayer mc o30 w30000,50")
	RFindClick("\Maps\5_2E\Enemy3", "rNoxPlayer mc o30 w30000,50")
	RFindClick("\Maps\5_2E\Enemy4", "rNoxPlayer mc o30 w30000,50")
	RFindClick("\Maps\5_2E\Enemy5", "rNoxPlayer mc o30 w30000,50")
	RFindClick("Execute", "rNoxPlayer mc o5 w30000,50")
	nodes(5)
	sleep 1000
	RFindClick("EndTurn", "rNoxPlayer mc o30 w30000,50 a1100,620 n3 sleep250")
	GoHome()
}



4_3E( )
{
	Global
	RetirementLoop := 1
	while (RetirementLoop != 0)
	{
		FocusChapter(4)
		RFindClick("Emergency", "rNoxPlayer mc o5 w30000,50")
		sleep 250
		RFindClick("4_3e", "rNoxPlayer mc o5 w30000,50")
		RFindClick("battle", "rNoxPlayer mc o5 w30000,50")
		Found := FindClick(A_ScriptDir "\pics\CombatTdollEnhancement", "rNoxPlayer mc o30 Count1 n0 w3000,50")
		if(Found == 1)
		{
			Retirement()
			RetirementLoop++
		}
		RetirementLoop--
	}
	Found := FindClick(A_ScriptDir "\pics\Heliport", "rNoxPlayer mc o5 Count1 n0 w5000,50")
	if Found >= 1
	{

	}
	Else
	{
		GuiControl,, NB, Paused
		Pause
	}
	RFindClick("Heliport", "rNoxPlayer mc o5 w30000,50")
	RFindClick("Battleok", "rNoxPlayer mc o5 w30000,50")
	RFindClick("CommandPost", "rNoxPlayer mc o5 w30000,50")
	RFindClick("Battleok", "rNoxPlayer mc o5 w30000,50")
	RFindClick("StartCombat", "rNoxPlayer mc o25 w3000,10 a1000,620 n3 sleep200")
	if (corpsedragoffV != 1)
	{
		TFindClick("4_3eCommandPostResupply", "4_3eCommandPostResupply2")
		TFindClick("4_3eCommandPostResupply2","ResupplyButton")
		RFindClick("ResupplyButton", "rNoxPlayer mc o5 w30000,50")
		sleep 500
		RFindClick("4_3eHeliResupply", "rNoxPlayer mc o5 w30000,50")
	}
	if (corpsedragoffV == 1)
	{
		RFindClick("4_3eHeliResupply", "rNoxPlayer mc o5 w30000,50")
		RFindClick("4_3eHeliResupplyAfter", "rNoxPlayer mc o5 w30000,50")
		RFindClick("ResupplyButton", "rNoxPlayer mc o5 w30000,50")
	}
	RFindClick("Planning", "rNoxPlayer mc o5 w30000,50")
	RFindClick("4_3eEnemy1", "rNoxPlayer mc o30 w30000,50",-50)
	RFindClick("4_3eEnemy2", "rNoxPlayer mc o15 w30000,50",-50)
	sleep 200
	ControlSend, , a, Nox
	RFindClick("4_3eEnemy3", "rNoxPlayer mc o10 w30000,50",-50)
	RFindClick("4_3eEnemy4", "rNoxPlayer mc o25 w30000,50",-50)
	RFindClick("Execute", "rNoxPlayer mc o10 w30000,50")

	nodes(4)
	RFindClick("EndTurn", "rNoxPlayer mc o30 w30000,50 a1100,620 n3 sleep250")

	; go home
	GoHome()
}

3_2N( )
{
	Global
	FocusChapter(3)
	RFindClick("\Maps\3_2N\NightBattle", "rNoxPlayer mc o30 w30000,50")
	sleep 250
	RFindClick("\Maps\3_2N\3_2N", "rNoxPlayer mc o5 w30000,50")
	RFindClick("\Maps\3_2N\Battle", "rNoxPlayer mc o5 w30000,50")
	Found := FindClick(A_ScriptDir "\pics\Maps\3_2N\WaitMap", "rNoxPlayer mc o30 Count1 n0 w30000,50")
	if Found >= 1
	{

	}
	Else
	{
		GuiControl,, NB, Paused
		Pause
	}
	RFindClick("\Maps\3_2N\WaitMap", "rNoxPlayer mc o30 w30000,50 n0")
	RFindClick("\Maps\3_2N\HeliPort1", "rNoxPlayer mc o30 w30000,50 a199,200,-980,-440")
	RFindClick("\Maps\3_2N\HeliPortOK", "rNoxPlayer mc o5 w30000,50")
	RFindClick("\Maps\3_2N\HeliPort2", "rNoxPlayer mc o30 w30000,50")
	RFindClick("\Maps\3_2N\HeliPortOK", "rNoxPlayer mc o5 w30000,50")
	RFindClick("StartCombat", "rNoxPlayer mc o25 w3000,10 a1000,620 n3 sleep200")
	RFindClick("\Maps\3_2N\CloseNight", "rNoxPlayer mc o5 w30000,50")
	sleep 2000
	RFindClick("\Maps\3_2N\HeliPort2After", "rNoxPlayer mc o30 w30000,10 n2 a270,550,-920,-100")
	sleep 500
	RFindClick("\Maps\3_2N\HeliPort2Supply", "rNoxPlayer mc o5 w30000,50")
	sleep 500
	RFindClick("\Maps\3_2N\HeliPort2AfterClicked", "rNoxPlayer mc o30 w30000,50 a270,550,-920,-100")
	RFindClick("\Maps\3_2N\Retreat", "rNoxPlayer mc o5 w12000,50 ")
	sleep 500
	RFindClick("\Maps\3_2N\Confirm", "rNoxPlayer mc o5 w30000,50")
	sleep 1000
	RFindClick("\Maps\3_2N\PlanningMode", "rNoxPlayer mc o5 w30000,50")
	RFindClick("\Maps\3_2N\HeliPort1After", "rNoxPlayer mc o40 w30000,50 a199,200,-980,-440")
	RFindClick("\Maps\3_2N\3_2NEnemy1", "rNoxPlayer mc o30 w30000,50")
	RFindClick("\Maps\3_2N\3_2NEnemy2", "rNoxPlayer mc o30 w30000,50")
	RFindClick("\Maps\3_2N\3_2NEnemy3", "rNoxPlayer mc o30 w30000,50")
	RFindClick("Execute", "rNoxPlayer mc o5 w30000,50")

	nodes(3)

	RFindClick("\Maps\3_2N\HeliPort2After", "rNoxPlayer mc o30 w30000,10 a270,550,-920,-100")
	sleep 500
	RFindClick("\Maps\3_2N\Echelon3", "rNoxPlayer mc o60 w30000,50")
	RFindClick("\Maps\3_2N\HeliPortOK", "rNoxPlayer mc o5 w30000,50")
	Sleep 2000
	RFindClick("\Maps\3_2N\HeliPort2Stage3", "rNoxPlayer mc o30 w2000,50 a270,550,-920,-100 ")
	RFindClick("\Maps\3_2N\Switcher", "rNoxPlayer mc o30 w2000,50 a520,514,-650,-170 ")
	sleep 500
	RFindClick("\Maps\3_2N\Switch", "rNoxPlayer mc o30 w2000,50")
	Sleep 1000
	RFindClick("\Maps\3_2N\WaitForSwitch", "rNoxPlayer mc o30 w30000,50 n0")
	sleep 2000
	RFindClick("\Maps\3_2N\HeliPort2Stage3", "rNoxPlayer mc o30 w30000,50 a270,550,-920,-100 ")
	RFindClick("\Maps\3_2N\Select", "rNoxPlayer mc o30 w30000,50 ")
	RFindClick("\Maps\3_2N\Helipad2Select", "rNoxPlayer mc o30 w30000,50 a270,550,-920,-100")
	RFindClick("\Maps\3_2N\Retreat", "rNoxPlayer mc o5 w2000,50 ")
	sleep 500
	RFindClick("\Maps\3_2N\Confirm", "rNoxPlayer mc o30 w30000,50")
	sleep 1000
	RFindClick("\Maps\3_2N\Terminate", "rNoxPlayer mc o30 w30000,50")
	RFindClick("\Maps\3_2N\TerminateOK", "rNoxPlayer mc o30 w30000,50")

	GoHome()
	RetirementCounter--
}

5_4(friendly := False)
{
	Global
	if (friendly == False)
	{
		RetirementLoop := 1
		while (RetirementLoop != 0)
		{
			FocusChapter(5)
			sleep 250
			Transition("\Maps\5_4\5_4Map", "\Maps\5_4\Battle")
			RFindClick("\Maps\5_4\Battle", "rNoxPlayer mc o20 w30000,50")
			Found := FindClick(A_ScriptDir "\pics\CombatTdollEnhancement", "rNoxPlayer mc o30 Count1 n0 w3000,50")
			if(Found == 1)
			{
				Retirement()
				RetirementLoop++
			}
			RetirementLoop--
		}
		Found := NoStopFindClick("Maps\5_4\5_4MapWait", "rNoxPlayer mc o10 Count1 n0 w30000,50")
		if Found >= 1
		{

		}
		Else
		{
			GuiControl,, NB, Paused
			Pause
		}
	}
	RFindClick("\Maps\5_4\5_4MapWait", "rNoxPlayer mc o10 w30000,50 n0")
	RFindClick("\Maps\5_4\TopLeftHeliPort", "rNoxPlayer mc o10 w30000,50")
	RFindClick("\Maps\5_4\OK", "rNoxPlayer mc o10 w30000,50")
	RFindClick("\Maps\5_4\CommandCenter", "rNoxPlayer mc o10 w30000,50 Center a950,,,-500")
	RFindClick("\Maps\5_4\OK", "rNoxPlayer mc o10 w30000,50")
	RFindClick("StartCombat", "rNoxPlayer mc o25 w3000,10 a1000,620 n3 sleep200")
	TFindClick("\Maps\5_4\CommandCenterAfter", "\Maps\5_4\CommandCenterAfterClicked")
	TFindClick("\Maps\5_4\CommandCenterAfterClicked", "\Maps\5_4\Resupply")
	RFindClick("\Maps\5_4\Resupply", "rNoxPlayer mc o10 w30000,50")
	sleep 500
	RFindClick("\Maps\5_4\TopLeftHeliPort", "rNoxPlayer mc o10 w30000,50")
	RFindClick("\Maps\5_4\PlanningMode", "rNoxPlayer mc o10 w30000,50")
	RFindClick("\Maps\5_4\5_4Enemy1", "rNoxPlayer mc o10 w30000,50")
	RFindClick("\Maps\5_4\5_4Enemy2", "rNoxPlayer mc o10 w30000,50")
	RFindClick("\Maps\5_4\5_4Enemy3", "rNoxPlayer mc o10 w30000,50")
	RFindClick("\Maps\5_4\5_4Enemy4", "rNoxPlayer mc o10 w30000,50")
	RFindClick("\Maps\5_4\5_4Enemy5", "rNoxPlayer mc o10 w30000,50")
	RFindClick("Execute", "rNoxPlayer mc o5 w30000,50")

	nodes(5)

	RFindClick("EndTurn", "rNoxPlayer mc o30 w30000,50 a1100,620 n3 sleep250")

	GoHome()
}

0_2()
{
	Global
	RetirementLoop := 1
	while (RetirementLoop != 0)
	{
		FocusChapter(0)
		RFindClick("\Maps\0_2\0_2Map", "rNoxPlayer mc o200 w5000,50")
		RFindClick("\Maps\0_2\0_2Battle", "rNoxPlayer mc o30 w30000,50")
		Found := FindClick(A_ScriptDir "\pics\CombatTdollEnhancement", "rNoxPlayer mc o30 Count1 n0 w3000,50")
		if(Found == 1)
		{
			Retirement()
			RetirementLoop++
		}
		RetirementLoop--
	}
	Found := NoStopFindClick("Maps\0_2\0_2MapWait", "rNoxPlayer mc o30 Count1 n0 w30000,50")
	if Found >= 1
	{

	}
	Else
	{
		GuiControl,, NB, Cound not find map reference, Paused
		Pause
	}
	RFindClick("\Maps\0_2\0_2CommandPost", "rNoxPlayer mc o10 w30000,50 ")
	RFindClick("\Maps\0_2\OK", "rNoxPlayer mc o10 w30000,50 ")
	RFindClick("\Maps\0_2\HeliPort", "rNoxPlayer mc o10 w30000,50 ")
	RFindClick("\Maps\0_2\OK", "rNoxPlayer mc o10 w30000,50 ")
	RFindClick("StartCombat", "rNoxPlayer mc o25 w3000,10 a1000,620 n3 sleep200")
	TFindClick("\Maps\0_2\HeliPortResupply","\Maps\0_2\HeliPortResupply2")
	TFindClick("\Maps\0_2\HeliPortResupply2","\Maps\0_2\Resupply")
	ClickTilGone("\Maps\0_2\Resupply", " rNoxPlayer mc o10 w30000,50")
	sleep 500
	RFindClick("\Maps\0_2\CommandCenterResupply", "rNoxPlayer mc o10 a550,300,-550,-300 w1000,50 ")
	RFindClick("\Maps\0_2\PlanningMode", "rNoxPlayer mc o10 w30000,50 ")
	RFindClick("\Maps\0_2\0_2Enemy1", "rNoxPlayer mc o30 w30000,50 ")
	sleep 200
	ControlSend, , a, Nox
	RFindClick("\Maps\0_2\0_2Enemy2", "rNoxPlayer mc o30 w30000,50 n0")
	sleep 50
	RFindClick("\Maps\0_2\0_2Enemy2", "rNoxPlayer mc o30 w30000,50 ")
	RFindClick("\Maps\0_2\0_2Enemy3", "rNoxPlayer mc o30 w30000,50 ")
	RFindClick("\Maps\0_2\0_2Enemy4", "rNoxPlayer mc o30 w30000,50 ")
	RFindClick("Execute", "rNoxPlayer mc o5 w30000,50")

	nodes(3)

	RFindClick("EndTurn", "rNoxPlayer mc o30 w30000,50 a1100,620 n3 sleep250")
	sleep 4000 ;need it
	TFindClick("\Maps\0_2\DragSquad","\Maps\0_2\DragSquadClicked")
	RFindClick("\Maps\0_2\PlanningMode", "rNoxPlayer mc o10 w30000,50 ")
	RFindClick("\Maps\0_2\0_2Enemy5", "rNoxPlayer mc o10 w30000,50 ")
	RFindClick("\Maps\0_2\0_2Enemy6", "rNoxPlayer mc o10 w30000,50 ")
	RFindClick("Execute", "rNoxPlayer mc o10 w30000,50")

	nodes(2)

	RFindClick("EndTurn", "rNoxPlayer mc o30 w30000,50 a1100,620 n3 sleep250")
	
	GoHome()
}

5_4_friendly()
{
	Global
	FocusChapter(5)
	RFindClick("\Maps\5_4\5_4Map", "rNoxPlayer mc o20 w30000,50")
	RFindClick("\Maps\5_4\Battle", "rNoxPlayer mc o20 w30000,50")
	Found := FindClick(A_ScriptDir "\pics\Maps\5_4\5_4MapWait", "rNoxPlayer mc o10 Count1 n0 w30000,50")
	if Found >= 1
	{

	}
	Else
	{
		GuiControl,, NB, Paused
		Pause
	}
	while (true)
	{
		RFindClick("Maps\5_4\CommandCenter", "rNoxPlayer mc o50 w30000,50 Center a950,,,-500")
		RFindClick("Maps\5_4\Echelon2", "rNoxPlayer mc o30 w2000,50")
		RFindClick("Maps\5_4\OK", "rNoxPlayer mc o10 w30000,50")
		RFindClick("StartCombat", "rNoxPlayer mc o25 w3000,10 a1000,620 n3 sleep200")
		sleep 1000
		RFindClick("Maps\5_4\5_4MapWait", "rNoxPlayer mc o25 w30000,50 n0")
		sleep 1000
		TFindClick("Maps\5_4\TopLeftHeliPort","Maps\5_4\Support")
		RFindClick("Maps\5_4\Support", "rNoxPlayer mc o50 w30000,50 ")  
		Found := FindClick(A_ScriptDir "\pics\Maps\5_4\SupportExit", "rNoxPlayer mc o30 Count1 w1000,50")
		if(Found >= 1)
		{
			break
		}
		RFindClick("Maps\5_4\SupportFriend", "rNoxPlayer mc o50 w30000,50 ")
		RFindClick("Maps\5_4\OK", "rNoxPlayer mc o20 w30000,50")
		sleep 500
		TFindClick("Maps\5_4\BottomLeftHeliPort","Maps\5_4\Support")
		RFindClick("Maps\5_4\Support", "rNoxPlayer mc o50 w30000,50 ")  
		Found := FindClick(A_ScriptDir "\pics\Maps\5_4\SupportExit", "rNoxPlayer mc o30 Count1 w1000,50")
		if(Found >= 1)
		{
			break
		}
		RFindClick("Maps\5_4\SupportFriend", "rNoxPlayer mc o50 w30000,50 ")
		RFindClick("Maps\5_4\OK", "rNoxPlayer mc o20 w30000,50")
		RFindClick("Maps\5_4\Terminate", "rNoxPlayer mc o20 w30000,50")
		RFindClick("Maps\5_4\Restart", "rNoxPlayer mc o20 w30000,50")
		RFindClick("Maps\5_4\5_4MapWait", "rNoxPlayer mc o20 w30000,50 n0")
		sleep 1000
	}
	RFindClick("Maps\5_4\SupportExit2", "rNoxPlayer mc o20 w30000,50")
	RFindClick("Maps\5_4\Terminate", "rNoxPlayer mc o20 w30000,50")
	RFindClick("Maps\5_4\Restart", "rNoxPlayer mc o20 w30000,50")
	5_4(True)
	GuiControl,, NB, Friends Done for today, select another map.
	Pause
}

5_6()
{
	Global
	FocusChapter(5)
	DragDownToUp(764, 665, 300)
	RFindClick("\Maps\5_6\5_6Map", "rNoxPlayer mc o20 w30000,50")
	sleep 500
	RFindClick("Battle", "rNoxPlayer mc o20 w30000,50")
	sleep 1000
	Found := FindClick(A_ScriptDir "\pics\Turn0", "rNoxPlayer mc o30 Count1 w5000,50 n0")
	if Found >= 1
	{		
	}
	Else
	{
		GuiControl,, NB, Paused
		Pause
	}
	ZoomOut(3)
	RFindClick("\Maps\5_6\CommandPost", "rNoxPlayer mc o10 w30000,50")
	RFindClick("\Maps\5_6\Echelon2", "rNoxPlayer mc o10 w30000,50")
	RFindClick("Battleok", "rNoxPlayer mc o30 w3000,10 a1000,620")
	sleep 500
	DragUpToDown(773, 107, 715)
	RFindClick("\Maps\5_6\Heliport", "rNoxPlayer mc o5 w30000,50")
	RFindClick("Battleok", "rNoxPlayer mc o5 w30000,50")
	RFindClick("StartCombat", "rNoxPlayer mc o30 w3000,10 a1000,620")
	sleep 2000
	TFindClick("\Maps\5_6\HeliportResupply","\Maps\5_6\HeliportResupply2")
	TFindClick("\Maps\5_6\HeliportResupply2","ResupplyButton")
	RFindClick("ResupplyButton", " rNoxPlayer mc o10 w30000,50")
	sleep 500
	RFindClick("Planning", "rNoxPlayer mc o5 w30000,50")
	RFindClick("\Maps\5_6\Node1", "rNoxPlayer mc o30 w30000,50")
	RFindClick("\Maps\5_6\Node2", "rNoxPlayer mc o30 w30000,50")
	RFindClick("\Maps\5_6\Node3", "rNoxPlayer mc o30 w30000,50")
	RFindClick("\Maps\5_6\Node4", "rNoxPlayer mc o30 w30000,50")
	RFindClick("Execute", "rNoxPlayer mc o5 w30000,50")
	WaitExecution()
	sleep 500
	RFindClick("EndTurn", "rNoxPlayer mc o30 w30000,50 a1100,620")
	GoHome()
}