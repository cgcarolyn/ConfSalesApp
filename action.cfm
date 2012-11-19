<CFSET PageTitle="Conference Division, Purdue Events Tracking System">
<!--- Include Headaer. --->
<CFINCLUDE TEMPLATE="/cec/includes/header.txt">
		<!--- insert content here --->
		<!--- <CFINCLUDE TEMPLATE="/cec/includes/confmenu.txt"> --->
		<CFINCLUDE TEMPLATE="/cec/includes/pets.txt">
		<!--- end content here --->	
</TD>
<!--- Centent for middle panel --->
<TD COLSPAN="3" VALIGN="top">
&nbsp;&nbsp;&nbsp;&nbsp;<IMG SRC="/cec/subheadings/pets_database.gif" WIDTH="432" HEIGHT="27" HSPACE="0" VSPACE="0" BORDER="0" ALIGN="MIDDLE" ALT="PETS Database"><BR><BR>

<!--- Add or copy event function --->

<CFSET variables.today = #CreateODBCDate(DateFormat(Now()))#>
	
<CFIF IsDefined ("FORM.Insert") AND Session.prv_grp_num IS 3020><!--- ADD Function --->
	<CFQUERY name="InsertEvent" DATASOURCE="ocecEventreg">
	INSERT INTO Events
			(StartDate, 
			<CFIF FORM.StartTime IS NOT "">StartTime,</CFIF> 
			EndDate, 
			<CFIF FORM.EndTime IS NOT "">EndTime,</CFIF> 
			SchedNum, Term,
			SalesMarketing, NewProg, TradProg, RepeatProg,
			Publish, OnLineReg, BoardReq, PrevAcct,
			Calendar, PrevCoord, PrevCalID, 
			<CFIF FORM.PrevDate IS NOT "">PrevDate,</CFIF>
			AcctFund, AcctDept, AcctProj, AcctSubProj, DeptID, DeptFund, DeptCostCenter, BuildingID, SchoolID, CoordID, 
			ActID, DeptWorkshop, RevID, Location, TypeID,
			Classification,<CFIF isdefined("FORM.AcademicChair")> AcademicChair,</CFIF><CFIF isdefined("FORM.ChairPhone")> ChairPhone,</CFIF> Organization, OrganContact, 
			<CFIF isdefined("FORM.ChairPerson")>ChairPerson,</CFIF> UpdateBy, Owner, 
			PublishStart, PublishStartTime, PublishEnd, PublishEndTime,
			UnionSign, PMUSign, EFLSign, UnionClubSign, AthleticsSign, AthleticsUserID,  
			SpaceSign, HousingSign, ChairSign, DeanVPSign, OtherSign, OtherID,
			PDF, URL, Remove, Highlight, PublishNote, Fee, Note, RIO, Keyword, CalendarNote, UnionClubNote, ResHallNote, 
			ContactType, ContactAddress1, ContactAddress2, ContactCity, ContactState, ContactZip,
			<CFIF FORM.Union1 IS NOT "">Union1,</CFIF>
			<CFIF FORM.Union2 IS NOT "">Union2,</CFIF>
			<CFIF FORM.Union3 IS NOT "">Union3,</CFIF>
			<CFIF FORM.UnionStart1 IS NOT "">UnionStart1,</CFIF>
			<CFIF FORM.UnionStart2 IS NOT "">UnionStart2,</CFIF>
			<CFIF FORM.UnionStart3 IS NOT "">UnionStart3,</CFIF>
			<CFIF FORM.UnionEnd1 IS NOT "">UnionEnd1,</CFIF>
			<CFIF FORM.UnionEnd2 IS NOT "">UnionEnd2,</CFIF>
			<CFIF FORM.UnionEnd3 IS NOT "">UnionEnd3,</CFIF>
			<CFIF FORM.ResHallRooms IS NOT "">ResHallRooms,</CFIF>
			<CFIF FORM.ResHallStart IS NOT "">ResHallStart,</CFIF>
			<CFIF FORM.ResHallEnd IS NOT "">ResHallEnd,</CFIF>
			<CFIF FORM.ResHallYouth IS NOT "">ResHallYouth,</CFIF>
			<CFIF FORM.ResHallAdult IS NOT "">ResHallAdult,</CFIF>
			<CFIF FORM.ResHallFemale IS NOT "">ResHallFemale,</CFIF>
			<CFIF FORM.ResHallMale IS NOT "">ResHallMale,</CFIF>
			ContactPhone, ContactFax, ContactEmail, EstAttend, BillTo, PrimaryContact, Title
			)
						
	VALUES	(#CreateODBCDate(FORM.StartDate)#, 
			<CFIF FORM.StartTime IS NOT "">'#TimeFormat(FORM.StartTime, "hh:mm tt")#',</CFIF>
			#CreateODBCDate(FORM.EndDate)#, 
			<CFIF FORM.EndTime IS NOT "">'#TimeFormat(FORM.EndTime, "hh:mm tt")#',</CFIF>
			'#FORM.SchedNum#', '#FORM.Term#',
	 		<CFIF IsDefined ("FORM.SalesMarketing")>1,<CFELSE>0,</CFIF>
			<CFIF IsDefined ("FORM.NewProg")>1,<CFELSE>0,</CFIF>
			<CFIF IsDefined ("FORM.TradProg")>1,<CFELSE>0,</CFIF>
			<CFIF IsDefined ("FORM.RepeatProg")>1,<CFELSE>0,</CFIF>
			
			'#FORM.Publish#', 0,	'#FORM.BoardReq#', '#FORM.PrevAcct#',
			#CreateODBCDate(DateFormat(Now()))#, '#FORM.PrevCoord#', '#FORM.PrevCalID#',
			<CFIF FORM.PrevDate IS NOT "">#CreateODBCDate(FORM.PrevDate)#,</CFIF>
			'#FORM.AcctFund#', '#FORM.AcctDept#', '#FORM.AcctProj#', 
			'#FORM.AcctSubProj#', '#FORM.DeptID#', '#FORM.DeptFund#', '#DeptCostCenter#',  '#FORM.BuildingID#', '#FORM.SchoolID#', '#FORM.CoordID#', 
			'#FORM.ActID#', <CFIF FORM.ActID IS "3">'Yes',<CFELSE>'No',</CFIF> '#FORM.RevID#', 
			'#FORM.Location#', '#FORM.TypeID#',
			'#FORM.Classification#',<CFIF Isdefined("FORM.AcademicChair")> '#FORM.AcademicChair#', </CFIF><CFIF Isdefined("FORM.ChairPhone")>'#FORM.ChairPhone#',</CFIF> 
			'#FORM.Organization#', '#FORM.OrganContact#', 
			<CFIF isdefined("FORM.ChairPerson")>'#FORM.ChairPerson#',</CFIF> '#Session.prv_id#', '#Session.prv_id#',
			<CFIF FORM.PublishStart IS NOT "">#CreateODBCDate(FORM.PublishStart)#,<CFELSE>
				#CreateODBCDate(FORM.StartDate)#,</CFIF>
            <CFIF FORM.PublishStartTime IS NOT "">'#TimeFormat(FORM.PublishStartTime, "hh:mm tt")#',<CFELSE>NULL,</CFIF>
			<CFIF FORM.PublishEnd IS NOT "">#CreateODBCDate(FORM.PublishEnd)#,<CFELSE>
				#CreateODBCDate(FORM.EndDate)#,</CFIF>
          	<CFIF FORM.PublishEndTime IS NOT "">'#TimeFormat(FORM.PublishEndTime, "hh:mm tt")#',<CFELSE>NULL,</CFIF>
			<CFIF IsDefined ("FORM.UnionSign")>1,<CFELSE>0,</CFIF>
			<CFIF IsDefined ("FORM.PMUSign")>1,<CFELSE>0,</CFIF>
			<CFIF IsDefined ("FORM.EFLSign")>1,<CFELSE>0,</CFIF>
			<CFIF IsDefined ("FORM.UnionClubSign")>1,<CFELSE>0,</CFIF>
			<CFIF IsDefined ("FORM.AthleticsSign")>1, #FORM.AthleticsUserID#,<CFELSE>0, NULL,</CFIF>
			<CFIF IsDefined ("FORM.SpaceSign")>1,<CFELSE>0,</CFIF>
			<CFIF IsDefined ("FORM.HousingSign")>1,<CFELSE>0,</CFIF>
			<CFIF IsDefined ("FORM.ChairSign")>1,<CFELSE>0,</CFIF>
			<CFIF IsDefined ("FORM.DeanVPSign")>1,<CFELSE>0,</CFIF>
			<CFIF IsDefined ("FORM.OtherSign")>1, #FORM.OtherID#,<CFELSE>0, NULL,</CFIF>
					
			'#FORM.PDF#', '#FORM.URL#', '#FORM.Remove#', '#FORM.Highlight#',  '#FORM.PublishNote#',
			#DollarFormat(FORM.Fee)#, '#FORM.Note#', '#FORM.RIO#', '#FORM.Keyword#', '#FORM.CalendarNote#',
			'#FORM.UnionClubNote#', '#FORM.ResHallNote#', 
			'#FORM.ContactType#', '#FORM.ContactAddress1#', '#FORM.ContactAddress2#', '#FORM.ContactCity#', 
			'#FORM.ContactState#', '#FORM.ContactZip#',
			<CFIF FORM.Union1 IS NOT "">#FORM.Union1#,</CFIF>
			<CFIF FORM.Union2 IS NOT "">#FORM.Union2#,</CFIF>
			<CFIF FORM.Union3 IS NOT "">#FORM.Union3#,</CFIF>
			<CFIF FORM.UnionStart1 IS NOT "">#CreateODBCDate(FORM.UnionStart1)#,</CFIF>
			<CFIF FORM.UnionStart2 IS NOT "">#CreateODBCDate(FORM.UnionStart2)#,</CFIF>
			<CFIF FORM.UnionStart3 IS NOT "">#CreateODBCDate(FORM.UnionStart3)#,</CFIF>
			<CFIF FORM.UnionEnd1 IS NOT "">#CreateODBCDate(FORM.UnionEnd1)#,</CFIF>
			<CFIF FORM.UnionEnd2 IS NOT "">#CreateODBCDate(FORM.UnionEnd2)#,</CFIF>
			<CFIF FORM.UnionEnd3 IS NOT "">#CreateODBCDate(FORM.UnionEnd3)#,</CFIF>
			<CFIF FORM.ResHallRooms IS NOT "">#FORM.ResHallRooms#,</CFIF>
			<CFIF FORM.ResHallStart IS NOT "">#CreateODBCDate(FORM.ResHallStart)#,</CFIF>
			<CFIF FORM.ResHallEnd IS NOT "">#CreateODBCDate(FORM.ResHallEnd)#,</CFIF>
			<CFIF FORM.ResHallYouth IS NOT "">#FORM.ResHallYouth#,</CFIF>
			<CFIF FORM.ResHallAdult IS NOT "">#FORM.ResHallAdult#,</CFIF>
			<CFIF FORM.ResHallFemale IS NOT "">#FORM.ResHallFemale#,</CFIF>
			<CFIF FORM.ResHallMale IS NOT "">#FORM.ResHallMale#,</CFIF> 
			'#FORM.ContactPhone#', '#FORM.ContactFax#',	'#FORM.ContactEmail#', '#FORM.EstAttend#', 
			'#FORM.BillTo#',  '#Form.PrimaryContact#', '#FORM.Title#')	
</CFQUERY>
<CFQUERY name="GETID" DATASOURCE="ocecEventreg">
	SELECT MAX(EVENTID) AS ID
	FROM EVENTS
</CFQUERY>
	<CFSET ID = #GETID.ID#>
</CFIF>

<CFIF IsDefined ("FORM.Copy") AND Session.prv_grp_num IS 3020><!--- COPY Function --->
	<CFQUERY name="CopyEvent" DATASOURCE="ocecEventreg">
	INSERT INTO Events
			(StartDate, 
			<CFIF FORM.StartTime IS NOT "">StartTime,</CFIF> 
			EndDate, 
			<CFIF FORM.EndTime IS NOT "">EndTime,</CFIF> 
			SalesMarketing, NewProg, TradProg, RepeatProg, Location, TypeID,
			PrevCoord, AcctFund, AcctDept, DeptID, DeptFund, DeptCostCenter, SchoolID, BuildingID, CoordID, 
			ActID, DeptWorkshop, Classification, AcademicChair, ChairPhone, Organization, OrganContact, 
			ChairPerson, UpdateBy, Calendar, Note, Keyword,
			CalendarNote,
			UnionSign, PMUSign, EFLSign, UnionClubSign, AthleticsSign, 
			SpaceSign, HousingSign, ChairSign, DeanVPSign, OtherSign, OnlineReg, BoardReq, Publish,
			ContactType, ContactAddress1, ContactAddress2, ContactCity, ContactState, ContactZip,
			ContactPhone, ContactFax, ContactEmail, EstAttend, BillTo, Title)
						
	VALUES	(#CreateODBCDate(FORM.StartDate)#, 
			<CFIF FORM.StartTime IS NOT "">'#TimeFormat(FORM.StartTime, "hh:mm tt")#',</CFIF>
			#CreateODBCDate(FORM.EndDate)#, 
			<CFIF FORM.EndTime IS NOT "">'#TimeFormat(FORM.EndTime, "hh:mm tt")#',</CFIF>
	 		
			<CFIF IsDefined ("FORM.SalesMarketing")>1,<CFELSE>0,</CFIF>
			<CFIF IsDefined ("FORM.NewProg")>1,<CFELSE>0,</CFIF>
			<CFIF IsDefined ("FORM.TradProg")>1,<CFELSE>0,</CFIF>
			<CFIF IsDefined ("FORM.RepeatProg")>1,<CFELSE>0,</CFIF>
			
			'#FORM.Location#', '#FORM.TypeID#', '#FORM.PrevCoord#', '#FORM.AcctFund#', '#FORM.AcctDept#',
			'#FORM.DeptID#', '#FORM.DeptFund#', '#FORM.DeptCostCenter#', '#FORM.SchoolID#', '#FORM.BuildingID#', '#FORM.CoordID#', 
			'#FORM.ActID#', <CFIF FORM.ActID IS "3">'Yes',<CFELSE>'No',</CFIF> 
			'#FORM.Classification#', '#FORM.AcademicChair#', '#FORM.ChairPhone#', 
			'#FORM.Organization#', '#FORM.OrganContact#',
			'#FORM.ChairPerson#', '#Session.prv_id#', #CreateODBCDate(DateFormat(Now()))#, 
			<cfoutput>'Copied from ' + '#FORM.EventID#'</cfoutput>, '#FORM.Keyword#',
			'#FORM.CalendarNote#', 
			0,0,0,0,0,0,0,0,0,0,0,0,0,
			'#FORM.ContactType#', '#FORM.ContactAddress1#', '#FORM.ContactAddress2#', '#FORM.ContactCity#', 
			'#FORM.ContactState#', '#FORM.ContactZip#', 
			'#FORM.ContactPhone#', '#FORM.ContactFax#',	'#FORM.ContactEmail#', '#FORM.EstAttend#', 
			'#FORM.BillTo#', '#FORM.Title#')	
</CFQUERY>
<CFQUERY name="GETID" DATASOURCE="ocecEventreg">
	SELECT MAX(EVENTID) AS ID
	FROM EVENTS
</CFQUERY>
	<CFSET ID = #GETID.ID#>


</CFIF>

<!--- Calendar Office update - security group 3020 --->
<CFIF IsDefined ("FORM.Update") AND Session.prv_grp_num IS 3020>		
	<CFQUERY name="UpdateEvent" DATASOURCE="ocecEventreg">
		Update EVENTS SET 
			StartDate = #CreateODBCDate(FORM.StartDate)#,
			StartTime = '#TimeFormat(FORM.StartTime, "hh:mm tt")#',			
			EndDate = #CreateODBCDate(FORM.EndDate)#,
			EndTime = '#TimeFormat(FORM.EndTime, "hh:mm tt")#',
			SchedNum = '#FORM.SchedNum#',
			Term = '#FORM.Term#',			
			<CFIF FORM.EstAttend IS NOT "">
				EstAttend = '#FORM.EstAttend#',
			<CFELSE>EstAttend = 0,</CFIF>
			DeptID = 		'#FORM.DeptID#',
            DeptFund = '#FORM.DeptFund#',
            DeptCostCenter = '#FORM.DeptCostCenter#',
			<CFIF isdefined("FORM.AcademicChair")>AcademicChair = '#FORM.AcademicChair#',</CFIF>
			CoordID = 		'#FORM.CoordID#',
			<CFIF isdefined("FORM.ChairPerson")>ChairPerson = 	'#FORM.ChairPerson#',</CFIF>
			<CFIF isdefined("FORM.ChairPhone")>ChairPhone = 	'#FORM.ChairPhone#',</CFIF>
			SchoolID = 		'#FORM.SchoolID#',
			BuildingID = 	'#FORM.BuildingID#',
			CancelReason = 	'#FORM.CancelReason#',
			RevID = 		'#FORM.RevID#',
			TypeID =	 	'#FORM.TypeID#',
			PDF =  '#FORM.PDF#',
			URL = '#FORM.URL#',
	Remove = '#FORM.Remove#',
	Highlight = '#FORM.Highlight#',
			<CFIF FORM.CancelDate IS NOT "">
				CancelDate = #CreateODBCDate(FORM.CancelDate)#,</CFIF> 
			
			<CFIF FORM.PrevDate IS NOT "">
				PrevDate = #CreateODBCDate(FORM.PrevDate)#,</CFIF> 
	
			CancelNote =	'#FORM.CancelNote#',
			Organization =	'#FORM.Organization#',
			OrganContact = 	'#FORM.OrganContact#',
			BillTo =		'#FORM.BillTo#',
			AcctFund = 		'#FORM.AcctFund#',
			AcctDept = 		'#FORM.AcctDept#',
			AcctProj =		'#FORM.AcctProj#',
			AcctSubProj =	'#FORM.AcctSubProj#',
			Classification ='#FORM.Classification#',
			UpdateBy = 		'#Session.prv_id#',
			UpdateDate = 	#CreateODBCDate(DateFormat(Now()))#,
			
			<CFIF FORM.LOAOrig IS NOT "">
				LOAOrig = #CreateODBCDate(FORM.LOAOrig)#,</CFIF>
		
			<CFIF FORM.LOAComplete IS NOT "">
				LOAComplete = #CreateODBCDate(FORM.LOAComplete)#,</CFIF>
			
			<CFIF IsDefined ("FORM.SalesMarketing")>SalesMarketing=1, 
				<CFELSE>SalesMarketing = 0,</CFIF>
			
			<CFIF IsDefined ("FORM.NewProg")>NewProg=1, 
				<CFELSE>NewProg = 0,</CFIF>
			
			<CFIF IsDefined ("FORM.TradProg")>TradProg=1, 
				<CFELSE>TradProg = 0,</CFIF>

			<CFIF IsDefined ("FORM.RepeatProg")>RepeatProg=1, 
				<CFELSE>RepeatProg = 0,</CFIF>
						
			<CFIF IsDefined ("FORM.UnionSign")>UnionSign=1, 
				<CFELSE>UnionSign = 0,</CFIF>
			
			<CFIF IsDefined ("FORM.UnionSignNote") AND FORM.UnionSignNote IS NOT "">UnionSignNote='#FORM.UnionSignNote#', UnionSignDate= #variables.today#, 
			</CFIF>
			
			<CFIF IsDefined ("FORM.PMUSign")>PMUSign=1, 
				<CFELSE>PMUSign = 0,</CFIF>
			
			<CFIF IsDefined ("FORM.PMUSignNote") AND FORM.PMUSignNote IS NOT "">PMUSignNote='#FORM.PMUSignNote#', PMUSignDate= #variables.today#,
			</CFIF>
			
			<CFIF IsDefined ("FORM.EFLSign")>EFLSign=1, 
				<CFELSE>EFLSign = 0,</CFIF>
				
			<CFIF IsDefined ("FORM.EFLSignNote") AND FORM.EFLSignNote IS NOT "">EFLSignNote='#FORM.EFLSignNote#', EFLSignDate= #variables.today#,
			</CFIF>	
			
			<CFIF IsDefined ("FORM.UnionClubSign")>UnionClubSign=1, 
				<CFELSE>UnionClubSign = 0,</CFIF>
				
			<CFIF IsDefined ("FORM.UnionClubSignNote") AND FORM.UnionClubSignNote IS NOT "">UnionClubSignNote='#FORM.UnionClubSignNote#', UnionClubSignDate= #variables.today#,
			</CFIF>
			
			<CFIF IsDefined ("FORM.AthleticsSign")>AthleticsSign=1,  AthleticsUserID = #Form.AthleticsUserID#,
				<CFELSE>AthleticsSign = 0,</CFIF>
				
			<CFIF IsDefined ("FORM.AthleticsSignNote") AND FORM.AthleticsSignNote IS NOT "">AthleticsSignNote='#FORM.AthleticsSignNote#', AthleticsSignDate= #variables.today#,
			</CFIF>
			
			<CFIF IsDefined ("FORM.SpaceSign")>SpaceSign=1, 
				<CFELSE>SpaceSign = 0,</CFIF>
				
			<CFIF IsDefined ("FORM.SpaceSignNote") AND FORM.SpaceSignNote IS NOT "">SpaceSignNote='#FORM.SpaceSignNote#', SpaceSignDate= #variables.today#,
			</CFIF>
			
			<CFIF IsDefined ("FORM.HousingSign")>HousingSign=1, 
				<CFELSE>HousingSign = 0,</CFIF>
			
			<CFIF IsDefined ("FORM.HousingSignNote") AND FORM.HousingSignNote IS NOT "">HousingSignNote='#FORM.HousingSignNote#', HousingSignDate= #variables.today#,
			</CFIF>
			
			<CFIF IsDefined ("FORM.ChairSign")>ChairSign=1, 
				<CFELSE>ChairSign = 0,</CFIF>
			
			<CFIF IsDefined ("FORM.DeanVPSign")>DeanVPSign=1, 
				<CFELSE>DeanVPSign = 0,</CFIF>
			
			<CFIF IsDefined ("FORM.OtherSign")>OtherSign=1, OtherID = #Form.OtherID#,
				<CFELSE>OtherSign = 0,</CFIF>
                
           <CFIF IsDefined ("FORM.OtherSignNote") AND FORM.OtherSignNote IS NOT "">OtherSignNote='#FORM.OtherSignNote#', OtherSignDate= #variables.today#,
			</CFIF>
			
			<CFIF FORM.Revision IS NOT "">Revision = '#FORM.Revision#',
				<CFELSE>Revision = 0,</CFIF>
			
			<CFIF FORM.Under18 IS NOT "">Under18 = '#FORM.Under18#',
				<CFELSE>Under18 = 0,</CFIF>
			
			<CFIF FORM.Calendar IS NOT "">
				Calendar = #CreateODBCDate(FORM.Calendar)#,</CFIF>
						
			<CFIF FORM.Union1 IS NOT "">Union1 = '#FORM.Union1#',
				<CFELSE>Union1 = 0,</CFIF>
			
			<CFIF FORM.UnionStart1 IS NOT "">
				UnionStart1 = #CreateODBCDate(FORM.UnionStart1)#,
				<CFELSE> UnionStart1 = NULL,
				</CFIF>
				
			<CFIF FORM.UnionEnd1 IS NOT "">
				UnionEnd1 = #CreateODBCDate(FORM.UnionEnd1)#,
				<CFELSE> UnionEnd1 = NULL,
				</CFIF>
			
			<CFIF FORM.Union2 IS NOT "">Union2 = '#FORM.Union2#',
				<CFELSE>Union2 = 0,</CFIF>
			
			<CFIF FORM.UnionStart2 IS NOT "">
				UnionStart2 = #CreateODBCDate(FORM.UnionStart2)#,<CFELSE> UnionStart2 = NULL,</CFIF>
				
			<CFIF FORM.UnionEnd2 IS NOT "">
				UnionEnd2 = #CreateODBCDate(FORM.UnionEnd2)#,<CFELSE> UnionEnd2 = NULL,</CFIF>
				
			<CFIF FORM.Union3 IS NOT "">Union3 = '#FORM.Union3#',
				<CFELSE>Union3 = 0,</CFIF>
			
			<CFIF FORM.UnionStart3 IS NOT "">
				UnionStart3 = #CreateODBCDate(FORM.UnionStart3)#,<CFELSE> UnionStart3 = NULL,</CFIF>
				
			<CFIF FORM.UnionEnd3 IS NOT "">
				UnionEnd3 = #CreateODBCDate(FORM.UnionEnd3)#,<CFELSE> UnionEnd3 = NULL,</CFIF>
				
			<!--- <CFIF FORM.GradSingle IS NOT "">GradSingle = '#FORM.GradSingle#',
				<CFELSE>GradSingle = 0,</CFIF>
			
			<CFIF FORM.GradDouble IS NOT "">GradDouble = '#FORM.GradDouble#',
				<CFELSE>GradDouble = 0,</CFIF>
			
			<CFIF FORM.GradStart IS NOT "">
				GradStart = #CreateODBCDate(FORM.GradStart)#,</CFIF>
				
			<CFIF FORM.GradEnd IS NOT "">
				GradEnd = #CreateODBCDate(FORM.GradEnd)#,</CFIF> --->
			
			BoardReq = '#FORM.BoardReq#',
			
			<CFIF FORM.ResHallRooms IS NOT "">ResHallRooms = '#FORM.ResHallRooms#',
				<CFELSE>ResHallRooms = 0,</CFIF>
			
			<CFIF FORM.ResHallStart IS NOT "">
				ResHallStart = #CreateODBCDate(FORM.ResHallStart)#,</CFIF>
				
			<CFIF FORM.ResHallEnd IS NOT "">
				ResHallEnd = #CreateODBCDate(FORM.ResHallEnd)#,</CFIF>
				
			<CFIF FORM.ResHallAdult IS NOT "">ResHallAdult = '#FORM.ResHallAdult#',
				<CFELSE>ResHallAdult = 0,</CFIF>
			
			<CFIF FORM.ResHallYouth IS NOT "">ResHallYouth = '#FORM.ResHallYouth#',
				<CFELSE>ResHallYouth = 0,</CFIF>
			
			<CFIF FORM.ResHallFemale IS NOT "">ResHallFemale = '#FORM.ResHallFemale#',
				<CFELSE>ResHallFemale = 0,</CFIF>
			
			<CFIF FORM.ResHallMale IS NOT "">ResHallMale = '#FORM.ResHallMale#',
				<CFELSE>ResHallMale = 0,</CFIF>
			CalendarNote = '#FORM.CalendarNote#' + '#FORM.calendar_note_helper#',	
			UnionClubNote = '#FORM.UnionClubNote#',	
			ResHallNote = '#FORM.ResHallNote#',
			RIO = '#FORM.RIO#',

			Title = '#FORM.Title#'
		WHERE EventID = #FORM.EventID#</CFQUERY>
</CFIF>

		
<CFIF (IsDefined ("FORM.Update") AND Session.prv_grp_num IS 3020)>
		<CFQUERY name="UpdateEvent" DATASOURCE="ocecEventreg">
		Update EVENTS SET 
			AcctFund = 		'#FORM.AcctFund#',
			AcctDept = 		'#FORM.AcctDept#',
			AcctProj =		'#FORM.AcctProj#',
			Classification ='#FORM.Classification#',
			UpdateBy = 		'#Session.prv_id#',
			UpdateDate = 	#CreateODBCDate(DateFormat(Now()))#,
					
			<CFIF FORM.LOAOrig IS NOT "">
				LOAOrig = #CreateODBCDate(FORM.LOAOrig)#,</CFIF>
		
			<CFIF FORM.LOAComplete IS NOT "">
				LOAComplete = #CreateODBCDate(FORM.LOAComplete)#,</CFIF>
			
			AcctSubProj = '#FORM.AcctSubProj#'
		WHERE EventID = #FORM.EventID#</CFQUERY>
</CFIF>

<!--- Calendar Office or Coordinators update --->
<CFIF (IsDefined ("FORM.Update") AND Session.prv_grp_num IS 3020) OR 
	 (IsDefined ("FORM.Update") AND Session.prv_grp_num IS 3040)>		
	<CFQUERY name="UpdateEvent" DATASOURCE="ocecEventreg">
		Update EVENTS SET 
			AcctFund = 		'#FORM.AcctFund#',
			AcctDept = 		'#FORM.AcctDept#',
			AcctProj =		'#FORM.AcctProj#',
			AcctSubProj = '#FORM.AcctSubProj#',
			Classification = '#FORM.Classification#',
			PrevAcct =	'#FORM.PrevAcct#',
			<CFIF isdefined("FORM.PrevCoord")>PrevCoord = '#FORM.PrevCoord#',</CFIF>
			<CFIF isdefined("FORM.PrevCalID")>PrevCalID = '#FORM.PrevCalID#',</CFIF>
			Location =	'#FORM.Location#',
			TypeID =	'#FORM.TypeID#',
			ActID = '#FORM.ActID#',
			SchedNum = '#FORM.SchedNum#',
			Term = '#FORM.Term#',			
			<CFIF FORM.ActID IS "3">
				DeptWorkshop = 'Yes',
			<CFELSE>DeptWorkshop = 'No',</CFIF>
			            PrimaryContact = '#FORM.PrimaryContact#',
			ContactType = 	'#FORM.ContactType#',
			ContactAddress1 = '#FORM.ContactAddress1#',
			ContactAddress2 = '#FORM.ContactAddress2#',
			ContactCity =	'#FORM.ContactCity#',
			ContactState = 	'#FORM.ContactState#',
			ContactZip =	'#FORM.ContactZip#',
			ContactPhone =	'#FORM.ContactPhone#',
			ContactEmail =	'#FORM.ContactEmail#',
			ContactFax = 	'#FORM.ContactFax#',
			Note = '#FORM.Note#',
			UpdateBy = '#Session.prv_id#',
			UpdateDate = #CreateODBCDate(DateFormat(Now()))#,
			<CFIF isdefined("FORM.AcademicChair")>AcademicChair = '#FORM.AcademicChair#',</CFIF>
			<CFIF isdefined("FORM.ChairPhone")>ChairPerson = 	'#FORM.ChairPerson#',</CFIF>
			<CFIF isdefined("FORM.ChairPerson")>ChairPhone = 	'#FORM.ChairPhone#',</CFIF>
						
			<CFIF FORM.Fee IS NOT "">
				Fee = '#FORM.Fee#',
			<CFELSE>Fee = 0,</CFIF>
			
			PublishNote = '#FORM.PublishNote#',
			Publish = '#FORM.Publish#',
			
			<CFIF FORM.PublishStart IS NOT "">
				PublishStart = #CreateODBCDate(FORM.PublishStart)#,</CFIF>
			
			<CFIF FORM.PublishStartTime IS NOT "">
				PublishStartTime = '#TimeFormat(FORM.PublishStartTime, "hh:mm tt")#',</CFIF>
			
			<CFIF FORM.PublishEnd IS NOT "">
				PublishEnd = #CreateODBCDate(FORM.PublishEnd)#,</CFIF>
				
			<CFIF FORM.PublishEnd IS NOT "">
				PublishEndTime = '#TimeFormat(FORM.PublishEndTime, "hh:mm tt")#',</CFIF>
				
			RIO = '#FORM.RIO#',
			Keyword = '#FORM.Keyword#'
		WHERE EventID = #FORM.EventID#</CFQUERY>
</CFIF>

<CFIF IsDefined ("FORM.Update")>
		<BLOCKQUOTE><FONT FACE="Arial,Helvetica" SIZE="4"><cfoutput><B>#FORM.Title#</B></cfoutput> has been updated.  <BR><FONT FACE="Arial,Helvetica" SIZE="3">Event ID <cfoutput>#FORM.EventID#</cfoutput></BLOCKQUOTE>
</CFIF>

<CFIF IsDefined ("FORM.Insert")>
	<BLOCKQUOTE><FONT FACE="Arial,Helvetica" SIZE="4"><cfoutput><B>#FORM.Title#</B></cfoutput> has been added.<BR><BR> The event ID is:<CFOUTPUT>#ID#</CFOUTPUT> </BLOCKQUOTE>
</CFIF>

<CFIF IsDefined ("FORM.Copy")>
	<BLOCKQUOTE><FONT FACE="Arial,Helvetica" SIZE="4"><cfoutput><B>#FORM.Title#</B></cfoutput> has been added.<BR><BR> The event ID is:<CFOUTPUT>#ID#</CFOUTPUT></BLOCKQUOTE>
</CFIF>

<CFINCLUDE template="/cec/includes/footer.txt">
