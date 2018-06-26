using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.SharePoint.Client;
using System.Net;
using System.IO;

namespace CSV
{
    public class Program
    {
        public static void Main(string[] args)
        {
            Console.WriteLine("Importing Trips data...");
            ClientContext ctx = new ClientContext("http://expenses.trg3.int");

            //read csv file (comma separated values file)
            using (var reader = new StreamReader(@"C:\TripsCSV.csv"))
            {
                int count = 0;
                while (!reader.EndOfStream)
                {
                    string line = reader.ReadLine();
                    var cols = line.Split(',');

                    //create sp list item
                    ListItemCreationInformation iteminfo = new ListItemCreationInformation();
                    ListItem newItem = ctx.Web.Lists.GetByTitle("Trips").AddItem(iteminfo);
                    newItem["Title"] = cols[0];
                    newItem["EmployeeName"] = cols[1];
                    newItem["TripStart"] = cols[2];
                    newItem["TripEnd"] = cols[3];
                    newItem["TripType"] = cols[4];
                    newItem["TripDetails"] = cols[5];
                    newItem["EstimatedBudget"] = cols[6];
                    newItem["ApprovingManager"] = cols[7];
                    newItem["TotalExpenses"] = cols[8];
                    newItem["Notes1"] = cols[9];
                    newItem["TripStatus"] = cols[10];

                    newItem.Update();
                    ctx.ExecuteQuery();
                    ctx.Load(newItem);
                    ctx.ExecuteQuery();
                    count++;
                }
                Console.WriteLine("Added {0} Records", count);
            }
            Console.ReadLine();
        }
    }
}

