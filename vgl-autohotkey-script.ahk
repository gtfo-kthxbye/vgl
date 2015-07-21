;--------------------------------------------
;---------------Syntax helpers---------------
;--------------------------------------------
return
;file header
:*:VHEAD::
SendInput {Raw}{**************************************************************
SendInput {ENTER}
SendInput {Raw}* Author: MA. 
SendInput {ENTER}
SendInput {Raw}* Description: 
SendInput {ENTER}
SendInput {Raw}**************************************************************}
Send {Up}{Space}
return

;program skeleton
:*:VPROG::
SendInput {Raw}SET COMPILE_OPTION DECLARE
SendInput {ENTER}
SendInput {Raw}ENABLE WINDOWS
SendInput {ENTER}
SendInput {Raw}SET NAME "DEFER/"
SendInput {ENTER}
SendInput {Raw}JOIN LIBRARY $lib_utils
SendInput {ENTER}
SendInput {Raw}JOIN STANDARD_LIBRARY STD_PROMPT
SendInput {ENTER}{ENTER}
SendInput {Raw}main ()
SendInput {ENTER}
SendInput {Raw}EXIT
SendInput {ENTER}{ENTER}
SendInput {Raw}ROUTINE main
SendInput {ENTER}{ENTER}
SendInput {Raw}ENDROUTINE
SendInput {UP}
return

;function snippet
:*:VFUNC::
SendInput {Raw}ROUTINE ?_NAME_? ( ?_VAR_? )
SendInput {ENTER}{ENTER}
SendInput {Raw}RETURN(?_RESULT_?)
SendInput {ENTER}
SendInput {Raw}ENDROUTINE
Send {Up}{Up}{Up}{Home}
loop, 8 
{ 
	Send {Right} 
}
loop, 8 
{ 
	Send {Shift}+{Right}
}
return

;ifelse snippet
:*:VIF::
SendInput {Raw}IF (XX_CONDITION_XX) THEN
SendInput {ENTER}{ENTER}
SendInput {Raw}ELSE
SendInput {ENTER}{ENTER}
SendInput {Raw}ENDIF
loop, 5 
{ 
	Send {Up} 
}
Send {End}
loop, 6 
{ 
	Send {Left} 
}
loop, 15 
{ 
	Send {Shift}+{Left}
}
return

;for snippet
:*:VLOOP::
SendInput {Raw}WHILE index <= XX_MAX_XX DO
SendInput {ENTER}
SendInput {ENTER}{ENTER}
SendInput {Raw}index = index + 1
SendInput {Raw}ENDWHILE
Send {End}
loop, 3 
{ 
	Send {Up} 
}
Send {Left}{Left}{Left}
loop, 9 
{ 
	Send {Shift}+{Left}
}
return

;alert message
:*:VALERT::
SendInput {Raw}flash_message ( ?_MESSAGE_?, TRUE )
Send {Home}
loop, 16 
{ 
	Send {Right} 
}
loop, 10
{
	Send {Shift}+{Right}
}
return

;declare snippet
:*:VDEC::
SendInput {Raw}DECLARE ?_NAME_?
loop, 8 
{ 
	Send {Left} 
}
Send {Shift}+{End}
return

;--------------------------------------------
;----------------Files helpers---------------
;--------------------------------------------
;opening file
:*:VFILEOPEN::
SendInput {Raw}?_FILE_NAME_? = file_name
SendInput {Enter}
SendInput {Raw}FILE OPEN file_name, status 
SendInput {Enter}
SendInput {Raw}IF status <> EMPTY THEN
SendInput {Enter}
SendInput {Raw}{Error handling here}
SendInput {Enter}
SendInput {Raw}RETURN
SendInput {Enter}
SendInput {Raw}ELSE
SendInput {Enter}
SendInput {Raw}FILE READ file_name, line_in, status
SendInput {Enter}
SendInput {Raw}WHILE ( status = EMPTY ) DO		
SendInput {Enter}
SendInput {Enter}
SendInput {Raw}FILE READ file_name, line_in, status	
SendInput {Enter}
SendInput {Raw}ENDWHILE
SendInput {Enter}
SendInput {Raw}ENDIF
SendInput {Enter}
SendInput {Raw}FILE CLOSE file_name, status
return

;--------------------------------------------
;---------------forms snippets---------------
;--------------------------------------------
;join list
:*:VJOINLIST::
SendInput {Raw}JOIN LIBRARY $PROMPT_LIST
SendInput {ENTER}
SendInput {Raw}set_up_std_prompt_list_class ( )
return

;join arrays
:*:VJOINLIST::
SendInput {Raw}JOIN STANDARD_LIBRARY std_array
return

;declare snippet
:*:VFORM::
SendInput {Raw}CREATE OBJECT PROMPT_CLASS_FORM, ?_NAME_?
SendInput {ENTER}
SendInput {Raw}?_NAME_? . header = ?_FORM_TTITLE_?
SendInput {ENTER}
SendInput {Raw}?_NAME_? . column = 3
SendInput {ENTER}
SendInput {Raw}?_NAME_? . row = 6
SendInput {ENTER}
SendInput {Raw}?_NAME_? . height = 78
SendInput {ENTER}
SendInput {Raw}?_NAME_? . width = 78
SendInput {ENTER}
SendInput {Raw}?_NAME_? . confirm_required = FALSE
SendInput {ENTER}
SendInput {Raw}?_NAME_? . return_behaviour = FORM_RETURN_WRAP
SendInput {ENTER}
SendInput {Raw}?_NAME_? . start_prompt ( )
SendInput {ENTER}
SendInput {Raw}?_NAME_? . wait_prompt ( )
SendInput {ENTER}
SendInput {Raw}?_NAME_? . end_prompt ( )
SendInput {ENTER}
loop, 11 
{ 
	Send {Up} 
}
Send {End}
loop, 8 
{ 
	Send {Left} 
}
Send {Shift}+{End}
return

;add list
:*:VLIST::
SendInput {Raw}CREATE OBJECT PROMPT_LIST_CLASS, ?_NAME_?
SendInput {ENTER}
SendInput {Raw}?_NAME_? . height = XX_PARENT_FORM_XX . height - 5
SendInput {ENTER}
SendInput {Raw}?_NAME_? . width = XX_PARENT_FORM_XX . width - 2
SendInput {ENTER}
SendInput {Raw}?_NAME_? . row = XX_ROW_XX
SendInput {ENTER}
SendInput {Raw}?_NAME_? . column = 1
SendInput {ENTER}
SendInput {Raw}?_NAME_? . add_column ( "First", 125 )
SendInput {ENTER}
SendInput {Raw}?_NAME_? . add_column ( "Second", 125 )
SendInput {ENTER}
SendInput {Raw}?_NAME_? . insert_item ( "ValueCol1", EMPTY )
SendInput {ENTER}
SendInput {Raw}?_NAME_? . set_item(2, "ValueCol2")
SendInput {ENTER}
SendInput {Raw}?_FORM_NAME_? . add_prompt ( ?_NAME_? )
loop, 9
{ 
	Send {Up}
}
Send {End}
loop, 8 
{ 
	Send {Shift}+{Left} 
}
return

;add form display
:*:VDISP::
SendInput {Raw}?_NAME_? . add_display ( ?_text_value_?, ?_COL_?, ?_ROW_?, PROMPT_RENDITION_NORMAL )
Send {Home}
Send {Shift}+{Right}{Shift}+{Right}{Shift}+{Right}{Shift}+{Right}{Shift}+{Right}{Shift}+{Right}{Shift}+{Right}{Shift}+{Right}
return

;show display styles
:*:VSTYLE::
SendInput {Raw}PROMPT_RENDITION_ITALIC PROMPT_RENDITION_INVERSE PROMPT_RENDITION_NORMAL PROMPT_RENDITION_LOWERED PROMPT_RENDITION_UNDERLINE PROMPT_RENDITION_STRIKETHROUGH
return

;add input text
:*:VINPUTTEXT::
SendInput {Raw}PROMPT OBJECT ?_NAME_? . prompt_objects[?_INDEX_?] AT ?_COL_?,?_ROW_? FORMAT TEXT WITH ( value = "", length = 128)
Send {Home}
loop, 14 
{ 
	Send {Right} 
}
loop, 8 
{ 
	Send {Shift}+{Right}
}
return

;add input real
:*:VINPUTREAL::
SendInput {Raw}PROMPT OBJECT ?_NAME_? . prompt_objects[?_INDEX_?] AT ?_COL_?,?_ROW_? FORMAT REAL WITH ( value = "")
Send {Home}
loop, 14 
{ 
	Send {Right} 
}
loop, 8 
{ 
	Send {Shift}+{Right}
}
return

;add input date time
:*:VINPUTDATE::
SendInput {Raw}PROMPT OBJECT ?_NAME_? . prompt_objects[?_INDEX_?] AT ?_COL_?,?_ROW_? FORMAT DATE_TIME WITH ( value = "")
Send {Home}
loop, 14 
{ 
	Send {Right} 
}
loop, 8 
{ 
	Send {Shift}+{Right}
}
return

;add input file
:*:VINPUTFILE::
SendInput {Raw}PROMPT OBJECT ?_NAME_? AT ?_COL_?,?_ROW_? BROWSE ON file WITH (file_directory = "smp$XX_DIR_XX" , VGL_library = GLOBAL( "CURRENT_LIBRARY" ) , leave_prompt_routine = "XX_LEFT_FILE_NAME_ROUTINE_XX" ,value = "" )
SendInput {Enter}
SendInput {Raw}?_FORM_NAME_? . add_prompt ( ?_NAME_? )
Send {Up}{Home}
loop, 14 
{ 
	Send {Right} 
}
loop, 8 
{ 
	Send {Shift}+{Right}
}
return

;displays input routines
:*:VINPUTROUTINES::
SendInput {Raw}BROWSE_ROUTINE = "", ENTER_PROMPT_ROUTINE = "", INSERT_ROUTINE = "", LEAVE_PROMPT_ROUTINE = "", REMOVE_ROUTINE = "", SELECT_ROUTINE = "", VALIDATION_ROUTINE = ""
return

;add input entity
:*:VINPUTENT::
SendInput {Raw}PROMPT OBJECT ?_NAME_? . prompt_objects[?_INDEX_?] AT ?_COL_?,?_ROW_? BROWSE ON ?_entity_? WITH ( leave_prompt_routine = Q_ROUTINE_Q )
Send {Home}
loop, 14 
{ 
	Send {Right} 
}
loop, 8 
{ 
	Send {Shift}+{Right}
}
return

;-------------------------------------------
;---------------"IDE" helpers---------------
;-------------------------------------------
; <win + f> search next error in *.lis file
#f::
Send ^f
SendInput {Raw}>>>
Send {F3}
return