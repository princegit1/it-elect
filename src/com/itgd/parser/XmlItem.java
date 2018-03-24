package com.itgd.parser;

import java.io.Serializable;

/**
 * Represents an item in an XML feed.
 *
 * @author     Santosh Jena
 */
public class XmlItem implements Serializable {
		String STATE = null;
		String PARTY = null;
	    String PREVIOUSWON = null;
	    String PREVIOUSLEADING = null;
	    String CURRENTWON = null;
	    String CURRENTLEADING = null;
	    String constituency = null;
	    String candidate = null;
	    String status = null;
	    String alliance = null;
	    String count = null;
	    String id = null;
	    String nationalorder=null;
		String stateorder=null;
		
		String assembly=null;
		
		String priority=null;
		String gainloss=null;
		String lastwon = null;
		String won = null;
		String lead = null;
	
	    
	    
	    String seatingmp = null;
		String seatingpartyname = null;
		String seatingpartycode=null; 
		String winingmp=null;
		String winingpartyname=null;
		String winingpartycode=null;
		String cid=null;
		
		String pabbrname = null;
		String colorCode = null;	
		String STATEHINDI = null;		
		String constituencyHindi = null;	
		String totalSeats = null;
	

		
		
		String zone = null;
	    
		public String getPabbrname() {
			return pabbrname;
		}
		public void setPabbrname(String pabbrname) {
			this.pabbrname = pabbrname;
		}
		public String getColorCode() {
			return colorCode;
		}
		public void setColorCode(String colorCode) {
			this.colorCode = colorCode;
		}
		public String getCid() {
			return cid;
		}
		public void setCid(String cid) {
			this.cid = cid;
		}
		public String getSeatingmp() {
			return seatingmp;
		}
		public void setSeatingmp(String seatingmp) {
			this.seatingmp = seatingmp;
		}
		public String getSeatingpartyname() {
			return seatingpartyname;
		}
		public void setSeatingpartyname(String seatingpartyname) {
			this.seatingpartyname = seatingpartyname;
		}
		public String getSeatingpartycode() {
			return seatingpartycode;
		}
		public void setSeatingpartycode(String seatingpartycode) {
			this.seatingpartycode = seatingpartycode;
		}
		public String getWiningmp() {
			return winingmp;
		}
		public void setWiningmp(String winingmp) {
			this.winingmp = winingmp;
		}
		public String getWiningpartyname() {
			return winingpartyname;
		}
		public void setWiningpartyname(String winingpartyname) {
			this.winingpartyname = winingpartyname;
		}
		public String getWiningpartycode() {
			return winingpartycode;
		}
		public void setWiningpartycode(String winingpartycode) {
			this.winingpartycode = winingpartycode;
		}
		public String getId() {
			return id;
		}
		public void setId(String id) {
			this.id = id;
		}
		public String getAlliance() {
			return alliance;
		}
		public void setAlliance(String alliance) {
			this.alliance = alliance;
		}
		public String getCount() {
			return count;
		}
		public void setCount(String count) {
			this.count = count;
		}
		public String getPARTY() {
			return PARTY;
		}
		public void setPARTY(String party) {
			PARTY = party;
		}
		public String getPREVIOUSWON() {
			return PREVIOUSWON;
		}
		public void setPREVIOUSWON(String previouswon) {
			PREVIOUSWON = previouswon;
		}
		public String getPREVIOUSLEADING() {
			return PREVIOUSLEADING;
		}
		public void setPREVIOUSLEADING(String previousleading) {
			PREVIOUSLEADING = previousleading;
		}
		public String getCURRENTWON() {
			return CURRENTWON;
		}
		public void setCURRENTWON(String currentwon) {
			CURRENTWON = currentwon;
		}
		public String getCURRENTLEADING() {
			return CURRENTLEADING;
		}
		public void setCURRENTLEADING(String currentleading) {
			CURRENTLEADING = currentleading;
		}
		public String getSTATE() {
			return STATE;
		}
		public void setSTATE(String state) {
			STATE = state;
		}
		public String getConstituency() {
			return constituency;
		}
		public void setConstituency(String constituency) {
			this.constituency = constituency;
		}
		public String getCandidate() {
			return candidate;
		}
		public void setCandidate(String candidate) {
			this.candidate = candidate;
		}
		public String getStatus() {
			return status;
		}
		public void setStatus(String status) {
			this.status = status;
		}
		public String getNationalorder() {
			return nationalorder;
		}
		public void setNationalorder(String nationalorder) {
			this.nationalorder = nationalorder;
		}
		public String getStateorder() {
			return stateorder;
		}
		public void setStateorder(String stateorder) {
			this.stateorder = stateorder;
		}
		public String getPriority() {
			return priority;
		}
		public void setPriority(String priority) {
			this.priority = priority;
		}
		public String getAssembly() {
			return assembly;
		}
		public void setAssembly(String assembly) {
			this.assembly = assembly;
		}
		public String getGainloss() {
			return gainloss;
		}
		public void setGainloss(String gainloss) {
			this.gainloss = gainloss;
		}
		public String getLastwon() {
			return lastwon;
		}
		public void setLastwon(String lastwon) {
			this.lastwon = lastwon;
		}
		public String getWon() {
			return won;
		}
		public void setWon(String won) {
			this.won = won;
		}
		public String getLead() {
			return lead;
		}
		public void setLead(String lead) {
			this.lead = lead;
		}
		public String getSTATEHINDI() {
			return STATEHINDI;
		}
		public void setSTATEHINDI(String sTATEHINDI) {
			STATEHINDI = sTATEHINDI;
		}
		public String getConstituencyHindi() {
			return constituencyHindi;
		}
		public void setConstituencyHindi(String constituencyHindi) {
			this.constituencyHindi = constituencyHindi;
		}
		public String getTotalSeats() {
			return totalSeats;
		}
		public void setTotalSeats(String totalSeats) {
			this.totalSeats = totalSeats;
		}
		public String getZone() {
			return zone;
		}
		public void setZone(String zone) {
			this.zone = zone;
		}
}
