﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LTI.Expenses.Model
{
   public class Expense
    {
        public DateTime Date
        {
            get;set;
        }

        public ExpenseTypes TyoeOfExpense
        {
            get;set;
        }

        public string Narration
        {
            get;set;
        }

        public double Amount
        {
            get;set;
        }

        public string BillScanUrl
        {
            get;set;
        }
    }
}
