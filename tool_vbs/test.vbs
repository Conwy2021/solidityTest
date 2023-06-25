On Error Resume Next
Const wdExportFormatPDF = 17
Set oWord = WScript.CreateObject("Word.Application")
Set fso = WScript.CreateObject("Scripting.Filesystemobject")
Set fds=fso.GetFolder(".")
Set ffs=fds.Files
wscript.echo "Word文件正在转换中,请勿关闭当前窗口..."
For Each ff In ffs
    If (LCase(Right(ff.Name,4))=".doc" Or LCase(Right(ff.Name,4))="docx" ) And Left(ff.Name,1)<>"~" Then
        Set oDoc=oWord.Documents.Open(ff.Path)
        odoc.ExportAsFixedFormat Left(ff.Path,InStrRev(ff.Path,"."))&"pdf",wdExportFormatPDF
        If Err.Number Then
        MsgBox Err.Description
        End If
    End If
Next
odoc.Close
oword.Quit
Set oDoc=Nothing
Set oWord =Nothing
wscript.echo  "Word文件已全部转换为PDF格式!"
MsgBox "Word文件已全部转换为PDF格式!"