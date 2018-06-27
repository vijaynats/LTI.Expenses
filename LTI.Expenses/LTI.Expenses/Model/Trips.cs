using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Microsoft.SharePoint;

namespace LTI.Expenses.Model
{
    public class TripsMaster
    {
        public TripsMaster()
        {

        }


        /// <summary>
        /// Retunrs a Trip by ListItem ID
        /// </summary>
        /// <param name="id">ListItem ID of the Trip</param>
        /// <returns></returns>
        public Trip getTripById(int id)
        {
            var trip = SPContext.Current.Site.RootWeb.Lists["Trips"].GetItemById(id);

            if (trip != null)
            {

                return new Trip()
                {
                    ID = int.Parse(trip["ID"].ToString()),
                    Budget = double.Parse(trip["EstimatedBudget"].ToString()),
                    TripStart = DateTime.Parse(trip["TripStart"].ToString()),
                    TripEnd = DateTime.Parse(trip["TripEnd"].ToString()),
                    TripType = (TripTypes)Enum.Parse(typeof(TripTypes), trip["TripStatus"].ToString().Replace(" ", "")),
                    TripDetails = trip["TripDetails"].ToString(),
                    ExpenseTotal = double.Parse(trip["TotalExpenses"].ToString()),
                    Notes = double.Parse(trip["Notes"].ToString()),
                    Status = (TripStatuses)Enum.Parse(typeof(TripStatuses), trip["TripStatus"].ToString().Replace(" ", "")),
                    TripName = trip["TripName"].ToString(),
                    Expenses = new List<Expense>(),
                    Employee = new Person()
                    {
                        LoginName = "TRG6\\kavins",
                        DisplayName = "kavins",
                        Email = "kavins@trg6.int"
                    },
                    Approver = new Person()
                    {
                        LoginName = "TRG\\Administrator",
                        DisplayName = "Administrator",
                        Email = "admin@trg6.int"
                    }
                };
            }

            else
            {
                return null;
            }
        }



        public bool AddNewTrip(Trip t)
        {
            try
            {
                SPList list = SPContext.Current.Web.Lists["Trips"];
                SPListItem newItem = list.Items.Add();
                newItem["TripName"] = t.TripName;
                newItem["EmployeeName"] = t.Employee;
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
            catch
            {
                return false;
            }

            return true;
        }




        public bool UpdateTrip(Trip t)
        {
            SPList list = SPContext.Current.Web.Lists["Trips"];

            SPListItem uItem = list.GetItemById(t.ID);
            try
            {
                uItem["TripName"] = t.TripName;
                uItem["EmployeeName"] = t.Employee;
                uItem["TripStart"] = t.TripStart;
                uItem["TripEnd"] = t.TripEnd;
                uItem["TripType"] = t.TripType;
                uItem["TripDetails"] = t.TripDetails;
                uItem["EstimatedBudget"] = t.Budget;
                uItem["ApprovingManager"] = t.Approver;
                uItem["TotalExpenses"] = t.ExpenseTotal;
                uItem["Notes"] = t.Notes;
                uItem["TripStatus"] = t.Status;
                uItem.Update();

            }
            catch
            {
                return false;
            }

            return true;
        }


        public bool DeleteTripById(int id)
        {
            try
            {
                SPList list = SPContext.Current.Web.Lists["Trips"];
                SPListItem item = list.GetItemById(id);
                item.Delete();
            }
            catch
            {
                return false;
            }

            return true;
        }
        public void deleteTrip(Trip t)
        {

            this.DeleteTripById(t.ID);
        }

    }
}

