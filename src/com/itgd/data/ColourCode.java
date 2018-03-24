package com.itgd.data;

public class ColourCode {

	public String getColourCode(String allience) {
		String bgcolor = null;

		if (allience.equalsIgnoreCase("cong")
				|| allience.equalsIgnoreCase("cong+")) {
			bgcolor = "#018fff";
		} else if (allience.equalsIgnoreCase("BJP")
				|| allience.equalsIgnoreCase("BJP+")) {
			bgcolor = "#fe9400";
		} else if (allience.equalsIgnoreCase("LEFT")
				|| allience.equalsIgnoreCase("LEFT+")) {
			bgcolor = "#ff2300";
		}

		else if (allience.equalsIgnoreCase("BSP")
				|| allience.equalsIgnoreCase("BSP+")) {
			bgcolor = "#0a1bed";
		} else if (allience.equalsIgnoreCase("NCP")
				|| allience.equalsIgnoreCase("NCP+")) {
			bgcolor = "#62b3de";
		}

		else if (allience.equalsIgnoreCase("CPI")
				|| allience.equalsIgnoreCase("CPI+")) {
			bgcolor = "#91191a";
		} else if (allience.equalsIgnoreCase("CPM")
				|| allience.equalsIgnoreCase("CPM+")) {
			bgcolor = "#ad0101";
		}else if (allience.equalsIgnoreCase("CPI(ML)(L)")
				|| allience.equalsIgnoreCase("CPI(ML)(L)+")) {
			bgcolor = "#9a4848";
		}else if (allience.equalsIgnoreCase("SHS")
				|| allience.equalsIgnoreCase("SHS+")) {
			bgcolor = "#602525";
		}

		else if (allience.equalsIgnoreCase("RJD")
				|| allience.equalsIgnoreCase("RJD+")) {
			bgcolor = "#42a516";
		} else if (allience.equalsIgnoreCase("SP")
				|| allience.equalsIgnoreCase("SP+")) {
			bgcolor = "#85996a";
		}

		else if (allience.equalsIgnoreCase("TDP")
				|| allience.equalsIgnoreCase("TDP+")) {
			bgcolor = "#97b9b9";
		} else if (allience.equalsIgnoreCase("LJP")
				|| allience.equalsIgnoreCase("LJP+")) {
			bgcolor = "#aa30f3";
		}

		else if (allience.equalsIgnoreCase("JD(U)")
				|| allience.equalsIgnoreCase("JD(U)")) {
			bgcolor = "#afff42";
		} else if (allience.equalsIgnoreCase("JMM")
				|| allience.equalsIgnoreCase("JMM+")) {
			bgcolor = "#939393";
		}

		else if (allience.equalsIgnoreCase("JD(S)")
				|| allience.equalsIgnoreCase("JD(S)+")) {
			bgcolor = "#2aff00";
		} 
	 else if (allience.equalsIgnoreCase(" BJD")
			|| allience.equalsIgnoreCase(" BJD+")) {
		bgcolor = "#27edb2";
	}else if (allience.equalsIgnoreCase("AIFB")
				|| allience.equalsIgnoreCase("AIFB+")) {
			bgcolor = "#ff91e7";
		}

		else if (allience.equalsIgnoreCase("TRS")
				|| allience.equalsIgnoreCase("TRS+")) {
			bgcolor = "#ffbe00";
		} else if (allience.equalsIgnoreCase("AITC")
				|| allience.equalsIgnoreCase("AITC+")) {
			bgcolor = "#7f580b";
		}else if (allience.equalsIgnoreCase("AGP")
				|| allience.equalsIgnoreCase("AGP+")) {
			bgcolor = "#c1620e";
		}
		else if (allience.equalsIgnoreCase("MUL")
				|| allience.equalsIgnoreCase("MUL")) {
			bgcolor = "#5493b2";
		} 
		else if (allience.equalsIgnoreCase("RSP")
				|| allience.equalsIgnoreCase("RSP")) {
			bgcolor = "#0ac3b8";
		} else if (allience.equalsIgnoreCase("RPI(A)")
				|| allience.equalsIgnoreCase("RPI(A)")) {
			bgcolor = "#6b3aea ";
		} 
		else if (allience.equalsIgnoreCase("MNS")
				|| allience.equalsIgnoreCase("MNS")) {
			bgcolor = "#0ac3b8";
		} 
		else if (allience.equalsIgnoreCase("RLD")
				|| allience.equalsIgnoreCase("RLD+")) {
			bgcolor = "#68ff26";
		} else if (allience.equalsIgnoreCase("INLD")
				|| allience.equalsIgnoreCase("INLD+")) {
			bgcolor = "#980b7c";
		}else if (allience.equalsIgnoreCase("SAD")
				|| allience.equalsIgnoreCase("SAD+")) {
			bgcolor = "#ffce81";
		}

		else if (allience.equalsIgnoreCase("PDP")
				|| allience.equalsIgnoreCase("PDP+")) {
			bgcolor = "#4c7013";
		}
		else if (allience.equalsIgnoreCase("PMK")
				|| allience.equalsIgnoreCase("PMK+")) {
			bgcolor = "#11718a";
		} else if (allience.equalsIgnoreCase("DMK")
				|| allience.equalsIgnoreCase("DMK+")) {
			bgcolor = "#d900e5";
		} else if (allience.equalsIgnoreCase("MDMK")
				|| allience.equalsIgnoreCase("MDMK+")) {
			bgcolor = "#818a53";
		} else if (allience.equalsIgnoreCase("NC")
				|| allience.equalsIgnoreCase("NC+")) {
			bgcolor = "#9c0548";
		} else if (allience.equalsIgnoreCase("AIADMK")
				|| allience.equalsIgnoreCase("AIADMK+")) {
			bgcolor = "#412c4b";
		}

		else {
			bgcolor = "#ff9f9f";
		}

		return bgcolor;
	}

}
