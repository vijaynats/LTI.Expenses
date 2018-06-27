using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using Microsoft.SharePoint;
using System.Linq;

namespace LTI.Expenses.WebParts
{

    public class MyTripsWebPart : WebPart
    {
        protected override void Render(HtmlTextWriter writer)
        {
            base.Render(writer);
            writer.Write("<table style='padding: 5px; border: 1px solid black;'>");
            writer.Write(@"<tr style='border: 1px solid black; height: 50px;'>
                                <th>Date</th>
                                <th>Trip Name</th>
                                <th>Status</th>
                                <th>Expenses</th>
                            </tr>");

            foreach (SPListItem item in this.getTrips())
            {
                writer.Write(@"<tr style='border: 1px solid black; height: 20px;'>
                                <td>{0}</td>
                                <td>{1}</td>
                                <td>{2}</td>
                                <td>{3}</td>
                               </tr>", 
                               item["StartDate"]
                               ,item["Title"]
                              , item["ApprovalStatus"]
                              , item["TotalExpenses"]);
            }
            writer.Write("</table>");
        }

        private SPListItemCollection getTrips()
        {
           SPSite site = new SPSite("http://intranet.trg7.int/");
            SPWeb web = site.RootWeb;
            SPList RecentTripList = web.Lists["Trips1"];
            var UserID = SPContext.Current.Web.CurrentUser.Name; 
            SPQuery q = new SPQuery();
            q.Query =string.Format( @"<Where>
     <Eq>
            <FieldRef Name='EmployeeName'/>
            <Value Type='User'>" +UserID+ @"</Value>
     </Eq>
</Where>
<OrderBy>
      <FieldRef Name='StartDate' Ascending='false' />
   </OrderBy>");
         q.RowLimit = 5;
         return RecentTripList.GetItems(q);
        }
    }
}
