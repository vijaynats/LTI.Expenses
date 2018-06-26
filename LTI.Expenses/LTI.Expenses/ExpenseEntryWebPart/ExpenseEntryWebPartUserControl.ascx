<%@ Assembly Name="$SharePoint.Project.AssemblyFullName$" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %> 
<%@ Register Tagprefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ExpenseEntryWebPartUserControl.ascx.cs" Inherits="LTI.Expenses.ExpenseEntryWebPart.ExpenseEntryWebPartUserControl" %>
<style type="text/css">
    .auto-style2 {
        width: 680px;
        height: 94px;
    }
    .auto-style3 {
        margin-left: 160px;
    }
    .auto-style4 {
        height: 113px;
        width: 678px;
    }
    .auto-style6 {
        width: 130px;
    }
    .auto-style7 {
        width: 123px;
    }
    .auto-style9 {
        width: 301px;
    }
    .auto-style14 {
        height: 45px;
    }
    .auto-style15 {
        height: 45px;
        width: 301px;
    }
    .auto-style16 {
        height: 21px;
    }
    </style>

<asp:Label ID="lblempname" runat="server" Text="Employee Name"></asp:Label>
&nbsp;:
<asp:TextBox ID="txtename" runat="server" Width="307px" OnTextChanged="txtename_TextChanged" CausesValidation="True" placeholder="This field cannot be blank"></asp:TextBox>
<asp:regularexpressionvalidator id="regular1" controltovalidate="txtename" runat="server" errormessage="Please enter a valid name" validationexpression="^[a-zA-Z]*$" ForeColor="Red"></asp:regularexpressionvalidator>
<p>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Label ID="lbltname" runat="server" Text="Trip Name"></asp:Label>
&nbsp;:
    <asp:TextBox ID="txttname" runat="server" Width="303px" OnTextChanged="txttname_TextChanged" CausesValidation="True"></asp:TextBox>
    <asp:RequiredFieldValidator runat="server" id="reqName" controltovalidate="txttname" errormessage="*" ForeColor="Red" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Label ID="lbltype" runat="server" Text="Trip Type"></asp:Label>
&nbsp;:
    <asp:DropDownList ID="ddltype" runat="server">
        <asp:ListItem>General Meeting</asp:ListItem>
        <asp:ListItem>Service Visit</asp:ListItem>
        <asp:ListItem>Sales Visit</asp:ListItem>
        <asp:ListItem>Others</asp:ListItem>
    </asp:DropDownList>
</p>
<%--<p style="height: 42px">--%>
    <asp:Label ID="lblstart" runat="server" Text="Trip Start"></asp:Label>
    &nbsp;:
        &nbsp;
      
<%--</p>--%>
<SharePoint:DateTimeControl ID="startdate" runat="server" DateOnly="True" />
<p class="auto-style16">
    <asp:Label ID="errlbl" runat="server"></asp:Label>
    
</p>
<%--<asp:CompareValidator ID="compare" runat="server" ControlToValidate="txtstart" SetFocusOnError="true" ControlToCompare="txtend" ErrorMessage="End date must be greater than startdate" Operator="LessThan" ValidationGroup="vg" Type="Date" CultureInvariantValues="true"></asp:CompareValidator>--%>
<asp:Label ID="lblend" runat="server" Text="Trip End"></asp:Label>
&nbsp;:
<SharePoint:DateTimeControl ID="enddate" runat="server" DateOnly="True" />
<br />

<br />
<br />

<asp:Label ID="lbltstatus" runat="server" Text="Trip Status"></asp:Label>
&nbsp;:
<asp:DropDownList ID="DropDownList2" runat="server" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged">
    <asp:ListItem>Planned</asp:ListItem>
    <asp:ListItem>In Progress</asp:ListItem>
    <asp:ListItem>Completed</asp:ListItem>
</asp:DropDownList>
&nbsp;<p>
    <asp:Label ID="lbldetails" runat="server" Text="Trip Details"></asp:Label>
&nbsp;:
</p>
<p>
    <textarea id="txtdetails" name="S1" class="auto-style4"></textarea></p>
<p>
    &nbsp;</p>
<asp:Label ID="lblestbudget" runat="server" Text="Estimated Budget"></asp:Label>
&nbsp;:
<asp:TextBox ID="txtestbudget" runat="server" Width="165px" OnTextChanged="txtestbudget_TextChanged" CausesValidation="True"></asp:TextBox>
<asp:regularexpressionvalidator id="Regularexpressionvalidator2" controltovalidate="txtestbudget" runat="server" errormessage="Invalid Budget" validationexpression="\d+" ForeColor="Red"></asp:regularexpressionvalidator>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;
<br />
<br />
<table style="width:100%;">
    <tr>
        <th class="auto-style6">Date</th>
        <th class="auto-style7">Expense Type</th>
        <th class="auto-style9">Narration</th>
        <th>Amount</th>
    </tr>
    <tr>
        <td class="auto-style14">
            <SharePoint:DateTimeControl ID="DateTimeControl1" runat="server" DateOnly="True" />

        </td>
        <td class="auto-style14">
            <asp:DropDownList ID="DropDownList3" runat="server">
                <asp:ListItem>Travel Ticket</asp:ListItem>
                <asp:ListItem>Local Travel</asp:ListItem>
                <asp:ListItem>Food and snacks</asp:ListItem>
                <asp:ListItem>Stationery</asp:ListItem>
                <asp:ListItem>Internet and mobile</asp:ListItem>
                <asp:ListItem>Others</asp:ListItem>
            </asp:DropDownList>
        </td>
        <td class="auto-style15">
            <asp:TextBox ID="narr1" runat="server" Width="284px"></asp:TextBox>
            <asp:RequiredFieldValidator runat="server" id="RequiredFieldValidator3" controltovalidate="narr1" errormessage="*" ForeColor="Red" />

        </td>
        <td class="auto-style14">
            <asp:TextBox ID="amt1" runat="server" CausesValidation="True"></asp:TextBox>
            <asp:regularexpressionvalidator id="Regularexpressionvalidator3" controltovalidate="amt1" runat="server" errormessage="Invalid" validationexpression="\d+" ForeColor="Red"></asp:regularexpressionvalidator>
        </td>
    </tr>
   <tr>
        <td class="auto-style6">
            <SharePoint:DateTimeControl ID="DateTimeControl2" runat="server" DateOnly="True" />
        </td>
        <td class="auto-style7">
            <asp:DropDownList ID="DropDownList4" runat="server">
                <asp:ListItem>Travel Ticket</asp:ListItem>
                <asp:ListItem>Local Travel</asp:ListItem>
                <asp:ListItem>Food and snacks</asp:ListItem>
                <asp:ListItem>Stationery</asp:ListItem>
                <asp:ListItem>Internet and mobile</asp:ListItem>
                <asp:ListItem>Others</asp:ListItem>
            </asp:DropDownList>
        </td>
        <td class="auto-style9">
            <asp:TextBox ID="narr2" runat="server" Width="284px"></asp:TextBox>
            <asp:RequiredFieldValidator runat="server" id="RequiredFieldValidator4" controltovalidate="narr2" errormessage="*" ForeColor="Red" />
        </td>
        <td>
            <asp:TextBox ID="amt2" runat="server" CausesValidation="True"></asp:TextBox>
            <asp:regularexpressionvalidator id="Regularexpressionvalidator4" controltovalidate="amt2" runat="server" errormessage="Invalid" validationexpression="\d+" ForeColor="Red"></asp:regularexpressionvalidator>
        </td>
    </tr>
   <tr>
       <td class="auto-style6">
           <SharePoint:DateTimeControl ID="DateTimeControl3" runat="server" DateOnly="True" />
       </td>
        <td class="auto-style7">
            <asp:DropDownList ID="DropDownList5" runat="server">
                <asp:ListItem>Travel Ticket</asp:ListItem>
                <asp:ListItem>Local Travel</asp:ListItem>
                <asp:ListItem>Food and snacks</asp:ListItem>
                <asp:ListItem>Stationery</asp:ListItem>
                <asp:ListItem>Internet and mobile</asp:ListItem>
                <asp:ListItem>Others</asp:ListItem>
            </asp:DropDownList>
       </td>
        <td class="auto-style9">
            <asp:TextBox ID="narr3" runat="server" Width="284px"></asp:TextBox>
            <asp:RequiredFieldValidator runat="server" id="RequiredFieldValidator5" controltovalidate="narr3" errormessage="*" ForeColor="Red" />
       </td>
        <td>
            <asp:TextBox ID="amt3" runat="server" CausesValidation="True"></asp:TextBox>
            <asp:regularexpressionvalidator id="Regularexpressionvalidator5" controltovalidate="amt3" runat="server" errormessage="Invalid" validationexpression="\d+" ForeColor="Red"></asp:regularexpressionvalidator>
       </td>
    </tr>
    <tr>
       <td class="auto-style6">
           <SharePoint:DateTimeControl ID="DateTimeControl4" runat="server" DateOnly="True" />
        </td>
        <td class="auto-style7">
            <asp:DropDownList ID="DropDownList6" runat="server">
                <asp:ListItem>Travel Ticket</asp:ListItem>
                <asp:ListItem>Local Travel</asp:ListItem>
                <asp:ListItem>Food and snacks</asp:ListItem>
                <asp:ListItem>Stationery</asp:ListItem>
                <asp:ListItem>Internet and mobile</asp:ListItem>
                <asp:ListItem>Others</asp:ListItem>
            </asp:DropDownList>
        </td>
        <td class="auto-style9">
            <asp:TextBox ID="narr4" runat="server" Width="284px"></asp:TextBox>
            <asp:RequiredFieldValidator runat="server" id="RequiredFieldValidator6" controltovalidate="narr4" errormessage="*" ForeColor="Red" />
        </td>
        <td>
            <asp:TextBox ID="amt4" runat="server" CausesValidation="True"></asp:TextBox>
            <asp:regularexpressionvalidator id="Regularexpressionvalidator6" controltovalidate="amt4" runat="server" errormessage="Invalid" validationexpression="\d+" ForeColor="Red"></asp:regularexpressionvalidator>
        </td>
    </tr>
   <tr>
       <td class="auto-style6">
           <SharePoint:DateTimeControl ID="DateTimeControl5" runat="server" DateOnly="True" />
       </td>
        <td class="auto-style7">
            <asp:DropDownList ID="DropDownList7" runat="server">
                <asp:ListItem>Travel Ticket</asp:ListItem>
                <asp:ListItem>Local Travel</asp:ListItem>
                <asp:ListItem>Food and snacks</asp:ListItem>
                <asp:ListItem>Stationery</asp:ListItem>
                <asp:ListItem>Internet and mobile</asp:ListItem>
                <asp:ListItem>Others</asp:ListItem>
            </asp:DropDownList>
       </td>
        <td class="auto-style9">
            <asp:TextBox ID="narr5" runat="server" Width="284px"></asp:TextBox>
            <asp:RequiredFieldValidator runat="server" id="RequiredFieldValidator7" controltovalidate="narr5" errormessage="*" ForeColor="Red" />
       </td>
        <td>
            <asp:TextBox ID="amt5" runat="server" CausesValidation="True"></asp:TextBox>
            <asp:regularexpressionvalidator id="Regularexpressionvalidator7" controltovalidate="amt5" runat="server" errormessage="Invalid" validationexpression="\d+" ForeColor="Red"></asp:regularexpressionvalidator>
       </td>
    </tr>
    <tr>
       <td class="auto-style6">
           <SharePoint:DateTimeControl ID="DateTimeControl6" runat="server" DateOnly="True" />
        </td>
        <td class="auto-style7">
            <asp:DropDownList ID="DropDownList8" runat="server">
                <asp:ListItem>Travel Ticket</asp:ListItem>
                <asp:ListItem>Local Travel</asp:ListItem>
                <asp:ListItem>Food and snacks</asp:ListItem>
                <asp:ListItem>Stationery</asp:ListItem>
                <asp:ListItem>Internet and mobile</asp:ListItem>
                <asp:ListItem>Others</asp:ListItem>
            </asp:DropDownList>
        </td>
        <td class="auto-style9">
            <asp:TextBox ID="narr6" runat="server" Width="284px"></asp:TextBox>
            <asp:RequiredFieldValidator runat="server" id="RequiredFieldValidator8" controltovalidate="narr6" errormessage="*" ForeColor="Red" />
        </td>
        <td>
            <asp:TextBox ID="amt6" runat="server" CausesValidation="True"></asp:TextBox>
            <asp:regularexpressionvalidator id="Regularexpressionvalidator8" controltovalidate="amt6" runat="server" errormessage="Invalid" validationexpression="\d+" ForeColor="Red"></asp:regularexpressionvalidator>
        </td>
    </tr>
</table>
<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<asp:Label ID="lbltotexp" runat="server" Text="Total Expenses"></asp:Label>
&nbsp;:
<asp:TextBox ID="txttotexp" runat="server" OnTextChanged="txttotexp_TextChanged"></asp:TextBox>
<br />
<p>
    :
</p>
<asp:Label ID="lblmgr" runat="server" Text="Approving Manager"></asp:Label>
&nbsp;: <asp:TextBox ID="txtmgr" runat="server" OnTextChanged="txtmgr_TextChanged"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<asp:Label ID="lblstatus" runat="server" Text="Approval Status"></asp:Label>
&nbsp;:&nbsp;&nbsp;
<asp:DropDownList ID="DropDownList1" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
    <asp:ListItem>Pending</asp:ListItem>
    <asp:ListItem>Approved</asp:ListItem>
    <asp:ListItem>Rejected</asp:ListItem>
    <asp:ListItem>Cancelled</asp:ListItem>
</asp:DropDownList>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<p>
    <asp:Label ID="lblnotes" runat="server" Text="Notes"></asp:Label>
&nbsp;: </p>
<p>
    <textarea id="TextArea1" class="auto-style2" name="S2"></textarea></p>

<p>
    &nbsp;</p>
<p class="auto-style3">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="btnsubmit" runat="server" OnClick="btnsubmit_Click" Text="Submit" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="btncancel" runat="server" OnClick="btncancel_Click" Text="Cancel" />
</p>
<p>
    &nbsp;</p>
<p>
    &nbsp;</p>
