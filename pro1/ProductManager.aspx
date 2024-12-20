<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProductManager.aspx.cs" Inherits="pro1.ProductManager" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Product Manager</title>
    <!-- Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <form id="form1" runat="server">
        <div class="container mt-4">
            <h2>Product Manager</h2>

            <!-- Add Product Form -->
            <div class="mb-4">
                <h4>Add New Product</h4>
                <div class="form-group">
                    <label for="txtProductName">Product Name:</label>
                    <input type="text" id="txtProductName" runat="server" class="form-control" />
                </div>
                <div class="form-group">
                    <label for="txtPrice">Price:</label>
                    <input type="text" id="txtPrice" runat="server" class="form-control" />
                </div>
                <button type="submit" id="btnAdd" runat="server" onserverclick="btnAdd_Click" class="btn btn-primary">Add Product</button>
            </div>

            <!-- Product List Table -->
            <h4>Product List</h4>
           <asp:GridView ID="gvProducts" runat="server" AutoGenerateColumns="False" CssClass="table table-striped" OnRowCommand="gvProducts_RowCommand">
    <Columns>
        <asp:BoundField DataField="ProductId" HeaderText="ProductId" SortExpression="ProductId" />
        <asp:BoundField DataField="ProductName" HeaderText="Product Name" SortExpression="ProductName" />
        <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
        <asp:TemplateField>
            <ItemTemplate>
                 <!-- Edit Button -->
 <asp:Button runat="server" CommandName="EditClient" CommandArgument='<%# Eval("ProductId") %>' Text="Edit" CssClass="btn btn-info btn-sm" />
 
 <!-- Delete Button with Confirmation -->
 <asp:Button runat="server" CommandName="DeleteClient" CommandArgument='<%# Eval("ProductId") %>' 
             Text="Delete" CssClass="btn btn-danger btn-sm ml-2" 
             OnClientClick="return confirm('Are you sure you want to delete this client?');" />
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>


        </div>

        <!-- Bootstrap JS and jQuery -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.0/dist/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </form>
</body>
</html>
