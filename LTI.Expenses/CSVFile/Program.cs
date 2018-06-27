using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.SharePoint.Client;
using System.Net;
using System.IO;


namespace CSVFile
{
    public class Program
    {
        public static void Main(string[] args)
        {
            Console.WriteLine("Importing Sales data...");
            ClientContext ctx = new ClientContext("http://intranet.trg3.int");

            //read csv file (comma separated values file)
            using (var reader = new StreamReader(@"C:\SalesRecord.csv"))
            {
                int count = 0;
                while (!reader.EndOfStream)
                {
                    string line = reader.ReadLine();
                    var cols = line.Split(',');

                    //create sp list item
                    ListItemCreationInformation iteminfo = new ListItemCreationInformation();
                    ListItem newItem = ctx.Web.Lists.GetByTitle("Sales").AddItem(iteminfo);
                    newItem["Title"] = cols[0];
                    newItem["Country"] = cols[1];
                    newItem["Product"] = cols[2];
                    newItem["Code"] = cols[3];
                    newItem["Amount"] = Double.Parse(cols[4]);

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
    

