using System;
using System.Collections;
using System.Collections.Generic;
using PX.SM;
using PX.Data;


namespace RB.RabitByte
{
    public class SupplierMaint : PXGraph<SupplierMaint, Supplier>
    {
        public PXSelect<Supplier> Suppliers;
        public PXSelect<Supplier, 
            Where<Supplier.supplierID, 
            Equal<Current<Supplier.supplierID>>>> SelectedSupplier;
        public PXSelectJoin<SupplierProduct, 
            LeftJoin<Product, On<Product.productID, Equal<SupplierProduct.productID>>>, 
            Where<SupplierProduct.supplierID, Equal<Current<Supplier.supplierID>>>> SupplierProducts; 

    }
}