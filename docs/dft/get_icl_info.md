```TCL
set_context patterns -silicon_insight
read_icl icl_file_path
set_current_design module_name
report_icl_network -node_type all
```
1, report_icl_network -node_type all/sib/scanmux/scanreg/port
    1) Behavior:
        •Reports all nodes in a flattened netlist for the specified hierarchy (e.g., chip_top)
        •Displays hierarchical names using dot notation for path separation
    2) Node Type Definitions:
        •Terminal: Nodes with inputs tied to constant values (VDD/GND)
        •Port: ScanInPort/ScanOutPort
        •ScanReg: ScanRegister
        •ScanMux: ScanMux
        •SIB: SIB modules meeting these criteria:
            •Instance input ports not tied to constant values
            •Always contains a ScanMux component as its a suffiex of the report result.

2, get_icl_module -of_instances instance_name
   get_icl_ports -of_modules module_name -direction input/output pattern
    1) Behavior:
        •Returns module information for specified instances
        •Reports ports without hierarchical path information
        •Supports pattern matching for port names (wildcards allowed)
        •Direction filter accepts "input", "output", or omitting for all directions

3, get_icl_pins -of_instances instance_name -direction input/output pattern
    Behavior:
        •Reports pins/ports with full hierarchical path information
        •Maintains complete instance hierarchy in returned names
        •Supports direction filtering and pattern matching like get_icl_ports

4, get_icl_instances -filter "attr_name==attr_value"
    Behavior:
        •Reports an instance list meet the requirement "attr_name==attr_value".

5, get_icl_modules -of_instances inst_name -filter "attr_name==attr_value"
    Behavior:
        •Reports a module related to inst_name.

6, report_attributes {inst_name1 inst_name2 ... inst_name1.port1 inst_name1.port2 ...}
    Behavior:
        •Reports all attributes for {inst_name1 inst_name2 ... inst_name1.port1 inst_name1.port2 ...}.

7, get_attribute_list {inst_name1 inst_name2 ... inst_name1.port1 inst_name1.port2 ...} {inst_name1 inst_name2 ... inst_name1.port1 inst_name1.port2 ...}
    Behavior:
        •Reports all attributes' names for {inst_name1 inst_name2 ... inst_name1.port1 inst_name1.port2 ...}.

8, get_attribute_value_list {inst_name1 inst_name2 ... inst_name1.port1 inst_name1.port2 ...} {inst_name1 inst_name2 ... inst_name1.port1 inst_name1.port2 ...} -name attr_name
    Behavior:
        •Reports all attributes' values of attr_name for {inst_name1 inst_name2 ... inst_name1.port1 inst_name1.port2 ...}.

9, Special objects:
    1, TDR;
    2, SIB;
    3, TAP Controller;
    4, DMA;
    5, MBIST;
    6, LBIST;
