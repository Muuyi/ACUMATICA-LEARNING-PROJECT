using System;
using System.Collections;
using System.Collections.Generic;
using PX.SM;
using PX.Data;


namespace RB.RabitByte
{
    public class CustomerMaint : PXGraph<CustomerMaint,Customer>
    {
        public PXSave<Customer> Save;
        public PXCancel<Customer> Cancel;
        public PXInsert<Customer> Insert;
        public PXCopyPasteAction<Customer> CopyPaste;
        public PXDelete<Customer> Delete;
        public PXFirst<Customer> First;
        public PXPrevious<Customer> Previous;
        public PXNext<Customer> Next;
        public PXLast<Customer> Last;
        public PXSelect<Customer> Customers;
        protected void Customer_CountryCD_FieldUpdated(PXCache sender, PXFieldUpdatedEventArgs e)
        {
            Customer row = (Customer)e.Row;
            row.Region = null;
        }
    }
   
}