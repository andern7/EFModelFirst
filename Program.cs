using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EFModelFirst
{
    class Program
    {
        static void Main(string[] args)
        {
            using(var db = new AccountingSystemContainer())
            {
                //Create new, empty entities after running SQL script generated to get model in database
                var invHeader = db.InvoiceHeaders.Create();
                var invDetails = db.InvoiceDetails.Create();

                invHeader.Total = 150M;
                invDetails.ItemDescription = "New Item";
                invDetails.Price = 75M;
                invDetails.Quantity = 2;

                invHeader.InvoiceDetails.Add(invDetails);
                db.InvoiceHeaders.Add(invHeader);
                db.SaveChanges();

            }
        }
    }
}
