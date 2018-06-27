using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LTI.Expenses.Model
{
    public class Trip
    {
        public Trip()
        {

        }

        /// <summary>
        /// List Item ID of the Trip
        /// </summary>
        public int ID
        {
            get;set;
        }

        /// <summary>
        /// Name of the Trip
        /// </summary>
        public string TripName
        {
            get; set;
        }

        /// <summary>
        /// Name of the employee
        /// </summary>
        public Person Employee
        {
            get; set;

        }

        /// <summary>
        /// Trip start date
        /// </summary>
        public DateTime TripStart
        {
            get;set;
        }

        /// <summary>
        /// Trip End Date
        /// </summary>
        public DateTime TripEnd
        {
            get;set;
        }

        /// <summary>
        /// Type of the Trip
        /// </summary>
        public TripTypes TripType
        {
            get;set;
        }

        /// <summary>
        /// Details of the Trip
        /// </summary>
        public string TripDetails
        {
            get; set;
        }

        /// <summary>
        /// Estimated Budget Details
        /// </summary>
        public double Budget
        {
            get;set;
        }

        /// <summary>
        /// Approving Manager Detail
        /// </summary>
        public Person Approver
        {
            get;set;
        }

        /// <summary>
        /// Total Expenses of the Trip
        /// </summary>
        public double ExpenseTotal
        {
            get;set;
        }

        /// <summary>
        /// Additional Notes Regarding the trip
        /// </summary>
        public string Notes
        {
            get; set;
        }

        /// <summary>
        /// Status of The Trip 
        /// </summary>
        public TripStatuses Status
        {
            get; set;
        }

        public IList<Expense> Expenses
        {
            get;
            set;
        }
    }
}
