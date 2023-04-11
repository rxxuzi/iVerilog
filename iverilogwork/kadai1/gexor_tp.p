#! /usr/local/iverilog/bin/vvp
:ivl_version "11.0 (devel)" "(s20150603-642-g3bdb50da)";
:ivl_delay_selection "TYPICAL";
:vpi_time_precision - 9;
:vpi_module "system";
:vpi_module "vhdl_sys";
:vpi_module "vhdl_textio";
:vpi_module "v2005_math";
:vpi_module "va_math";
S_0000000000aeee20 .scope module, "gexor_tp" "gexor_tp" 2 3;
 .timescale -9 -9;
P_0000000000aebd90 .param/l "STEP" 0 2 6, +C4<00000000000000000000000001100100>;
v0000000000ae6b00_0 .var "a", 0 0;
v0000000000ae6ba0_0 .var "b", 0 0;
v0000000000ae6c40_0 .net "c", 0 0, L_0000000000ae7160;  1 drivers
S_0000000000aeea80 .scope module, "gexor" "gexor" 2 8, 3 1 0, S_0000000000aeee20;
 .timescale 0 0;
    .port_info 0 /INPUT 1 "a";
    .port_info 1 /INPUT 1 "b";
    .port_info 2 /OUTPUT 1 "c";
L_0000000000ae7160 .functor XOR 1, v0000000000ae6b00_0, v0000000000ae6ba0_0, C4<0>, C4<0>;
v0000000000ae6920_0 .net "a", 0 0, v0000000000ae6b00_0;  1 drivers
v0000000000ae69c0_0 .net "b", 0 0, v0000000000ae6ba0_0;  1 drivers
v0000000000ae6a60_0 .net "c", 0 0, L_0000000000ae7160;  alias, 1 drivers
    .scope S_0000000000aeee20;
T_0 ;
    %vpi_call 2 11 "$dumpfile", "gexor_tp.vcd" {0 0 0};
    %vpi_call 2 12 "$dumpvars", 32'sb00000000000000000000000000000000, S_0000000000aeee20 {0 0 0};
    %pushi/vec4 0, 0, 1;
    %store/vec4 v0000000000ae6b00_0, 0, 1;
    %pushi/vec4 0, 0, 1;
    %store/vec4 v0000000000ae6ba0_0, 0, 1;
    %delay 100, 0;
    %pushi/vec4 0, 0, 1;
    %store/vec4 v0000000000ae6b00_0, 0, 1;
    %pushi/vec4 1, 0, 1;
    %store/vec4 v0000000000ae6ba0_0, 0, 1;
    %delay 100, 0;
    %pushi/vec4 1, 0, 1;
    %store/vec4 v0000000000ae6b00_0, 0, 1;
    %pushi/vec4 0, 0, 1;
    %store/vec4 v0000000000ae6ba0_0, 0, 1;
    %delay 100, 0;
    %pushi/vec4 1, 0, 1;
    %store/vec4 v0000000000ae6b00_0, 0, 1;
    %pushi/vec4 1, 0, 1;
    %store/vec4 v0000000000ae6ba0_0, 0, 1;
    %delay 100, 0;
    %pushi/vec4 0, 0, 1;
    %store/vec4 v0000000000ae6b00_0, 0, 1;
    %pushi/vec4 0, 0, 1;
    %store/vec4 v0000000000ae6ba0_0, 0, 1;
    %delay 100, 0;
    %vpi_call 2 19 "$finish" {0 0 0};
    %end;
    .thread T_0;
    .scope S_0000000000aeee20;
T_1 ;
    %vpi_call 2 22 "$monitor", $stime, "a=%b b=%b c=%b", v0000000000ae6b00_0, v0000000000ae6ba0_0, v0000000000ae6c40_0 {0 0 0};
    %end;
    .thread T_1;
# The file index is used to find the file name in the following table.
:file_names 4;
    "N/A";
    "<interactive>";
    "gexor_tp.v";
    "gexor.v";
