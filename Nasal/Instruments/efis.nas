# MD-11 EFIS Controller
# Copyright (c) 2023 Josh Davidson (Octal450)

var rng = 10;
var lh = 0;
var rh = 0;

var EFIS = {
	init: func() {
		me.setCptND("MAP");
		me.setFoND("MAP");
		pts.Instrumentation.Efis.Inputs.rangeNm[0].setValue(20);
		pts.Instrumentation.Efis.Inputs.rangeNm[1].setValue(20);
		pts.Instrumentation.Efis.Inputs.lhVorAdf[0].setValue(0);
		pts.Instrumentation.Efis.Inputs.lhVorAdf[1].setValue(0);
		pts.Instrumentation.Efis.Inputs.rhVorAdf[0].setValue(0);
		pts.Instrumentation.Efis.Inputs.rhVorAdf[1].setValue(0);
		pts.Instrumentation.Efis.Inputs.arpt[0].setBoolValue(0);
		pts.Instrumentation.Efis.Inputs.arpt[1].setBoolValue(0);
		pts.Instrumentation.Efis.Inputs.data[0].setBoolValue(1);
		pts.Instrumentation.Efis.Inputs.data[1].setBoolValue(1);
		pts.Instrumentation.Efis.Inputs.sta[0].setBoolValue(0);
		pts.Instrumentation.Efis.Inputs.sta[1].setBoolValue(0);
		pts.Instrumentation.Efis.Inputs.tfc[0].setBoolValue(1);
		pts.Instrumentation.Efis.Inputs.tfc[1].setBoolValue(1);
		pts.Instrumentation.Efis.Inputs.wpt[0].setBoolValue(0);
		pts.Instrumentation.Efis.Inputs.wpt[1].setBoolValue(0);
	},
	setCptND: func(m) {
		pts.Instrumentation.Efis.Mfd.displayMode[0].setValue(m);
		if (m == "MAP") {
			pts.Instrumentation.Efis.Inputs.ndCentered[0].setBoolValue(0);
		} else {
			pts.Instrumentation.Efis.Inputs.ndCentered[0].setBoolValue(1);
		}
	},
	setFoND:  func(m) {
		pts.Instrumentation.Efis.Mfd.displayMode[1].setValue(m);
		if (m == "MAP") {
			pts.Instrumentation.Efis.Inputs.ndCentered[1].setBoolValue(0);
		} else {
			pts.Instrumentation.Efis.Inputs.ndCentered[1].setBoolValue(1);
		}
	},
	setNDRange: func(n, d) {
		rng = pts.Instrumentation.Efis.Inputs.rangeNm[n].getValue();
		if (d == 1) {
			rng = rng * 2;
			if (rng > 640) {
				rng = 640;
			}
		} else if (d == -1){
			rng = rng / 2;
			if (rng < 5) {
				rng = 5;
			}
		}
		pts.Instrumentation.Efis.Inputs.rangeNm[n].setValue(rng);
	},
	setCptNDRadio: func(b) {
		lh = pts.Instrumentation.Efis.Inputs.lhVorAdf[0].getValue();
		rh = pts.Instrumentation.Efis.Inputs.rhVorAdf[0].getValue();
		
		if (b == "VOR1") {
			if (lh == 1) {
				pts.Instrumentation.Efis.Inputs.lhVorAdf[0].setValue(0);
			} else {
				pts.Instrumentation.Efis.Inputs.lhVorAdf[0].setValue(1);
			}
		} else if (b == "ADF1") {
			if (lh == -1) {
				pts.Instrumentation.Efis.Inputs.lhVorAdf[0].setValue(0);
			} else {
				pts.Instrumentation.Efis.Inputs.lhVorAdf[0].setValue(-1);
			}
		} else if (b == "VOR2") {
			if (rh == 1) {
				pts.Instrumentation.Efis.Inputs.rhVorAdf[0].setValue(0);
			} else {
				pts.Instrumentation.Efis.Inputs.rhVorAdf[0].setValue(1);
			}
		} else if (b == "ADF2") {
			if (rh == -1) {
				pts.Instrumentation.Efis.Inputs.rhVorAdf[0].setValue(0);
			} else {
				pts.Instrumentation.Efis.Inputs.rhVorAdf[0].setValue(-1);
			}
		}
	},
	setFoNDRadio: func(b) {
		lh = pts.Instrumentation.Efis.Inputs.lhVorAdf[1].getValue();
		rh = pts.Instrumentation.Efis.Inputs.rhVorAdf[1].getValue();
		
		if (b == "VOR1") {
			if (lh == 1) {
				pts.Instrumentation.Efis.Inputs.lhVorAdf[1].setValue(0);
			} else {
				pts.Instrumentation.Efis.Inputs.lhVorAdf[1].setValue(1);
			}
		} else if (b == "ADF1") {
			if (lh == -1) {
				pts.Instrumentation.Efis.Inputs.lhVorAdf[1].setValue(0);
			} else {
				pts.Instrumentation.Efis.Inputs.lhVorAdf[1].setValue(-1);
			}
		} else if (b == "VOR2") {
			if (rh == 1) {
				pts.Instrumentation.Efis.Inputs.rhVorAdf[1].setValue(0);
			} else {
				pts.Instrumentation.Efis.Inputs.rhVorAdf[1].setValue(1);
			}
		} else if (b == "ADF2") {
			if (rh == -1) {
				pts.Instrumentation.Efis.Inputs.rhVorAdf[1].setValue(0);
			} else {
				pts.Instrumentation.Efis.Inputs.rhVorAdf[1].setValue(-1);
			}
		}
	},
};
