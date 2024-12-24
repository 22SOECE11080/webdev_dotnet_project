<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="sample.aspx.cs" Inherits="pro1.sample" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Calculator</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container m-4">
            <h2>Simple Calculator</h2>
            <div class="form-row">
                <div class="col-md-6 mb-3">
                    <label for="txtNumber1">Number 1</label>
                    <asp:TextBox ID="TextBox1" CssClass="form-control" runat="server" placeholder="Enter number 1"></asp:TextBox>
                </div>
                <div class="col-md-6 mb-3">
                    <label for="txtNumber2">Number 2</label>
                    <asp:TextBox ID="TextBox2" CssClass="form-control" runat="server" placeholder="Enter number 2"></asp:TextBox>
                </div>
                <div class="col-md-6 mb-3">
                    <label for="ddlOperation">Select Operation</label>
                    <asp:DropDownList ID="ddlOperation" CssClass="form-control" runat="server">
                        <asp:ListItem Text="Add" Value="Add"></asp:ListItem>
                        <asp:ListItem Text="Subtract" Value="Subtract"></asp:ListItem>
                        <asp:ListItem Text="Multiply" Value="Multiply"></asp:ListItem>
                        <asp:ListItem Text="Divide" Value="Divide"></asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="col-md-6 mb-3">
                    <asp:Button ID="btnCalculate" runat="server" Text="Calculate" CssClass="btn btn-primary" OnClick="btnCalculate_Click" />
                </div>
                <div class="col-md-6 mb-3">
                    <asp:Label ID="lblResult" runat="server" CssClass="text-success"></asp:Label>
                </div>
            </div>
        </div>
        <asp:Calendar ID="Calendar1" runat="server"></asp:Calendar>
    </form>
</body>
</html>
