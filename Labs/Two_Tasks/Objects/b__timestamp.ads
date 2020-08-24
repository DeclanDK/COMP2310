pragma Warnings (Off);
pragma Ada_95;
with System;
with System.Parameters;
with System.Secondary_Stack;
package ada_main is

   gnat_argc : Integer;
   gnat_argv : System.Address;
   gnat_envp : System.Address;

   pragma Import (C, gnat_argc);
   pragma Import (C, gnat_argv);
   pragma Import (C, gnat_envp);

   gnat_exit_status : Integer;
   pragma Import (C, gnat_exit_status);

   GNAT_Version : constant String :=
                    "GNAT Version: Community 2019 (20190517-83)" & ASCII.NUL;
   pragma Export (C, GNAT_Version, "__gnat_version");

   Ada_Main_Program_Name : constant String := "_ada_timestamp" & ASCII.NUL;
   pragma Export (C, Ada_Main_Program_Name, "__gnat_ada_main_program_name");

   procedure adainit;
   pragma Export (C, adainit, "adainit");

   procedure adafinal;
   pragma Export (C, adafinal, "adafinal");

   function main
     (argc : Integer;
      argv : System.Address;
      envp : System.Address)
      return Integer;
   pragma Export (C, main, "main");

   type Version_32 is mod 2 ** 32;
   u00001 : constant Version_32 := 16#cfdda645#;
   pragma Export (C, u00001, "timestampB");
   u00002 : constant Version_32 := 16#050ff2f0#;
   pragma Export (C, u00002, "system__standard_libraryB");
   u00003 : constant Version_32 := 16#0f7d71d4#;
   pragma Export (C, u00003, "system__standard_libraryS");
   u00004 : constant Version_32 := 16#76789da1#;
   pragma Export (C, u00004, "adaS");
   u00005 : constant Version_32 := 16#fc54e290#;
   pragma Export (C, u00005, "ada__calendarB");
   u00006 : constant Version_32 := 16#31350a81#;
   pragma Export (C, u00006, "ada__calendarS");
   u00007 : constant Version_32 := 16#d90c4a0d#;
   pragma Export (C, u00007, "ada__exceptionsB");
   u00008 : constant Version_32 := 16#16307b94#;
   pragma Export (C, u00008, "ada__exceptionsS");
   u00009 : constant Version_32 := 16#5726abed#;
   pragma Export (C, u00009, "ada__exceptions__last_chance_handlerB");
   u00010 : constant Version_32 := 16#41e5552e#;
   pragma Export (C, u00010, "ada__exceptions__last_chance_handlerS");
   u00011 : constant Version_32 := 16#085b6ffb#;
   pragma Export (C, u00011, "systemS");
   u00012 : constant Version_32 := 16#ae860117#;
   pragma Export (C, u00012, "system__soft_linksB");
   u00013 : constant Version_32 := 16#4d58644d#;
   pragma Export (C, u00013, "system__soft_linksS");
   u00014 : constant Version_32 := 16#bd45c2cc#;
   pragma Export (C, u00014, "system__secondary_stackB");
   u00015 : constant Version_32 := 16#4dcf97e2#;
   pragma Export (C, u00015, "system__secondary_stackS");
   u00016 : constant Version_32 := 16#86dbf443#;
   pragma Export (C, u00016, "system__parametersB");
   u00017 : constant Version_32 := 16#40b73bd0#;
   pragma Export (C, u00017, "system__parametersS");
   u00018 : constant Version_32 := 16#ced09590#;
   pragma Export (C, u00018, "system__storage_elementsB");
   u00019 : constant Version_32 := 16#259825ff#;
   pragma Export (C, u00019, "system__storage_elementsS");
   u00020 : constant Version_32 := 16#75bf515c#;
   pragma Export (C, u00020, "system__soft_links__initializeB");
   u00021 : constant Version_32 := 16#5697fc2b#;
   pragma Export (C, u00021, "system__soft_links__initializeS");
   u00022 : constant Version_32 := 16#41837d1e#;
   pragma Export (C, u00022, "system__stack_checkingB");
   u00023 : constant Version_32 := 16#86e40413#;
   pragma Export (C, u00023, "system__stack_checkingS");
   u00024 : constant Version_32 := 16#34742901#;
   pragma Export (C, u00024, "system__exception_tableB");
   u00025 : constant Version_32 := 16#55f506b9#;
   pragma Export (C, u00025, "system__exception_tableS");
   u00026 : constant Version_32 := 16#ce4af020#;
   pragma Export (C, u00026, "system__exceptionsB");
   u00027 : constant Version_32 := 16#6038020d#;
   pragma Export (C, u00027, "system__exceptionsS");
   u00028 : constant Version_32 := 16#69416224#;
   pragma Export (C, u00028, "system__exceptions__machineB");
   u00029 : constant Version_32 := 16#d27d9682#;
   pragma Export (C, u00029, "system__exceptions__machineS");
   u00030 : constant Version_32 := 16#aa0563fc#;
   pragma Export (C, u00030, "system__exceptions_debugB");
   u00031 : constant Version_32 := 16#76d1963f#;
   pragma Export (C, u00031, "system__exceptions_debugS");
   u00032 : constant Version_32 := 16#6c2f8802#;
   pragma Export (C, u00032, "system__img_intB");
   u00033 : constant Version_32 := 16#0a808f39#;
   pragma Export (C, u00033, "system__img_intS");
   u00034 : constant Version_32 := 16#39df8c17#;
   pragma Export (C, u00034, "system__tracebackB");
   u00035 : constant Version_32 := 16#5679b13f#;
   pragma Export (C, u00035, "system__tracebackS");
   u00036 : constant Version_32 := 16#9ed49525#;
   pragma Export (C, u00036, "system__traceback_entriesB");
   u00037 : constant Version_32 := 16#0800998b#;
   pragma Export (C, u00037, "system__traceback_entriesS");
   u00038 : constant Version_32 := 16#bb296fbb#;
   pragma Export (C, u00038, "system__traceback__symbolicB");
   u00039 : constant Version_32 := 16#c84061d1#;
   pragma Export (C, u00039, "system__traceback__symbolicS");
   u00040 : constant Version_32 := 16#701f9d88#;
   pragma Export (C, u00040, "ada__exceptions__tracebackB");
   u00041 : constant Version_32 := 16#20245e75#;
   pragma Export (C, u00041, "ada__exceptions__tracebackS");
   u00042 : constant Version_32 := 16#a0d3d22b#;
   pragma Export (C, u00042, "system__address_imageB");
   u00043 : constant Version_32 := 16#a9b7f2c1#;
   pragma Export (C, u00043, "system__address_imageS");
   u00044 : constant Version_32 := 16#8c33a517#;
   pragma Export (C, u00044, "system__wch_conB");
   u00045 : constant Version_32 := 16#13264d29#;
   pragma Export (C, u00045, "system__wch_conS");
   u00046 : constant Version_32 := 16#9721e840#;
   pragma Export (C, u00046, "system__wch_stwB");
   u00047 : constant Version_32 := 16#3e376128#;
   pragma Export (C, u00047, "system__wch_stwS");
   u00048 : constant Version_32 := 16#a831679c#;
   pragma Export (C, u00048, "system__wch_cnvB");
   u00049 : constant Version_32 := 16#1c91f7da#;
   pragma Export (C, u00049, "system__wch_cnvS");
   u00050 : constant Version_32 := 16#5ab55268#;
   pragma Export (C, u00050, "interfacesS");
   u00051 : constant Version_32 := 16#ece6fdb6#;
   pragma Export (C, u00051, "system__wch_jisB");
   u00052 : constant Version_32 := 16#9ce1eefb#;
   pragma Export (C, u00052, "system__wch_jisS");
   u00053 : constant Version_32 := 16#769e25e6#;
   pragma Export (C, u00053, "interfaces__cB");
   u00054 : constant Version_32 := 16#467817d8#;
   pragma Export (C, u00054, "interfaces__cS");
   u00055 : constant Version_32 := 16#2b2125d3#;
   pragma Export (C, u00055, "system__os_primitivesB");
   u00056 : constant Version_32 := 16#0fa60a0d#;
   pragma Export (C, u00056, "system__os_primitivesS");
   u00057 : constant Version_32 := 16#357666d8#;
   pragma Export (C, u00057, "ada__calendar__delaysB");
   u00058 : constant Version_32 := 16#d86d2f1d#;
   pragma Export (C, u00058, "ada__calendar__delaysS");
   u00059 : constant Version_32 := 16#f4e097a7#;
   pragma Export (C, u00059, "ada__text_ioB");
   u00060 : constant Version_32 := 16#3913d0d6#;
   pragma Export (C, u00060, "ada__text_ioS");
   u00061 : constant Version_32 := 16#10558b11#;
   pragma Export (C, u00061, "ada__streamsB");
   u00062 : constant Version_32 := 16#67e31212#;
   pragma Export (C, u00062, "ada__streamsS");
   u00063 : constant Version_32 := 16#92d882c5#;
   pragma Export (C, u00063, "ada__io_exceptionsS");
   u00064 : constant Version_32 := 16#d398a95f#;
   pragma Export (C, u00064, "ada__tagsB");
   u00065 : constant Version_32 := 16#12a0afb8#;
   pragma Export (C, u00065, "ada__tagsS");
   u00066 : constant Version_32 := 16#796f31f1#;
   pragma Export (C, u00066, "system__htableB");
   u00067 : constant Version_32 := 16#8c99dc11#;
   pragma Export (C, u00067, "system__htableS");
   u00068 : constant Version_32 := 16#089f5cd0#;
   pragma Export (C, u00068, "system__string_hashB");
   u00069 : constant Version_32 := 16#2ec7b76f#;
   pragma Export (C, u00069, "system__string_hashS");
   u00070 : constant Version_32 := 16#3cdd1378#;
   pragma Export (C, u00070, "system__unsigned_typesS");
   u00071 : constant Version_32 := 16#b8e72903#;
   pragma Export (C, u00071, "system__val_lluB");
   u00072 : constant Version_32 := 16#51139e9a#;
   pragma Export (C, u00072, "system__val_lluS");
   u00073 : constant Version_32 := 16#269742a9#;
   pragma Export (C, u00073, "system__val_utilB");
   u00074 : constant Version_32 := 16#a4fbd905#;
   pragma Export (C, u00074, "system__val_utilS");
   u00075 : constant Version_32 := 16#ec4d5631#;
   pragma Export (C, u00075, "system__case_utilB");
   u00076 : constant Version_32 := 16#378ed9af#;
   pragma Export (C, u00076, "system__case_utilS");
   u00077 : constant Version_32 := 16#73d2d764#;
   pragma Export (C, u00077, "interfaces__c_streamsB");
   u00078 : constant Version_32 := 16#b1330297#;
   pragma Export (C, u00078, "interfaces__c_streamsS");
   u00079 : constant Version_32 := 16#4e0ce0a1#;
   pragma Export (C, u00079, "system__crtlS");
   u00080 : constant Version_32 := 16#ec083f01#;
   pragma Export (C, u00080, "system__file_ioB");
   u00081 : constant Version_32 := 16#af2a8e9e#;
   pragma Export (C, u00081, "system__file_ioS");
   u00082 : constant Version_32 := 16#86c56e5a#;
   pragma Export (C, u00082, "ada__finalizationS");
   u00083 : constant Version_32 := 16#95817ed8#;
   pragma Export (C, u00083, "system__finalization_rootB");
   u00084 : constant Version_32 := 16#47a91c6b#;
   pragma Export (C, u00084, "system__finalization_rootS");
   u00085 : constant Version_32 := 16#e4774a28#;
   pragma Export (C, u00085, "system__os_libB");
   u00086 : constant Version_32 := 16#d8e681fb#;
   pragma Export (C, u00086, "system__os_libS");
   u00087 : constant Version_32 := 16#2a8e89ad#;
   pragma Export (C, u00087, "system__stringsB");
   u00088 : constant Version_32 := 16#684d436e#;
   pragma Export (C, u00088, "system__stringsS");
   u00089 : constant Version_32 := 16#f5c4f553#;
   pragma Export (C, u00089, "system__file_control_blockS");
   u00090 : constant Version_32 := 16#fd83e873#;
   pragma Export (C, u00090, "system__concat_2B");
   u00091 : constant Version_32 := 16#0afbb82b#;
   pragma Export (C, u00091, "system__concat_2S");
   u00092 : constant Version_32 := 16#276453b7#;
   pragma Export (C, u00092, "system__img_lldB");
   u00093 : constant Version_32 := 16#fb796692#;
   pragma Export (C, u00093, "system__img_lldS");
   u00094 : constant Version_32 := 16#bd3715ff#;
   pragma Export (C, u00094, "system__img_decB");
   u00095 : constant Version_32 := 16#a6766620#;
   pragma Export (C, u00095, "system__img_decS");
   u00096 : constant Version_32 := 16#9dca6636#;
   pragma Export (C, u00096, "system__img_lliB");
   u00097 : constant Version_32 := 16#19143a2a#;
   pragma Export (C, u00097, "system__img_lliS");
   u00098 : constant Version_32 := 16#e31b7c4e#;
   pragma Export (C, u00098, "system__memoryB");
   u00099 : constant Version_32 := 16#512609cf#;
   pragma Export (C, u00099, "system__memoryS");

   --  BEGIN ELABORATION ORDER
   --  ada%s
   --  interfaces%s
   --  system%s
   --  system.img_int%s
   --  system.img_int%b
   --  system.img_dec%s
   --  system.img_dec%b
   --  system.img_lli%s
   --  system.img_lli%b
   --  system.img_lld%s
   --  system.img_lld%b
   --  system.os_primitives%s
   --  system.os_primitives%b
   --  system.parameters%s
   --  system.parameters%b
   --  system.crtl%s
   --  interfaces.c_streams%s
   --  interfaces.c_streams%b
   --  system.storage_elements%s
   --  system.storage_elements%b
   --  system.stack_checking%s
   --  system.stack_checking%b
   --  system.string_hash%s
   --  system.string_hash%b
   --  system.htable%s
   --  system.htable%b
   --  system.strings%s
   --  system.strings%b
   --  system.traceback_entries%s
   --  system.traceback_entries%b
   --  system.unsigned_types%s
   --  system.wch_con%s
   --  system.wch_con%b
   --  system.wch_jis%s
   --  system.wch_jis%b
   --  system.wch_cnv%s
   --  system.wch_cnv%b
   --  system.concat_2%s
   --  system.concat_2%b
   --  system.traceback%s
   --  system.traceback%b
   --  system.secondary_stack%s
   --  system.standard_library%s
   --  ada.exceptions%s
   --  system.exceptions_debug%s
   --  system.exceptions_debug%b
   --  system.soft_links%s
   --  system.wch_stw%s
   --  system.wch_stw%b
   --  ada.exceptions.last_chance_handler%s
   --  ada.exceptions.last_chance_handler%b
   --  ada.exceptions.traceback%s
   --  ada.exceptions.traceback%b
   --  system.address_image%s
   --  system.address_image%b
   --  system.exception_table%s
   --  system.exception_table%b
   --  system.exceptions%s
   --  system.exceptions%b
   --  system.exceptions.machine%s
   --  system.exceptions.machine%b
   --  system.memory%s
   --  system.memory%b
   --  system.secondary_stack%b
   --  system.soft_links.initialize%s
   --  system.soft_links.initialize%b
   --  system.soft_links%b
   --  system.standard_library%b
   --  system.traceback.symbolic%s
   --  system.traceback.symbolic%b
   --  ada.exceptions%b
   --  ada.io_exceptions%s
   --  interfaces.c%s
   --  interfaces.c%b
   --  system.case_util%s
   --  system.case_util%b
   --  system.os_lib%s
   --  system.os_lib%b
   --  system.val_util%s
   --  system.val_util%b
   --  system.val_llu%s
   --  system.val_llu%b
   --  ada.tags%s
   --  ada.tags%b
   --  ada.streams%s
   --  ada.streams%b
   --  system.file_control_block%s
   --  system.finalization_root%s
   --  system.finalization_root%b
   --  ada.finalization%s
   --  system.file_io%s
   --  system.file_io%b
   --  ada.calendar%s
   --  ada.calendar%b
   --  ada.calendar.delays%s
   --  ada.calendar.delays%b
   --  ada.text_io%s
   --  ada.text_io%b
   --  timestamp%b
   --  END ELABORATION ORDER

end ada_main;