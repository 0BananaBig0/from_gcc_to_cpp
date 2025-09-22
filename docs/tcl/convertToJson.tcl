#!/usr/bin/env tclsh
# ############################################################################ #
# #                       File Name: convertToJson.tcl                       # #
# #                          Author: Huaxiao Liang                           # #
# #                         Mail: hxliang666@qq.com                          # #
# #                         09/22/2025-Mon-22:20:50                          # #
# ############################################################################ #

package require json

proc convert_to_json {data output_file} {
    # Check if the data is a dictionary
    if {[catch {dict size $data} err] == 0} {
        # Data is a dictionary
        set json_data [::json::dict2json $data]
    } else {
        # Data is not a dictionary - treat as list
        set json_data [::json::list2json $data]
    }

    # Write JSON to file
    set fd [open $output_file w]
    puts $fd $json_data
    close $fd

    return $json_data
}

# Example usage:
set my_dict {
    name "John Doe"
    age 30
    skills {Tcl Python JavaScript}
}

set my_list {apple banana cherry 42}

# Convert dictionary to JSON
convert_to_json $my_dict "output_dict.json"

# Convert list to JSON
convert_to_json $my_list "output_list.json"
