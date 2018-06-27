using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;//
using Microsoft.SharePoint;
using Microsoft.SharePoint.Client;


namespace CSV
{
     public class CSOM5
        {
            public static void Main(string[] args)
            {
                Console.WriteLine("Importing Sales data");
            ClientContext ctx = new ClientContext("http://expenses.trg2.int");

                //Read sales csv file

                using (var reader = new StreamReader(@"C:\SampleData.csv"))
                {
                    int count = 0;
                    while (!reader.EndOfStream)
                    {
                        string line = reader.ReadLine();
                        var cols = line.Split(','); //split needs character(not a string) ,denoted within ' '.

                        //creates SP List item
                        ListItemCreationInformation iteminfo = new ListItemCreationInformation();

                        ListItem newItem = ctx.Web.Lists.GetByTitle("Trips").AddItem(iteminfo);
                        newItem["Title"] = cols[0];
                        newItem["EmployeeName"] = cols[1];
                        newItem["TripStart"] = cols[2];
                        newItem["TripEnd"] = cols[3];
                        newItem["TripType"] = cols[4];
                        newItem["TripDetails"] = cols[5];
                        newItem["EstimatedBudget"] = Double.Parse(cols[6]);
                        newItem["TripStatus"] = cols[10];
                    newItem.Update();

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


