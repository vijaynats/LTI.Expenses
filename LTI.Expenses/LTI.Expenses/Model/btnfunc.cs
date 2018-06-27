using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.SharePoint;
using LTI.Expenses.Model;

namespace LTI.Expenses.Model
{
   public  class btnfunc
    { 
        public void button(Trip tr,Expense ex)
        { try
            { using (SPSite site = new SPSite(SPContext.Current.Web.Url))
               using (SPWeb web = site.OpenWeb())
                {
                  SPList list = web.Lists.TryGetList("Trips");
                    SPList list2 = web.Lists.TryGetList("Expenses");
                    Trip t = new Trip();
                    Expense e = new Expense();
                   if (list != null)
                    {
                        SPListItem newItem = list.Items.Add();
                        {
                            web.AllowUnsafeUpdates = true;
                            newItem["TripName"] = t.TripName;
                            newItem["EmployeeName"] =t.Employee;
                            newItem["TripStart"] = t.TripStart;
                            newItem["TripEnd"] = t.TripEnd;
                            newItem["TripType"] = t.TripType;
                            newItem["TripDetails"] = t.TripDetails;
                            newItem["EstimatedBudget"] = t.Budget;
                            newItem["ApprovingManager"] = t.Approver;
                            newItem["TotalExpenses"] = t.ExpenseTotal;
                            newItem["Notes"] = t.Notes;
                            newItem["TripStatus"] = t.Status;
                            newItem.Update();
                     
                        }
                    }
                   if(list2 != null)
                    {
                        SPListItem newItem2 = list.Items.Add();
                        {
                            web.AllowUnsafeUpdates = true;
                            newItem2["ExpenseDateTime"] = e.Date;
                            newItem2["ExpenseType"] = e.TyoeOfExpense;
                            newItem2["Narration"] = e.Narration;
                            newItem2["Amount"] = e.Amount;
                            newItem2["TripRef"] = t.TripName;
                       
                        }
                    }
                   
                }

            }
            catch
            {

            }
        }
      public void cancel(Trip t ,Expense e)
        {
           
        }
        
         
    }
}
