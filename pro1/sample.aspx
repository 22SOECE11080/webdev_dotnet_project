<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="sample.aspx.cs" Inherits="pro1.sample" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Non Sence</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container m-4">
            <div class="form-row">

                <div class="col-md-6 mb-3">
                     <label for="txtPhone">Number 1</label>
                     <asp:TextBox ID="TextBox1" CssClass="form-control" runat="server" placeholder="Enter txt1"></asp:TextBox>
                </div>
                <div class="col-md-6 mb-3">
     <label for="txtPhone">Number 2</label>
     <asp:TextBox ID="TextBox2" CssClass="form-control" runat="server" placeholder="Enter txt2"></asp:TextBox>
</div>
                <div class="col-md-6 mb-3">
     <label for="txtPhone">Number 3</label>
     <asp:TextBox ID="TextBox3" CssClass="form-control" runat="server" placeholder="Enter txt3"></asp:TextBox>
</div>
                                <div class="col-md-6 mb-3">
                                                            <asp:Button ID="btnAdd" runat="server" Text="Add Client" CssClass="btn btn-primary" OnClick="btnAdd_Click" />

</div>
                <div class="col-md-6 mb-3">
    <asp:Label ID="lblResult" runat="server" CssClass="text-success"></asp:Label>
</div>


            </div>
        </div>
    </form>
</body>
</html>
