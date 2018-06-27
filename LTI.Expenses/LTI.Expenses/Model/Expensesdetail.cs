using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.SharePoint;

namespace LTI.Expenses.Model
{
    public class Expensesdetail
    {
        public Expensesdetail(Expense e)
        {

        }

        public bool AddNewExpense(Expense e, Trip t)
        {
            try
            {
                SPList list = SPContext.Current.Web.Lists["Expenses"];
                SPListItem newItem = list.Items.Add();
                newItem["ExpenseDateTime"] = e.Date;
                newItem["ExpenseType"] = e.TypeOfExpense;
                newItem["Narration"] = e.Narration;
                newItem["Amount"] = e.Amount;
                newItem["TripRef"] = t.TripName;


            }
            catch
            {
                return false;
            }

            return true;
        }

        public bool deleteexpenseById(int id)
        {
            try
            {
                SPList list = SPContext.Current.Web.Lists["Expenses"];
                SPListItem item = list.GetItemById(id);
                item.Delete();
            }
            catch
            {
                return false;
            }

            return true;
        }

        public bool updateexpenseById(Expense e,Trip t)
        {
            SPList list = SPContext.Current.Web.Lists["Expenses"];

            SPListItem uItem = list.GetItemById(e.ID);
            try
            {
                uItem["ExpenseDateTime"] = e.Date;
                uItem["ExpenseType"] = e.TypeOfExpense;
                uItem["Narration"] = e.Narration;
                uItem["Amount"] = e.Amount;
                uItem["TripRef"] = t.TripName;

                uItem.Update();
            }
            catch
            {
                return false;
            }

            return true;



        }

    }
}