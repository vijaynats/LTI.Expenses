using System;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using Microsoft.SharePoint;
using System.Collections.Generic;
using System.Data;

namespace LTI.Expenses.ExpenseEntryWebPart
{
    public partial class ExpenseEntryWebPartUserControl : UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SPSite site = new SPSite("http://expenses.trg3.int/");
            SPWeb web = site.RootWeb;
            SPUserCollection uc = web.AllUsers;
            int flag = 0;
            foreach (SPUser user in uc)
            {
                if (txtmgr.Text == user.Name)
                {
                    flag = 1;
                    break;
                }
            }
            if (flag == 0)
                txtmgr.Text = "Enter a valid user name";
        }
       
        protected void txtename_TextChanged(object sender, EventArgs e)
        {

        }
        protected void txttname_TextChanged(object sender, EventArgs e)
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
        protected void ButtonAdd_Click(object sender, EventArgs e)
        {
            DataTable dt = new DataTable();
            DataRow dr = null;
            dt.Columns.Add(new DataColumn("Date", typeof(string)));
            dt.Columns.Add(new DataColumn("Expense Type", typeof(string)));
            dt.Columns.Add(new DataColumn("Narration", typeof(string)));
            dt.Columns.Add(new DataColumn("Expenses", typeof(string)));
            dr = dt.NewRow();
            dr["Date"] = string.Empty;
            dr["Expense Type"] = string.Empty;
            dr["Narration"] = string.Empty;
            dr["Expenses"] = string.Empty;
            dt.Rows.Add(dr);
            ViewState["CurrentTable"] = dt;
            gvexp.DataSource = dt;
            gvexp.DataBind();
        }
        protected void btncancel_Click(object sender, EventArgs e)
        {

        }
    }
}

