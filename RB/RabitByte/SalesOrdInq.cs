using System;
using System.Collections;
using System.Collections.Generic;
using PX.SM;
using PX.Data;


namespace RB.RabitByte
{
    public class SalesOrdInq : PXGraph<SalesOrdInq>
    {
        public PXCancel<SalesOrderFilter> Cancel; 
        public PXFilter<SalesOrderFilter> Filter;
        public PXSelectReadonly<SalesOrder, 
            Where2<Where<Current<SalesOrderFilter.customerID>, IsNull, 
            Or<SalesOrder.customerID, Equal<Current<SalesOrderFilter.customerID>>>>, 
            And<Where<Current<SalesOrderFilter.status>, IsNull, 
            Or<SalesOrder.status, Equal<Current<SalesOrderFilter.status>>>>>>> Orders; 
    }
    [Serializable] 
    public class SalesOrderFilter : IBqlTable 
    {    
        #region CustomerID    
        public abstract class customerID : IBqlField    
        {    
        }    
        [PXInt]    
        [PXDefault]    
        [PXUIField(DisplayName = "Customer ID")]    
        [PXSelector(        
            typeof(Customer.customerID),        
            typeof(Customer.customerCD),        
            typeof(Customer.companyName),        
            SubstituteKey = typeof(Customer.customerCD))]    
        public virtual int? CustomerID { get; set; }    
        #endregion    
        #region Status    
        public abstract class status : PX.Data.IBqlField    
        {    
        }    
        [PXString(1, IsFixed = true)]    
        [PXUIField(DisplayName = "Status")]    
        [PXStringList(        
            new string[]        
            {            
                OrderStatus.Open,            
                OrderStatus.Hold,             
                OrderStatus.Approved,            
                OrderStatus.Completed        
            },        
            new string[]        
            {           
                OrderStatus.UI.Open,             
                OrderStatus.UI.Hold,             
                OrderStatus.UI.Approved,             
                OrderStatus.UI.Completed        
            })]    
        public virtual string Status { get; set; }    
        #endregion 
    } 
}