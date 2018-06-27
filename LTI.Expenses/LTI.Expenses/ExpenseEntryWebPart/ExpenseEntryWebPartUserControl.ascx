<%@ Assembly Name="$SharePoint.Project.AssemblyFullName$" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %> 
<%@ Register Tagprefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ExpenseEntryWebPartUserControl.ascx.cs" Inherits="LTI.Expenses.ExpenseEntryWebPart.ExpenseEntryWebPartUserControl" %>
<style type="text/css">
    .auto-style3 {
        margin-left: 233px;
        width: 300px;
    }
    .auto-style16 {
        height: 21px;
    }
    .auto-style17 {
        margin-left: 471px;
        width: 279px;
    }
    .auto-style19 {
        margin-left: 18px;
    }
    </style>

<div style="border:solid">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <br />
&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Label ID="lblhead" runat="server" Text="EXPENSE ENTRY FORM" Font-Bold="True" Font-Size="X-Large"></asp:Label>
    <br />
    <br />
    <br />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
    <asp:Label ID="lblempname" runat="server" Text="Employee Name :" Font-Bold="True"></asp:Label>
&nbsp;
<asp:TextBox ID="txtename" runat="server" Width="305px" OnTextChanged="txtename_TextChanged" CausesValidation="True" placeholder="This field cannot be blank"></asp:TextBox>
<asp:regularexpressionvalidator id="regular1" controltovalidate="txtename" runat="server" errormessage="Please enter a valid name!" validationexpression="^[a-zA-Z]*$" ForeColor="Red"></asp:regularexpressionvalidator>
<p>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Label ID="lbltname" runat="server" Text="Trip Name :" Font-Bold="True"></asp:Label>
    &nbsp;
    <asp:TextBox ID="txttname" runat="server" Width="305px" OnTextChanged="txttname_TextChanged" CausesValidation="True"></asp:TextBox>
    <asp:RequiredFieldValidator runat="server" id="reqName" controltovalidate="txttname" errormessage="*" ForeColor="Red" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Label ID="lbltype" runat="server" Text="Trip Type :" Font-Bold="True"></asp:Label>
    &nbsp;
    <asp:DropDownList ID="ddltype" runat="server" Width="125px">
        <asp:ListItem Value="0">General Meeting</asp:ListItem>
        <asp:ListItem Value="1">Service Visit</asp:ListItem>
        <asp:ListItem Value="2">Sales Visit</asp:ListItem>
        <asp:ListItem Value="3">Others</asp:ListItem>
    </asp:DropDownList>
    <asp:RequiredFieldValidator runat="server" id="reqtype" controltovalidate="ddltype" errormessage="*" ForeColor="Red" />
</p>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;<%--<p style="height: 42px">--%><asp:Label ID="lblstart" runat="server" Text="Trip Start :" Font-Bold="True"></asp:Label>
    &nbsp;
        &nbsp;
      
<%--</p>--%>
&nbsp;<SharePoint:DateTimeControl ID="startdate" runat="server" DateOnly="True" />
<p class="auto-style16">
    <asp:Label ID="errlbl" runat="server"></asp:Label>
    
</p>
<%--<asp:CompareValidator ID="compare" runat="server" ControlToValidate="txtstart" SetFocusOnError="true" ControlToCompare="txtend" ErrorMessage="End date must be greater than startdate" Operator="LessThan" ValidationGroup="vg" Type="Date" CultureInvariantValues="true"></asp:CompareValidator>--%>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<asp:Label ID="lblend" runat="server" Text="Trip End :" Font-Bold="True"></asp:Label>
&nbsp;<SharePoint:DateTimeControl ID="enddate" runat="server" DateOnly="True" />

<br />
<br />

&nbsp;&nbsp;&nbsp;&nbsp;

<asp:Label ID="lbltstatus" runat="server" Text="Trip Status :" Font-Bold="True"></asp:Label>
&nbsp;
<asp:DropDownList ID="ddlstatus" runat="server" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged" Width="125px">
    <asp:ListItem Value="0">Planned</asp:ListItem>
    <asp:ListItem Value="1">In Progress</asp:ListItem>
    <asp:ListItem Value="2">Completed</asp:ListItem>
</asp:DropDownList>
<asp:RequiredFieldValidator runat="server" id="reqstatus" controltovalidate="ddlstatus" errormessage="*" ForeColor="Red" />
&nbsp;<p>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Label ID="lbldetails" runat="server" Text="Trip Details :" Font-Bold="True"></asp:Label>
    &nbsp;</p>
<p>
    <asp:TextBox ID="txtdetails" runat="server" Height="101px" TextMode="MultiLine" Width="715px"></asp:TextBox>
<p>
    &nbsp;</p>
&nbsp;&nbsp;&nbsp;&nbsp;
<asp:Label ID="lblestbudget" runat="server" Text="Estimated Budget :" Font-Bold="True"></asp:Label>
&nbsp;
<asp:TextBox ID="txtestbudget" runat="server" Width="165px" OnTextChanged="txtestbudget_TextChanged" CausesValidation="True"></asp:TextBox>
<asp:RequiredFieldValidator runat="server" id="reqbudget" controltovalidate="txtestbudget" errormessage="*" ForeColor="Red" />
<asp:regularexpressionvalidator id="Regularexpressionvalidator2" controltovalidate="txtestbudget" runat="server" errormessage="Invalid Budget!" validationexpression="\d+" ForeColor="Red"></asp:regularexpressionvalidator>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;
<br />
<br />
<br />

<asp:GridView ID="gvexp" runat="server" ShowFooter="true" AutoGenerateColumns="false" onrowcreated="gvexp_RowCreated" Width="715px" CssClass="auto-style19">
    <Columns>
        <asp:TemplateField HeaderText="Date">
            <ItemTemplate>
                    <asp:TextBox ID="txtdate" runat="server"></asp:TextBox>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Expense type">
                <ItemTemplate>
                    <asp:DropDownList ID="ddlexptype" runat="server">
                        <asp:ListItem Enabled="true" Text="Select an Expense type" Value="-1"></asp:ListItem>
                        <asp:ListItem Text="General Meeting" Value="0"></asp:ListItem>
                        <asp:ListItem Text="Service Visit" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Sales Visit" Value="2"></asp:ListItem>
                        <asp:ListItem Text="Others" Value="3"></asp:ListItem>
                    </asp:DropDownList>
                </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Narration">
                <ItemTemplate>
                    <textarea id="txtnarration" cols="20" rows="2"></textarea>
                </ItemTemplate>
        </asp:TemplateField>
         <asp:TemplateField HeaderText="Expenses">
                <ItemTemplate>
                     <asp:TextBox ID="txtexpense" runat="server"></asp:TextBox>
                    <asp:regularexpressionvalidator id="Regularexpressionvalidator2" controltovalidate="txtestbudget" runat="server" errormessage="Invalid Budget!" validationexpression="\d+" ForeColor="Red"></asp:regularexpressionvalidator>
                </ItemTemplate>
             <FooterStyle HorizontalAlign="Right" />
                <FooterTemplate>
                 <asp:Button ID="ButtonAdd" runat="server" Text="Add New Row" OnClick="ButtonAdd_Click" Font-Bold="True" />
                </FooterTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>



&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<p class="auto-style17">
    &nbsp;&nbsp;
    &nbsp;<asp:Label ID="lbltotexp" runat="server" Text="Total Expenses :" Font-Bold="True"></asp:Label>
    &nbsp;
<asp:TextBox ID="txttotexp" runat="server" OnTextChanged="txttotexp_TextChanged"></asp:TextBox>
<br />
</p>
<br />
&nbsp;&nbsp;&nbsp;&nbsp;
<asp:Label ID="lblmgr" runat="server" Text="Approving Manager :" Font-Bold="True"></asp:Label>
&nbsp; <asp:TextBox ID="txtmgr" runat="server" OnTextChanged="txtmgr_TextChanged"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<asp:Label ID="lblstatus" runat="server" Text="Approval Status :" Font-Bold="True"></asp:Label>
&nbsp;&nbsp;&nbsp;
<asp:DropDownList ID="DropDownList1" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
    <asp:ListItem>Pending</asp:ListItem>
    <asp:ListItem>Approved</asp:ListItem>
    <asp:ListItem>Rejected</asp:ListItem>
    <asp:ListItem>Cancelled</asp:ListItem>
</asp:DropDownList>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<p>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Label ID="lblnotes" runat="server" Text="Notes :" Font-Bold="True"></asp:Label>
    &nbsp; </p>
<p>
    
    <asp:TextBox ID="txtnotes" runat="server" Height="102px" TextMode="MultiLine" Width="715px"></asp:TextBox>
    
<p>
    &nbsp;</p>

<p class="auto-style3">
&nbsp;&nbsp;<asp:Button ID="btnsubmit" runat="server" OnClick="btnsubmit_Click" Text="Submit" Font-Bold="True" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="btncancel" runat="server" OnClick="btncancel_Click" Text="Cancel" Font-Bold="True" />
</p>
</div>
