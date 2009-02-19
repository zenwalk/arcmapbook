Attribute VB_Name = "modBookGlobals"
Option Explicit

'Define some constants to be used throughout the application.
'The intent is to make refactoring easy in case certain
'application settings need to be changed.

'irritatingly, Visual Basic does not permit declarations of string constants,
'so these variables must have their values assigned in some routine.  This
'causes two flaws:
'  1 - the strings cannot be constants, therefore there is no compiler
'      enforcement preventing these values from being modified.
'  2 - These values must be set in some subroutine.  Where is there a
'      subroutine that is guaranteed to be run before any others?  Class
'      modules have a class_initialize routine, but which one is run first?
'      This forces the identifiers to be reinitialized in every class
'      module.  This defeats the idea that the identifiers can be modified
'      in just one location to update the application settings for the
'      next compilation.

'tag added to detail elements, used
Public GBL_BUBBLE_IDENTIFIER As String
'GBL_BUBBLE_IDENTIFIER = "BubbleID:"

Public GBL_ELEMENT_COUNT As Long
Public GBL_ELEMENT_IDENTIFIER As String
'GBL_ELEMENT_IDENTIFIER = "NWMapBookElement"


'constants representing options for setting the
'extent of data frames other than the main
'data frame (or of the detail inset data frames)
Public OTHER_DF_EXTENTOPTION_POLYEXTENT As Long 'option of using polygon extent to set extent of data frame
Public OTHER_DF_EXTENTOPTION_MAINDFSCALE As Long 'option of using the scale of the main data frame for the other data frames


Function ItemExists(col As Collection, Key As String) As Boolean
    Dim dummy As Variant
    On Error Resume Next
    dummy = col.Item(Key)
    ItemExists = (Err <> 5)
End Function

 
