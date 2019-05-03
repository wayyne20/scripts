Imports System.Diagnostics
 
Public Class frmConsoleDemo
 
    Friend WithEvents txtConsoleOut As System.Windows.Forms.TextBox
    Friend WithEvents txtConsoleIn As System.Windows.Forms.TextBox
 
    Private psi As ProcessStartInfo
    Private cmd As Process
    Private Delegate Sub InvokeWithString(ByVal text As String)
 
    Private Sub frmConsoleDemo_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
 
        psi = New ProcessStartInfo("cmd.exe")
 
        Dim systemencoding As System.Text.Encoding = _
            System.Text.Encoding.GetEncoding(Globalization.CultureInfo.CurrentUICulture.TextInfo.OEMCodePage)
 
        With psi
            .UseShellExecute = False  ' Required for redirection
            .RedirectStandardError = True
            .RedirectStandardOutput = True
            .RedirectStandardInput = True
            .CreateNoWindow = True
            .StandardOutputEncoding = systemencoding  ' Use OEM encoding for console applications
            .StandardErrorEncoding = systemencoding
        End With
 
        ' EnableraisingEvents is required for Exited event
        cmd = New Process With {.StartInfo = psi, .EnableRaisingEvents = True}
 
        AddHandler cmd.ErrorDataReceived, AddressOf Async_Data_Received
        AddHandler cmd.OutputDataReceived, AddressOf Async_Data_Received
        AddHandler cmd.Exited, AddressOf CMD_Exited
 
        cmd.Start()
        ' Start async reading of the redirected streams
        ' Without these calls the events won't fire
        cmd.BeginOutputReadLine()
        cmd.BeginErrorReadLine()
 
        Me.txtConsoleIn.Select()
    End Sub
 
    Private Sub CMD_Exited(ByVal sender As Object, ByVal e As EventArgs)
        Me.Close()
    End Sub
 
    ' This sub gets called in a different thread so invokation is required
    Private Sub Async_Data_Received(ByVal sender As Object, ByVal e As DataReceivedEventArgs)
        Me.Invoke(New InvokeWithString(AddressOf Sync_Output), e.Data)
    End Sub
 
    Private Sub Sync_Output(ByVal text As String)
        txtConsoleOut.AppendText(text & Environment.NewLine)
        txtConsoleOut.ScrollToCaret()
    End Sub
 
    ' Sending console commands here
    Private Sub txtConsoleIn_KeyPress(ByVal sender As Object, ByVal e As System.Windows.Forms.KeyPressEventArgs) Handles txtConsoleIn.KeyPress
        If e.KeyChar = ControlChars.Cr Then
            cmd.StandardInput.WriteLine(txtConsoleIn.Text)
            txtConsoleIn.Clear()
        End If
    End Sub
 
    ' Two text boxes called txtConsoleOut and txtConsoleIn
    Public Sub New()
        Me.txtConsoleOut = New System.Windows.Forms.TextBox()
        Me.txtConsoleIn = New System.Windows.Forms.TextBox()
        Me.SuspendLayout()
        '
        'txtConsoleOut
        '
        Me.txtConsoleOut.Anchor = CType((((System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Bottom) _
                    Or System.Windows.Forms.AnchorStyles.Left) _
                    Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        Me.txtConsoleOut.Location = New System.Drawing.Point(12, 12)
        Me.txtConsoleOut.Multiline = True
        Me.txtConsoleOut.Name = "txtConsoleOut"
        Me.txtConsoleOut.ReadOnly = True
        Me.txtConsoleOut.ScrollBars = System.Windows.Forms.ScrollBars.Both
        Me.txtConsoleOut.Size = New System.Drawing.Size(665, 494)
        Me.txtConsoleOut.TabIndex = 0
        '
        'txtConsoleIn
        '
        Me.txtConsoleIn.Anchor = CType(((System.Windows.Forms.AnchorStyles.Bottom Or System.Windows.Forms.AnchorStyles.Left) _
                    Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        Me.txtConsoleIn.Location = New System.Drawing.Point(10, 512)
        Me.txtConsoleIn.Name = "txtConsoleIn"
        Me.txtConsoleIn.Size = New System.Drawing.Size(667, 20)
        Me.txtConsoleIn.TabIndex = 1
        '
        'frmConsoleDemo
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(689, 544)
        Me.Controls.Add(Me.txtConsoleIn)
        Me.Controls.Add(Me.txtConsoleOut)
        Me.Name = "frmConsoleDemo"
        Me.Text = "Console redirect demo"
        Me.ResumeLayout(False)
        Me.PerformLayout()
 
    End Sub
 
End Class
