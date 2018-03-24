<%@ page
	import="java.util.*,com.itgd.server.*,com.itgd.parser.*,com.itgd.data.*"%>
<!DOCTYPE html PUBLIC "-//WAPFORUM//DTD XHTML Mobile 1.0//EN" "http://www.wapforum.org/DTD/xhtml-mobile10.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>National Tally</title>
<link href="election09_css.css" rel="stylesheet" type="text/css" />
</head>

<body>

	<table width="421" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td height="51" valign="top"
				background="images/tally-box-top-band.gif"><table width="421"
					border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td width="143" height="26" class="statewhitetext1">Others
							Master</td>

					</tr>
					<tr>
						<td height="25" colspan="3" valign="bottom">
							<table width="407" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td width="124" height="24" class="parties"><span
										style="margin-left: 10px;">Parties</span></td>

									<td width="297" height="24" align="center" valign="middle"
										class="parties">Lead</td>
									<td width="297" height="24" align="center" valign="middle"
										class="parties">WON</td>
								</tr>
							</table>
						</td>
					</tr>
				</table></td>
		</tr>
		<tr>

			<td align="left" valign="top"
				style="border-left: 1px solid #DEDEDC; border-right: 1px solid #DEDEDC;">
				<table width="395" border="0" align="center" cellpadding="0"
					cellspacing="0">
					<tr>
						<td width="61" height="10"></td>
						<td colspan="3" height="10"></td>
					</tr>
					<tr>
						<strong>CONGRESS</strong>
					</tr>
					<%
          
      String bgcolor="";
      DbManager db = new DbManager();
      String[] congParty = { "CONG","AITC","NCP","BOPF","JMM","NC","DMK","VCK","MUL","KEC(M)","RPI(A)"};
      for(int j=0;j<11;j++){
      
		ArrayList parseData = (ArrayList)db.getAllPartyData(congParty[j]);	
      
			if(parseData!= null && parseData.size()>0)
				{
					for(int i=0;i<parseData.size();i++)
						{
				NationalItem item= (NationalItem) parseData.get(i);			
				String currentleading=item.getCURRENTLEADING();
				String currentown=item.getCURRENTWON();					
						
							
   %>
					<% 
        ColourCode ccode=new ColourCode();
     	bgcolor=ccode.getColourCode(congParty[j]);
     
      %>
					<input type="hidden" name="id" value='<%= item.getId() %>' />
					<input type="hidden" name="party" value='<%= item.getPARTY() %>' />

					<tr>
						<td height="27" colspan="2" bgcolor="<%=bgcolor%>"
							class="partiescolor"><%=congParty[j]%></td>

						<td width="290" height="27" align="center" valign="middle"
							bgcolor="#DEDEDC" class="priority"><input type="text"
							name="lead" value='<%= currentleading %> '></input></td>
						<td width="290" height="27" align="center" valign="middle"
							bgcolor="#DEDEDC" class="priority"><input type="text"
							name="won" value='<%= currentown%> '></input></td>

					</tr>
					<tr>
						<td height="5" colspan="2"></td>
						<td height="5" align="center" valign="middle" class="parties"
							style="background-image: url(images/dot.gif); background-repeat: repeat-y; background-position: right top;"
							colspan="2" width="290"></td>
					</tr>
					<%
 
	 }


 }}
     %>
					<tr>

					</tr>
				</table>
				<table width="395" border="0" align="center" cellpadding="0"
					cellspacing="0">
					<tr>
						<td width="61" height="10"></td>
						<td colspan="3" height="10"></td>
					</tr>
					<tr>
						<strong>BJP</strong>
					</tr>
					<%
     
      String[] bjpParty = { "BJP","SHS","NPF","JD(U)","AGP","INLD","SAD","RLD","JD (U)"};
      for(int j=0;j<9;j++){
      
		ArrayList parseData = (ArrayList)db.getAllPartyData(bjpParty[j]);	
      
			if(parseData!= null && parseData.size()>0)
				{
					for(int i=0;i<parseData.size();i++)
						{
				NationalItem item= (NationalItem) parseData.get(i);			
				String currentleading=item.getCURRENTLEADING();
				String currentown=item.getCURRENTWON();					
						
							
   %>
					<% 
        ColourCode ccode=new ColourCode();
     	bgcolor=ccode.getColourCode(bjpParty[j]);
     
      %>
					<input type="hidden" name="id" value='<%= item.getId() %>' />
					<input type="hidden" name="party" value='<%= item.getPARTY() %>' />

					<tr>
						<td height="27" colspan="2" bgcolor="<%=bgcolor%>"
							class="partiescolor"><%=bjpParty[j]%></td>

						<td width="290" height="27" align="center" valign="middle"
							bgcolor="#DEDEDC" class="priority"><input type="text"
							name="lead" value='<%= currentleading %> '></input></td>
						<td width="290" height="27" align="center" valign="middle"
							bgcolor="#DEDEDC" class="priority"><input type="text"
							name="won" value='<%= currentown%> '></input></td>

					</tr>
					<tr>
						<td height="5" colspan="2"></td>
						<td height="5" align="center" valign="middle" class="parties"
							style="background-image: url(images/dot.gif); background-repeat: repeat-y; background-position: right top;"
							colspan="2" width="290"></td>
					</tr>
					<%
 
	 }


 }}
     %>
					<tr>

					</tr>
				</table>
				<table width="395" border="0" align="center" cellpadding="0"
					cellspacing="0">
					<tr>
						<td width="61" height="10"></td>
						<td colspan="3" height="10"></td>
					</tr>
					<tr>
						<strong>LEFT</strong>
					</tr>
					<%
 
      String[] leftParty = {"CPM","CPI","CPI(ML)","RSP","FB","KEC(J)"};
      for(int j=0;j<6;j++){
      
		ArrayList parseData = (ArrayList)db.getAllPartyData(leftParty[j]);	
      
			if(parseData!= null && parseData.size()>0)
				{
					for(int i=0;i<parseData.size();i++)
						{
				NationalItem item= (NationalItem) parseData.get(i);			
				String currentleading=item.getCURRENTLEADING();
				String currentown=item.getCURRENTWON();					
						
							
   %>
					<% 
        ColourCode ccode=new ColourCode();
     	bgcolor=ccode.getColourCode(leftParty[j]);
     
      %>
					<input type="hidden" name="id" value='<%= item.getId() %>' />
					<input type="hidden" name="party" value='<%= item.getPARTY() %>' />

					<tr>
						<td height="27" colspan="2" bgcolor="<%=bgcolor%>"
							class="partiescolor"><%=leftParty[j]%></td>

						<td width="290" height="27" align="center" valign="middle"
							bgcolor="#DEDEDC" class="priority"><input type="text"
							name="lead" value='<%= currentleading %> '></input></td>
						<td width="290" height="27" align="center" valign="middle"
							bgcolor="#DEDEDC" class="priority"><input type="text"
							name="won" value='<%= currentown%> '></input></td>

					</tr>
					<tr>
						<td height="5" colspan="2"></td>
						<td height="5" align="center" valign="middle" class="parties"
							style="background-image: url(images/dot.gif); background-repeat: repeat-y; background-position: right top;"
							colspan="2" width="290"></td>
					</tr>
					<%
 
	 }


 }}
     %>
					<tr>

					</tr>
				</table>
				<table width="395" border="0" align="center" cellpadding="0"
					cellspacing="0">
					<tr>
						<td width="61" height="10"></td>
						<td colspan="3" height="10"></td>
					</tr>
					<tr>
						<strong>OTHERS</strong>
					</tr>
					<%
     
      String[] othersParty = {"BJD","BSP","SP","TDP","TRS","LJP","RJD","AIADMK","AC","PPA","MGP","SGF","UGDF","MPP","NPP","UPDP","MDP","UDP","HSPDP","UNDP","MNF","MPC","ZNP","NDP","SDF","SGPP","SHRPP","SNLF","INPT","SD",
"ANVC","CVP","BNP","PMK","PMC","PMMM","AIMIM","PRP","PPI","AUDF","PDP","JD(S)","MNS","DMDK","IUML","NMK","MDMK","APNA DAL","JVM","UKD"};
      for(int j=0;j<50;j++){
      
		ArrayList parseData = (ArrayList)db.getAllPartyData(othersParty[j]);	
      
			if(parseData!= null && parseData.size()>0)
				{
					for(int i=0;i<parseData.size();i++)
						{
				NationalItem item= (NationalItem) parseData.get(i);			
				String currentleading=item.getCURRENTLEADING();
				String currentown=item.getCURRENTWON();					
						
							
   %>
					<% 
        ColourCode ccode=new ColourCode();
     	bgcolor=ccode.getColourCode(othersParty[j]);
     
      %>
					<input type="hidden" name="id" value='<%= item.getId() %>' />
					<input type="hidden" name="party" value='<%= item.getPARTY() %>' />

					<tr>
						<td height="27" colspan="2" bgcolor="<%=bgcolor%>"
							class="partiescolor"><%=othersParty[j]%></td>

						<td width="290" height="27" align="center" valign="middle"
							bgcolor="#DEDEDC" class="priority"><input type="text"
							name="lead" value='<%= currentleading %> '></input></td>
						<td width="290" height="27" align="center" valign="middle"
							bgcolor="#DEDEDC" class="priority"><input type="text"
							name="won" value='<%= currentown%> '></input></td>

					</tr>
					<tr>
						<td height="5" colspan="2"></td>
						<td height="5" align="center" valign="middle" class="parties"
							style="background-image: url(images/dot.gif); background-repeat: repeat-y; background-position: right top;"
							colspan="2" width="290"></td>
					</tr>
					<%
 
	 }


 }}
     %>

				</table>
			</td>
		</tr>
		<tr>
			<td height="20" background="images/tally-box-botom-band.gif"
				class="seemap"></td>
		</tr>
		<tr>
			<td>&nbsp;</td>
		</tr>
	</table>

</body>
</html>
