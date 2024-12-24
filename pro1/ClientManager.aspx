
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ClientManager.aspx.cs" Inherits="YourNamespace.ClientManager" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title>Client Management</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container mt-4">
            <h2 class="text-center">Client Management</h2>

            <!-- Form to Add/Update Clients -->
            <div class="card p-3 mb-3">
                <div class="form-row"> 
                    <div class="col-md-6 mb-3">
                        <label for="txtName">Name</label>

                        <asp:TextBox ID="txtName" CssClass="form-control" runat="server" placeholder="Enter Name"></asp:TextBox>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="txtEmail">Email</label>
                        <asp:TextBox ID="txtEmail" CssClass="form-control" runat="server" placeholder="Enter Email"></asp:TextBox>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="txtPhone">Phone</label>
                        <asp:TextBox ID="txtPhone" CssClass="form-control" runat="server" placeholder="Enter Phone"></asp:TextBox>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="txtAddress">Address</label>
                        <asp:TextBox ID="txtAddress" CssClass="form-control" runat="server" placeholder="Enter Address"></asp:TextBox>
                    </div>
                </div>
                <asp:HiddenField ID="hfClientId" runat="server" />
                <div class="form-row">
                    <div class="col">
                        <asp:Button ID="btnAdd" runat="server" Text="Add Client" CssClass="btn btn-primary" OnClick="btnAdd_Click" />
                        <asp:Button ID="btnUpdate" runat="server" Text="Update Client" CssClass="btn btn-success" OnClick="btnUpdate_Click" />
                        <asp:Button ID="btnClear" runat="server" Text="Clear" CssClass="btn btn-secondary" OnClick="btnClear_Click" />
                    </div>
                </div>
            </div>

            <!-- GridView to Display Clients -->
            <asp:GridView ID="gvClients" runat="server" CssClass="table table-bordered table-hover" AutoGenerateColumns="False" OnRowCommand="gvClients_RowCommand">
    <Columns>
        <asp:BoundField DataField="id" HeaderText="ID" />
        <asp:BoundField DataField="name" HeaderText="Name" />
        <asp:BoundField DataField="email" HeaderText="Email" />
        <asp:BoundField DataField="phone" HeaderText="Phone" />
        <asp:BoundField DataField="address" HeaderText="Address" />
        <asp:TemplateField HeaderText="Actions">
            <ItemTemplate>
                <!-- Edit Button -->
                <asp:Button runat="server" CommandName="EditClient" CommandArgument='<%# Eval("id") %>' Text="Edit" CssClass="btn btn-info btn-sm" />
                
                <!-- Delete Button with Confirmation -->
                <asp:Button runat="server" CommandName="DeleteClient" CommandArgument='<%# Eval("id") %>' 
                            Text="Delete" CssClass="btn btn-danger btn-sm ml-2" 
                            OnClientClick="return confirm('Are you sure you want to delete this client?');" />
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>

        </div>
    </form>
</body>
</html>
