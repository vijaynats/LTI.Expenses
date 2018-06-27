using System;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using Microsoft.SharePoint;
using System.Collections.Generic;


namespace LTI.Expenses.ExpenseEntryWebPart
{
    public partial class ExpenseEntryWebPartUserControl : UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
       
        protected void txtename_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txttname_TextChanged(object sender, EventArgs e)
        {

        }
        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void txtestbudget_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txttotexp_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txtmgr_TextChanged(object sender, EventArgs e)
        {

        }

        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            if (startdate.SelectedDate > enddate.SelectedDate)
                errlbl.Text = "Enter valid dates";
        }

        protected void btncancel_Click(object sender, EventArgs e)
        {

        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}

