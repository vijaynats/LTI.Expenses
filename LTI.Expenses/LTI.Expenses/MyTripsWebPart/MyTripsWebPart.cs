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
             writer.Write("<table>");
            writer.Write(@"<tr>
                                <th>Trip Name</th>
                                <th>Approval Status</th>
                                <th>Total Expenses</th>
                            </tr>");

            foreach (SPListItem item in this.getTrips())
            {
                writer.Write(@"<tr>
                                <td>{0}</td>
                                <td>{1}</td>
                                <td>{2}</td>
                               </tr>", item["Title"]
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
            q.Query = @"<Where>
     <Eq>
            <FieldRef Name='EmployeeName'/>
            <Value Type='User'>{UserID}</Value>
     </Eq>
</Where>";
           q.RowLimit = 10;
         return RecentTripList.GetItems(q);
        }
    }
}
