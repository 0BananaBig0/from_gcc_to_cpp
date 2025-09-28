Module Sensor {
   TCKPort tck;
   DataInPort En;
   DataOutPort Temp[5:0];
}

Module TDR {
   ResetPort reset {
      ActivePolarity 0;
      Attribute connection_rule_option = "allowed_no_source";
   }
   SelectPort en;
   TCKPort tck;
   ScanInPort si;
   ScanOutPort so {
      Source EN_reg;
   }
   ShiftEnPort se;
   UpdateEnPort ue;
   CaptureEnPort ce;
   DataInPort Temp[5:0];
   DataOutPort En {
      Source EN_reg;
   }
   ScanRegister SR[5:0] {
      ScanInSource si;
      CaptureSource Temp;
   }
   ScanRegister EN_reg {
      ScanInSource SR[0];
   }
}

Module SIB {
   ResetPort ijtag_reset {
      ActivePolarity 0;
      Attribute connection_rule_option = "allowed_no_source";
   }
   SelectPort ijtag_sel;
   ScanInPort ijtag_si;
   CaptureEnPort ijtag_ce;
   ShiftEnPort ijtag_se;
   UpdateEnPort ijtag_ue;
   TCKPort ijtag_tck;
   ScanOutPort ijtag_so {
      Source sib;
   }
   ToSelectPort ijtag_to_sel {
      Attribute connection_rule_option = "allowed_no_destination";
   }
   ScanInPort ijtag_from_so {
      Attribute connection_rule_option = "allowed_no_source";
   }
   ScanInterface client {
      Port ijtag_si;
      Port ijtag_so;
      Port ijtag_sel;
      Port ijtag_tck;
      Port ijtag_reset;
      Port ijtag_se;
      Port ijtag_ce;
      Port ijtag_ue;
   }
   ScanInterface host {
      Port ijtag_from_so;
      Port ijtag_to_sel;
   }
   ScanRegister sib {
      ScanInSource scan_in_mux;
      CaptureSource 1'b0;
      ResetValue 1'b0;
   }
   ScanMux scan_in_mux SelectedBy sib {
      1'b0 : ijtag_si;
      1'b1 : ijtag_from_so;
   }
}

Module chip {
   TCKPort TCK;
   ScanInPort TDI;
   ScanOutPort TDO {
      Source SIB_2.ijtag_so;
   }
   SelectPort sel;
   ShiftEnPort shift_en;
   UpdateEnPort update_en;
   CaptureEnPort capture_en;
   Instance SIB_1 Of SIB {
      InputPort ijtag_si = TDI;
      InputPort ijtag_from_so = TDR_1.so;
      InputPort ijtag_sel = sel;
      InputPort ijtag_tck = TCK;
      InputPort ijtag_se = shift_en;
      InputPort ijtag_ce = capture_en;
      InputPort ijtag_ue = update_en;
   }
   Instance SIB_2 Of SIB {
      InputPort ijtag_si = SIB_1.ijtag_so;
      InputPort ijtag_from_so = TDR_2.so;
      InputPort ijtag_sel = sel;
      InputPort ijtag_tck = TCK;
      InputPort ijtag_se = shift_en;
      InputPort ijtag_ce = capture_en;
      InputPort ijtag_ue = update_en;
   }
   Instance TDR_1 Of TDR {
      InputPort tck = TCK;
      InputPort si = TDI;
      InputPort en = SIB_1.ijtag_to_sel;
      InputPort Temp = Sensor_1.Temp;
      InputPort se = shift_en;
      InputPort ce = capture_en;
      InputPort ue = update_en;
   }
   Instance TDR_2 Of TDR {
      InputPort tck = TCK;
      InputPort si = SIB_1.ijtag_so;
      InputPort en = SIB_2.ijtag_to_sel;
      InputPort Temp = Sensor_2.Temp;
      InputPort se = shift_en;
      InputPort ce = capture_en;
      InputPort ue = update_en;
   }
   Instance Sensor_1 Of Sensor {
      InputPort tck = TCK;
      InputPort En = TDR_1.En;
   }
   Instance Sensor_2 Of Sensor {
      InputPort tck = TCK;
      InputPort En = TDR_2.En;
   }
}
