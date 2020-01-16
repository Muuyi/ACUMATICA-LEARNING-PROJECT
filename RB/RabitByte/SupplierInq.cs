using System;
using System.Collections;
using System.Collections.Generic;
using PX.SM;
using PX.Data;


namespace RB.RabitByte
{
    public class SupplierInq : PXGraph<SupplierInq>
    {
        // A filter is an ordinary DAC that consists of unbound data fields 
        // List selection parameters as fields of this class 
        [Serializable]
        public class SupplierFilter : IBqlTable
        {
            #region CountryCD
            public abstract class countryCD : PX.Data.IBqlField
            {
            }
            [PXString(2, IsUnicode = true)]
            [PXUIField(DisplayName = "Country ID")]
            [PXSelector(
                typeof(Search<Country.countryCD>),
                typeof(Country.countryCD),
                typeof(Country.description),
                DescriptionField = typeof(Country.description))]
            public string CountryCD { get; set; }
            #endregion
            #region MinOrderQty
            public abstract class minOrderQty : PX.Data.IBqlField
            {
            }
            [PXDecimal(2)]
            [PXUIField(DisplayName = "Min. Order Qty")]
            public decimal? MinOrderQty { get; set; }
            #endregion
            #region GroupBySupplier    
            public abstract class groupBySupplier : PX.Data.IBqlField    
            {    
            }
            [PXBool]
            [PXUIField(DisplayName = "Show Average Price")]
            public bool? GroupBySupplier { get; set; }
            #endregion
        }
        public PXCancel<SupplierFilter> Cancel;
        public PXFilter<SupplierFilter> Filter; 
        [PXFilterable]
        public PXSelectReadonly3<SupplierProduct, 
            InnerJoin<Supplier, On<Supplier.supplierID, 
            Equal<SupplierProduct.supplierID>>>, 
            OrderBy<Asc<SupplierProduct.productID, 
            Asc<SupplierProduct.supplierPrice, 
            Desc<SupplierProduct.lastPurchaseDate>>>>> SupplierProducts;
        protected virtual IEnumerable supplierProducts() {
            // Creating a dynamic query    
            // Data is ordered by the productID (and supplierID).    
            PXSelectBase<SupplierProduct> query =        
                new PXSelectReadonly3<SupplierProduct,            
                    InnerJoin<Supplier, On<Supplier.supplierID,                                
                    Equal<SupplierProduct.supplierID>>>,            
                    OrderBy<Asc<SupplierProduct.productID,                    
                    Asc<SupplierProduct.supplierID>>>>(this);    
            // Adding filtering conditions to the query    
            SupplierFilter filter = Filter.Current;    
            if (filter.CountryCD != null)        
                query.WhereAnd<Where<Supplier.countryCD,                           
                    Equal<Current<SupplierFilter.countryCD>>>>();    
            if (filter.MinOrderQty != null)        
                query.WhereAnd<Where<SupplierProduct.minOrderQty,                       
                    GreaterEqual<Current<SupplierFilter.minOrderQty>>>>();    
            // Returning the result of the query for the non-aggregated mode    
            if (filter.GroupBySupplier != true) return query.Select();    
            PXResultset<SupplierProduct, Supplier> result =        
                new PXResultset<SupplierProduct, Supplier>();    
            SupplierProduct pendingProduct = null;    
            Supplier pendingSupplier = null;    
            int supplierCount = 0;    
            List<string> countries = new List<string>();    
            // Iterating over all records returned by the query    
            foreach (PXResult<SupplierProduct, Supplier> record in query.Select())    
            {        
                SupplierProduct supplierProduct = (SupplierProduct)record;       
                Supplier supplier = (Supplier)record;        
                // Comparing the current supplier product with the previous one        
                if (pendingProduct != null && supplierProduct.ProductID !=                                      
                    pendingProduct.ProductID)        
                {            
                    CalcAggregates(ref pendingProduct, ref pendingSupplier,                           
                        ref supplierCount, countries);            
                    result.Add(new PXResult<SupplierProduct, Supplier>(                               
                        pendingProduct, pendingSupplier));            
                    ClearTotals(ref pendingProduct, ref pendingSupplier,                        
                        ref supplierCount, countries);        
                }        
                CalcTotals(supplierProduct, supplier, ref pendingProduct,                   
                    ref pendingSupplier, ref supplierCount, countries);    
            }    
            if (pendingProduct != null && pendingSupplier != null)    
            {        
                CalcAggregates(ref pendingProduct, ref pendingSupplier,                       
                    ref supplierCount, countries);        
                result.Add(new PXResult<SupplierProduct, Supplier>(            
                    pendingProduct, pendingSupplier));    
            }    
            return result;  
        } 
        protected void CalcTotals(    
            SupplierProduct supplierProduct, Supplier supplier,    
            ref SupplierProduct pendingProduct, ref Supplier pendingSupplier,    
            ref int supplierCount, List<string> countries) 
            {    
                if (pendingProduct == null || pendingSupplier == null)    
                {        
                    pendingProduct = supplierProduct;        
                    supplierCount++;        
                    pendingSupplier = supplier;        
                    if (!string.IsNullOrEmpty(supplier.CountryCD))            
                        countries.Add(supplier.CountryCD);    
                }    
                else    
                {        
                    pendingProduct.SupplierID = supplierProduct.SupplierID;        
                    pendingProduct.ProductID = supplierProduct.ProductID;        
                    pendingProduct.SupplierPrice += supplierProduct.SupplierPrice;        
                    // Selecting the maximum LastPurchaseDate value        
                    if (pendingProduct.LastPurchaseDate == null)            
                        pendingProduct.LastPurchaseDate = supplierProduct.LastPurchaseDate;        
                    else if (supplierProduct.LastPurchaseDate >                 
                        pendingProduct.LastPurchaseDate)            
                        pendingProduct.LastPurchaseDate = supplierProduct.LastPurchaseDate;        
                    // Selecting the minimum MinOrderQty value        
                    if (supplierProduct.MinOrderQty < pendingProduct.MinOrderQty)            
                        pendingProduct.MinOrderQty = supplierProduct.MinOrderQty;        
                    // Counting suppliers        
                    supplierCount++;        
                    if (!string.IsNullOrEmpty(supplier.CountryCD) &&            
                        !countries.Contains(supplier.CountryCD))            
                        countries.Add(supplier.CountryCD);    
                } } 
        protected void CalcAggregates(ref SupplierProduct pendingProduct,                              
            ref Supplier pendingSupplier,                              
            ref int supplierCount, List<string> countries) 
        {    
            // Calculating the average supplier price    
            pendingProduct.SupplierPrice = pendingProduct.SupplierPrice/supplierCount;    
            pendingSupplier.CountryCD = countries.Count.ToString(); 
        } 
        protected void ClearTotals(ref SupplierProduct pendingProduct,                           
            ref Supplier pendingSupplier,                           
            ref int supplierCount, List<string> countries) 
        {    
            pendingProduct = null;    
            pendingSupplier = null;    
            supplierCount = 0;    
            countries.Clear(); 
        } 
       public PXAction<SupplierFilter> ViewProduct;
       [PXButton]
       protected virtual void viewProduct()
       {
           SupplierProduct row = SupplierProducts.Current;
           // Creating the instance of the graph    
           ProductMaint graph = PXGraph.CreateInstance<ProductMaint>();
           // Setting the current product for the graph    
           graph.Products.Current = graph.Products.Search<Product.productID>(
               row.ProductID);
           // If the product is found by its ID, throw an exception to open    
           // a new window (tab) in the browser    
           if (graph.Products.Current != null)
           {
               throw new PXRedirectRequiredException(graph, true, "Product Details");
           }
       }
    }
}