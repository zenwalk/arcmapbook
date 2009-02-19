Attribute VB_Name = "modGlobals"

' Copyright 1995-2004 ESRI

' All rights reserved under the copyright laws of the United States.

' You may freely redistribute and use this sample code, with or without modification.

' Disclaimer: THE SAMPLE CODE IS PROVIDED "AS IS" AND ANY EXPRESS OR IMPLIED
' WARRANTIES, INCLUDING THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
' FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL ESRI OR
' CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY,
' OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
' SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
' INTERRUPTION) SUSTAINED BY YOU OR A THIRD PARTY, HOWEVER CAUSED AND ON ANY
' THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT ARISING IN ANY
' WAY OUT OF THE USE OF THIS SAMPLE CODE, EVEN IF ADVISED OF THE POSSIBILITY OF
' SUCH DAMAGE.

' For additional information contact: Environmental Systems Research Institute, Inc.

' Attn: Contracts Dept.

' 380 New York Street

' Redlands, California, U.S.A. 92373

' Email: contracts@esri.com


Option Explicit

Public g_pFrmMapSeries As frmMapSeries
Public g_bClipFlag As Boolean
Public g_bRotateFlag As Boolean
Public g_bLabelNeighbors As Boolean

' modFunctions.bas
' Als try to remove "What's this?" window.
Private Declare Function CallWindowProc Lib "user32" Alias "CallWindowProcA" (ByVal lpPrevWndFunc As Long, ByVal hwnd As Long, ByVal Msg As Long, ByVal wParam As Long, ByVal lParam As Long) As Long
Private Declare Function SetWindowLong Lib "user32" Alias "SetWindowLongA" (ByVal hwnd As Long, ByVal nIndex As Long, ByVal dwNewLong As Long) As Long
Private lContextmenuWindowProc As Long
Declare Function FindWindow% Lib "user32" Alias "FindWindowA" _
    (ByVal lpclassname As Any, ByVal lpCaption As Any)

Declare Function SetWindowPos Lib "user32" (ByVal hwnd As Long, _
    ByVal hWndInsertAfter As Long, ByVal x As Long, ByVal y As Long, _
    ByVal cx As Long, ByVal cy As Long, ByVal wFlags As Long) As Long

Private Declare Function SendMessageString Lib "user32" Alias "SendMessageA" ( _
  ByVal hwnd As Long, ByVal wMsg As Long, ByVal wParam As Long, ByVal lParam As String) As Long

Public Const HWND_TOPMOST = -1
Public Const SWP_NOSIZE = &H1
Public Const SWP_NOMOVE = &H2
Public Const HWND_NOTOPMOST = -2
Public Const LB_FINDSTRING = &H18F
Public Const LB_FINDSTRINGEXACT = &H1A2
Public Const CB_FINDSTRING = &H14C
Public Const CB_FINDSTRINGEXACT = &H158

Const GWL_WNDPROC = (-4)
Const c_sModuleFileName As String = "modGlobals.bas"


Public Function NoContextMenuWindowProc(ByVal hwnd As Long, ByVal Msg As Long, ByVal wParam As Long, ByVal lParam As Long) As Long
On Error GoTo ErrHand:
67:   Const WM_CONTEXTMENU = &H7B
68:   If Msg <> WM_CONTEXTMENU Then
69:     NoContextMenuWindowProc = CallWindowProc(lContextmenuWindowProc, hwnd, Msg, wParam, lParam)
70:   End If
  
  Exit Function
ErrHand:
74:   MsgBox "NoContextMenuWindowProc - " & Err.Description
End Function
' This function starts the "NoContextMenuWindowProc" message loop
Public Sub RemoveContextMenu(lhWnd As Long)
On Error GoTo ErrHand:
79:   lContextmenuWindowProc = SetWindowLong(lhWnd, GWL_WNDPROC, AddressOf NoContextMenuWindowProc)
  
  Exit Sub
ErrHand:
83:   MsgBox "RemoveContextMenu - " & Err.Description
End Sub

Function TopMost(f As Form)
    Dim i As Integer
88:     Call SetWindowPos(f.hwnd, HWND_TOPMOST, 0, 0, 0, 0, SWP_NOMOVE Or SWP_NOSIZE)
End Function

Function NoTopMost(f As Form)
92:     Call SetWindowPos(f.hwnd, HWND_NOTOPMOST, 0, 0, 0, 0, SWP_NOMOVE Or SWP_NOSIZE)
End Function

Public Sub RemoveContextMenuSink(lhWnd As Long)
On Error GoTo ErrHand:
  Dim lngReturnValue As Long
98:   lngReturnValue = SetWindowLong(lhWnd, GWL_WNDPROC, lContextmenuWindowProc)
  
  Exit Sub
ErrHand:
102:   MsgBox "RemoveContextMenuSink - " & Err.Description
End Sub

Public Function FindDataFrame(pDoc As IMxDocument, sFrameName As String) As IMap
On Error GoTo ErrHand:
  Dim lLoop As Long, pMap As IMap
  
  'Find the data frame
110:   Set pMap = Nothing
111:   For lLoop = 0 To pDoc.Maps.count - 1
112:     If pDoc.Maps.Item(lLoop).Name = sFrameName Then
113:       Set pMap = pDoc.Maps.Item(lLoop)
114:       Exit For
115:     End If
116:   Next lLoop
117:   Set FindDataFrame = pMap

  Exit Function
ErrHand:
121:   MsgBox "FindDataFrame - " & Err.Description
End Function

Public Function FindLayer(sLayerName As String, pMap As IMap) As IFeatureLayer
' Routine for finding a layer based on a name and then returning that layer as
' a IFeatureLayer
On Error GoTo ErrHand:
  Dim lLoop As Integer
  Dim pFLayer As IFeatureLayer

131:   For lLoop = 0 To pMap.LayerCount - 1
132:     If TypeOf pMap.Layer(lLoop) Is ICompositeLayer Then
133:       Set pFLayer = FindCompositeLayer(pMap.Layer(lLoop), sLayerName, pMap)
134:       If Not pFLayer Is Nothing Then
135:         Set FindLayer = pFLayer
        Exit Function
137:       End If
138:     ElseIf TypeOf pMap.Layer(lLoop) Is IFeatureLayer Then
139:       Set pFLayer = pMap.Layer(lLoop)
140:       If UCase(pFLayer.Name) = UCase(sLayerName) Then
141:         Set FindLayer = pFLayer
        Exit Function
143:       End If
144:     End If
145:   Next lLoop
  
147:   Set FindLayer = Nothing
  
  Exit Function
  
ErrHand:
152:   MsgBox "FindLayer - " & Err.Description
End Function

Private Function FindCompositeLayer(pCompLayer As ICompositeLayer, sLayerName As String, pMap As IMap) As IFeatureLayer
On Error GoTo ErrHand:
  Dim lLoop As Long, pFeatLayer As IFeatureLayer
158:   For lLoop = 0 To pCompLayer.count - 1
159:     If TypeOf pCompLayer.Layer(lLoop) Is ICompositeLayer Then
160:       Set pFeatLayer = FindCompositeLayer(pCompLayer.Layer(lLoop), sLayerName, pMap)
161:       If Not pFeatLayer Is Nothing Then
162:         Set FindCompositeLayer = pFeatLayer
        Exit Function
164:       End If
165:     Else
166:       If TypeOf pCompLayer.Layer(lLoop) Is IFeatureLayer Then
167:         If UCase(pCompLayer.Layer(lLoop).Name) = UCase(sLayerName) Then
168:           Set FindCompositeLayer = pCompLayer.Layer(lLoop)
          Exit Function
170:         End If
171:       End If
172:     End If
173:   Next lLoop

  Exit Function
ErrHand:
177:   MsgBox "CompositeLayer - " & Err.Description
End Function

Public Function ParseOutPages(sPagesToPrint As String, pMapSeries As INWDSMapSeries, bDisabled As Boolean) As Collection
On Error GoTo ErrHand:
  If Len(sPagesToPrint) = 0 Then Exit Function
  
  Dim NoSpaces() As String
  Dim sTextToSplit As String
  
      'Get rid of any spaces
188:       NoSpaces = Split(sPagesToPrint)
189:       sTextToSplit = Join(NoSpaces, "") 'joined with no spaces
      
  Dim aPages() As String
192:       aPages = Split(sTextToSplit, ",")
      
  Dim aPages2() As String
  
  Dim i As Long
  Dim sPage As String
  Dim lLength As Long
  Dim count As Long
  
  Dim NWDSPagesCollection As New Collection
  Dim lStart As Long, lEnd As Long, lPage As Long

204:   For i = 0 To UBound(aPages)
205:      aPages2 = Split(aPages(i), "-")
          
207:       If UBound(aPages2) = 1 Then
208:           lStart = CInt(aPages2(0))
209:               count = count + 1
210:           lEnd = CInt(aPages2(1))
              
212:           While lStart <> (lEnd + 1)
213:             If bDisabled Then
214:               If pMapSeries.Page(lStart - 1).EnablePage Then
215:                 NWDSPagesCollection.Add pMapSeries.Page(lStart - 1)
216:               End If
217:             Else
218:               NWDSPagesCollection.Add pMapSeries.Page(lStart - 1)
219:             End If
220:             lStart = lStart + 1
221:           Wend
222:       ElseIf UBound(aPages2) < 1 Then
223:           lPage = CInt(aPages2(0))
224:           If bDisabled Then
225:             If pMapSeries.Page(lPage - 1).EnablePage Then
226:               NWDSPagesCollection.Add pMapSeries.Page(lPage - 1)
227:             End If
228:           Else
229:             NWDSPagesCollection.Add pMapSeries.Page(lPage - 1)
230:           End If
231:       End If
232:   Next i
      
  If NWDSPagesCollection.count = 0 Then Exit Function
  
236:   Set ParseOutPages = NWDSPagesCollection
    
  Exit Function
ErrHand:
240:   MsgBox "ParseOutPages - " & Err.Description
End Function







'find a string in the control.
' Ths third argument is the index *after* which to start the search (first item if omitted).
' If the fourth argument is True, it searches for an exact match.
' Returns the index of the amtch, or -1 if not found.

Public Function FindControlString(ctrl As Control, ByVal strSearch As String, Optional lStartIdx As Long = -1, Optional ExactMatch As Boolean) As Long
  On Error GoTo ErrorHandler
  
  Dim uMsg As Long
258:   If TypeOf ctrl Is ListBox Then
259:     uMsg = IIf(ExactMatch, LB_FINDSTRINGEXACT, LB_FINDSTRING)
260:   ElseIf TypeOf ctrl Is ComboBox Then
261:     uMsg = IIf(ExactMatch, CB_FINDSTRINGEXACT, CB_FINDSTRING)
262:   Else
    Exit Function
264:   End If
265:   FindControlString = SendMessageString(ctrl.hwnd, uMsg, lStartIdx, strSearch)
  
  Exit Function
ErrorHandler:
  HandleError True, "FindControlString " & c_sModuleFileName & " " & GetErrorLineNumberString(Erl), Err.Number, Err.Source, Err.Description, 1
End Function
