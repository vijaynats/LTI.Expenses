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

            if(trip!=null)
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
                         DisplayName="kavins",
                         Email= "kavins@trg6.int"
                    },
                    Approver = new Person()
                    {
                        LoginName = "TRG\\Administrator",
                        DisplayName = "Administrator",
                        Email = "admin@trg6.int"
                    }
                };
            }   

            return trip;                   
           
        }

        
      

    }
}
