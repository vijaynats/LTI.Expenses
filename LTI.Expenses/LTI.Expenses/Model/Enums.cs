using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LTI.Expenses.Model
{
    public enum TripTypes
    {
        GeneralMeeting = 0,
        ServiceVisit = 1,
        SalesVisit = 2,
        Others = 3
    }
    public enum TripStatuses
    {
        Planned = 0,
        InProgress =1,
        Completed =2
    }
    public enum ExpenseTypes
    {      Travel = 0,
           LocalTravel =1,
           FoodandSnacks = 2,
           Stationery =3,
           InternetandMobile =4,
           Others= 5


    }
}
