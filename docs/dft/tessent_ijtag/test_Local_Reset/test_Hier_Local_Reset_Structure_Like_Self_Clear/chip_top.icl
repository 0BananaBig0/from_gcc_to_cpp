Module chip {
   ResetPort ijtag_reset {
      ActivePolarity 0;
      Attribute connection_rule_option = "allowed_no_source";
   }
   TCKPort ijtag_tck;
   ScanInPort ijtag_si;
   ScanOutPort ijtag_so {
      Source SIB_TOP.ijtag_so;
   }
   SelectPort ijtag_sel;
   ShiftEnPort ijtag_se;
   UpdateEnPort ijtag_ue;
   CaptureEnPort ijtag_ce;
   DataOutPort EN[11:0] {
      Source Block_1.EN[5:0], Block_2.EN[5:0];
   }
   Instance TDR_TOP_RESET Of RESET_TDR {
      InputPort ijtag_tck = ijtag_tck;
      InputPort ijtag_si = ijtag_si;
      InputPort ijtag_sel = ijtag_sel;
      InputPort ijtag_se = ijtag_se;
      InputPort ijtag_ce = ijtag_ce;
      InputPort ijtag_ue = ijtag_ue;
      InputPort ijtag_reset = ijtag_reset;
   }
   Instance SIB_TOP Of SIB {
      InputPort ijtag_tck = ijtag_tck;
      InputPort ijtag_si = TDR_TOP_RESET.ijtag_so;
      InputPort ijtag_from_so = Block_2.ijtag_so;
      InputPort ijtag_sel = ijtag_sel;
      InputPort ijtag_se = ijtag_se;
      InputPort ijtag_ce = ijtag_ce;
      InputPort ijtag_ue = ijtag_ue;
      InputPort ijtag_reset = TDR_TOP_RESET.ijtag_to_reset;
   }
   Instance Block_1 Of Block {
      InputPort ijtag_tck = ijtag_tck;
      InputPort ijtag_si = TDR_TOP_RESET.ijtag_so;
      InputPort ijtag_sel = SIB_TOP.ijtag_to_sel;
      InputPort ijtag_se = ijtag_se;
      InputPort ijtag_ce = ijtag_ce;
      InputPort ijtag_ue = ijtag_ue;
      InputPort ijtag_reset = TDR_TOP_RESET.ijtag_to_reset;
   }
   Instance Block_2 Of Block {
      InputPort ijtag_tck = ijtag_tck;
      InputPort ijtag_si = Block_1.ijtag_so;
      InputPort ijtag_sel = SIB_TOP.ijtag_to_sel;
      InputPort ijtag_se = ijtag_se;
      InputPort ijtag_ce = ijtag_ce;
      InputPort ijtag_ue = ijtag_ue;
      InputPort ijtag_reset = TDR_TOP_RESET.ijtag_to_reset;
   }
}

Module Block {
   ResetPort ijtag_reset {
      ActivePolarity 0;
      Attribute connection_rule_option = "allowed_no_source";
   }
   TCKPort ijtag_tck;
   ScanInPort ijtag_si;
   ScanOutPort ijtag_so {
      Source SIB_1.ijtag_so;
   }
   SelectPort ijtag_sel;
   ShiftEnPort ijtag_se;
   UpdateEnPort ijtag_ue;
   CaptureEnPort ijtag_ce;
   DataOutPort EN[5:0] {
      Source TDR_2.EN[2:0], TDR_3.EN[2:0];
   }
   Instance TDR_1_RESET Of RESET_TDR {
      InputPort ijtag_tck = ijtag_tck;
      InputPort ijtag_si = ijtag_si;
      InputPort ijtag_sel = ijtag_sel;
      InputPort ijtag_se = ijtag_se;
      InputPort ijtag_ce = ijtag_ce;
      InputPort ijtag_ue = ijtag_ue;
      InputPort ijtag_reset = ijtag_reset;
   }
   Instance SIB_1 Of SIB {
      InputPort ijtag_tck = ijtag_tck;
      InputPort ijtag_si = TDR_1_RESET.ijtag_so;
      InputPort ijtag_from_so = SIB_2.ijtag_so;
      InputPort ijtag_sel = ijtag_sel;
      InputPort ijtag_se = ijtag_se;
      InputPort ijtag_ce = ijtag_ce;
      InputPort ijtag_ue = ijtag_ue;
      InputPort ijtag_reset = ijtag_reset;
   }
   Instance TDR_2 Of TDR {
      InputPort ijtag_tck = ijtag_tck;
      InputPort ijtag_si = TDR_1_RESET.ijtag_so;
      InputPort ijtag_sel = SIB_1.ijtag_to_sel;
      InputPort ijtag_se = ijtag_se;
      InputPort ijtag_ce = ijtag_ce;
      InputPort ijtag_ue = ijtag_ue;
      InputPort ijtag_reset = TDR_1_RESET.ijtag_to_reset;
      InputPort Temp = Sensor_3.Temp;
   }
   Instance SIB_2 Of SIB {
      InputPort ijtag_tck = ijtag_tck;
      InputPort ijtag_si = TDR_2.ijtag_so;
      InputPort ijtag_from_so = TDR_3.ijtag_so;
      InputPort ijtag_sel = SIB_1.ijtag_to_sel;
      InputPort ijtag_se = ijtag_se;
      InputPort ijtag_ce = ijtag_ce;
      InputPort ijtag_ue = ijtag_ue;
      InputPort ijtag_reset = TDR_1_RESET.ijtag_to_reset;
   }
   Instance TDR_3 Of TDR {
      InputPort ijtag_tck = ijtag_tck;
      InputPort ijtag_si = TDR_2.ijtag_so;
      InputPort ijtag_sel = SIB_2.ijtag_to_sel;
      InputPort ijtag_se = ijtag_se;
      InputPort ijtag_ce = ijtag_ce;
      InputPort ijtag_ue = ijtag_ue;
      InputPort ijtag_reset = TDR_1_RESET.ijtag_to_reset;
      InputPort Temp = Sensor_4.Temp;
   }
   Instance Sensor_3 Of Sensor {
      InputPort ijtag_tck = ijtag_tck;
      InputPort EN = TDR_2.EN;
   }
   Instance Sensor_4 Of Sensor {
      InputPort ijtag_tck = ijtag_tck;
      InputPort EN = TDR_3.EN;
   }

}

Module RESET_TDR {
   ResetPort ijtag_reset {
      ActivePolarity 0;
      Attribute connection_rule_option = "allowed_no_source";
   }
   SelectPort ijtag_sel;
   TCKPort ijtag_tck;
   ScanInPort ijtag_si;
   ScanOutPort ijtag_so {
      Source tdr.ijtag_so;
      Attribute connection_rule_option = "allowed_no_destination";
   }
   ShiftEnPort ijtag_se;
   UpdateEnPort ijtag_ue;
   CaptureEnPort ijtag_ce;
   ToResetPort ijtag_to_reset {
      Source reset_mux;
      ActivePolarity 0;
      Attribute connection_rule_option = "allowed_no_destination";
   }
   Instance tdr Of TDR_FOR_RESET {
      InputPort ijtag_tck = ijtag_tck;
      InputPort ijtag_si = ijtag_si;
      InputPort ijtag_sel = ijtag_sel;
      InputPort ijtag_se = ijtag_se;
      InputPort ijtag_ce = ijtag_ce;
      InputPort ijtag_ue = ijtag_ue;
      InputPort ijtag_reset = ijtag_reset;
   }
   DataMux reset_mux SelectedBy tdr.EN[0] {
      1'b0 : ijtag_reset;
      1'b1 : tdr.EN[1];
   }
}

Module TDR_FOR_RESET {
   ResetPort ijtag_reset {
      ActivePolarity 0;
      Attribute connection_rule_option = "allowed_no_source";
   }
   SelectPort ijtag_sel;
   TCKPort ijtag_tck;
   ScanInPort ijtag_si;
   ScanOutPort ijtag_so {
      Source tdr[0];
   }
   ShiftEnPort ijtag_se;
   UpdateEnPort ijtag_ue;
   CaptureEnPort ijtag_ce;
   DataOutPort EN[1:0] {
      Source tdr[1:0];
      Attribute connection_rule_option = "allowed_no_destination";
   }
   ScanRegister tdr[1:0] {
      ScanInSource ijtag_si;
      CaptureSource tdr[1:0];
      ResetValue 2'b10;
   }
}

Module TDR {
   ResetPort ijtag_reset {
      ActivePolarity 0;
      Attribute connection_rule_option = "allowed_no_source";
   }
   SelectPort ijtag_sel;
   TCKPort ijtag_tck;
   ScanInPort ijtag_si;
   ScanOutPort ijtag_so {
      Source tdr[0];
   }
   ShiftEnPort ijtag_se;
   UpdateEnPort ijtag_ue;
   CaptureEnPort ijtag_ce;
   DataInPort Temp[5:0] {
      Attribute connection_rule_option = "allowed_no_source";
   }
   DataOutPort EN[2:0] {
      Source tdr[2:0];
      Attribute connection_rule_option = "allowed_no_destination";
   }
   ScanRegister tdr[8:0] {
      ScanInSource ijtag_si;
      CaptureSource Temp, tdr[2:0];
      ResetValue 9'b000000000;
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

Module Sensor {
   TCKPort ijtag_tck;
   DataInPort EN[2:0];
   DataOutPort Temp[5:0];
}
