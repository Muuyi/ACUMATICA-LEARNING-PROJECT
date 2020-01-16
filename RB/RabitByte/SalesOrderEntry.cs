using System;
using System.Collections;
using System.Collections.Generic;
using PX.SM;
using PX.Data;


namespace RB.RabitByte
{
    public class SalesOrderEntry : PXGraph<SalesOrderEntry,SalesOrder>
    {
        public PXSelect<SalesOrder> Orders; 
        public PXSelect<OrderLine, 
            Where<OrderLine.orderNbr, 
            Equal<Current<SalesOrder.orderNbr>>>> OrderDetails;
        protected virtual void SalesOrder_Hold_FieldUpdated(PXCache sender, PXFieldUpdatedEventArgs e) 
        { 
            SalesOrder order = (SalesOrder)e.Row; 
            if (order.Hold == true) 
            { 
                order.Status = OrderStatus.Hold; 
            } 
            else 
            { 
                order.Status = OrderStatus.Open; 
            } 
        }
        protected virtual void OrderLine_ProductID_FieldUpdated(PXCache sender, PXFieldUpdatedEventArgs e) 
        { 
            OrderLine line = (OrderLine)e.Row; 
            Product product = PXSelectorAttribute.Select<OrderLine.productID>(sender, line) as Product; 
            if (product != null) 
            { 
                line.UnitPrice = product.UnitPrice; 
                line.StockUnit = product.StockUnit; 
            } 
            else 
            { 
                line.UnitPrice = null; 
                line.StockUnit = null; 
            } 
        }
        protected decimal? CalcLinePrice(decimal? unitPrice, decimal? qty, decimal? discount) 
        { 
            return unitPrice * qty * (1 - discount / 100); 
        }
        protected virtual void OrderLine_UnitPrice_FieldUpdated(PXCache sender, PXFieldUpdatedEventArgs e) 
        { 
            OrderLine line = (OrderLine)e.Row; 
            line.LinePrice = CalcLinePrice(line.UnitPrice, line.OrderQty, line.DiscPct); 
        } 
        protected virtual void OrderLine_OrderQty_FieldUpdated(PXCache sender, PXFieldUpdatedEventArgs e) 
        { 
            OrderLine line = (OrderLine)e.Row; 
            line.LinePrice = CalcLinePrice(line.UnitPrice, line.OrderQty, line.DiscPct);
        } 
        protected virtual void OrderLine_DiscPct_FieldUpdated(PXCache sender, PXFieldUpdatedEventArgs e) 
        { 
            OrderLine line = (OrderLine)e.Row; 
            line.LinePrice = CalcLinePrice(line.UnitPrice, line.OrderQty, line.DiscPct); 
        }
        protected virtual void OrderLine_RowInserted(PXCache sender, PXRowInsertedEventArgs e)
        {
            OrderLine line = (OrderLine)e.Row;
            SalesOrder order = Orders.Current;
            bool isUpdated = false;
            if (line.LinePrice != null)
            {
                order.LinesTotal += line.LinePrice;
                isUpdated = true;
            }    
            if (line.TaxAmt != null)
            {        
                order.TaxTotal += line.TaxAmt;
                isUpdated = true;   
            }    
            if (isUpdated)        
                Orders.Update(order); 
        } 
        protected virtual void OrderLine_RowUpdated(PXCache sender, PXRowUpdatedEventArgs e) 
        {    
            OrderLine newLine = (OrderLine)e.Row;    
            OrderLine oldLine = (OrderLine)e.OldRow;    
            SalesOrder order = Orders.Current;    
            bool isUpdated = false;    
            if (!sender.ObjectsEqual<OrderLine.linePrice>(newLine, oldLine))
            {        
                if (oldLine.LinePrice != null)        
                {            
                    order.LinesTotal -= oldLine.LinePrice;        
                }        
                if (newLine.LinePrice != null)        
                {            
                    order.LinesTotal += newLine.LinePrice;        
                }        
                isUpdated = true;    
            }    
            if (!sender.ObjectsEqual<OrderLine.taxAmt>(newLine, oldLine))    
            {        
                if (oldLine.TaxAmt != null)       
                { 
                    order.TaxTotal -= oldLine.TaxAmt;
                }        
                if (newLine.TaxAmt != null)        
                {            
                    order.TaxTotal += newLine.TaxAmt;        
                }        
                isUpdated = true;    
            }    
            if (isUpdated)        
                Orders.Update(order); 
        } 
        protected virtual void OrderLine_RowDeleted(PXCache sender, PXRowDeletedEventArgs e) 
        { 
            OrderLine line = (OrderLine)e.Row; 
            SalesOrder order = Orders.Current; 
            PXEntryStatus orderStatus = Orders.Cache.GetStatus(order); 
            bool isDeleted = orderStatus == PXEntryStatus.InsertedDeleted || 
                orderStatus == PXEntryStatus.Deleted; 
            if (isDeleted)  return; 
            bool isUpdated = false; 
            if (line.LinePrice != null) 
            { 
                order.LinesTotal -= line.LinePrice; 
                isUpdated = true; 
            } 
            if (line.TaxAmt != null) 
            { 
                order.TaxTotal -= line.TaxAmt; 
                isUpdated = true; 
            } 
            if (isUpdated) 
                Orders.Update(order); 
        }
        protected virtual void SalesOrder_LinesTotal_FieldUpdated(PXCache sender, PXFieldUpdatedEventArgs e) 
        { 
            SalesOrder order = (SalesOrder)e.Row; 
            order.OrderTotal = order.LinesTotal + order.TaxTotal; 
        } 
        protected virtual void SalesOrder_TaxTotal_FieldUpdated(PXCache sender, PXFieldUpdatedEventArgs e) 
        { 
            SalesOrder order = (SalesOrder)e.Row; 
            order.OrderTotal = order.LinesTotal + order.TaxTotal; 
        }
        //SALES APPROVAL
        public void ApproveOrder(SalesOrder order, bool isMassProcess = false)
        {
            Orders.Current = order;
            if (order.Status == OrderStatus.Hold)
            {
                throw new PXException(String.Format(
                    "Order {0} is On Hold and cannot be approved.",
                    order.OrderNbr));
            }
            else if (order.Status != OrderStatus.Open)
            {
                throw new PXException(String.Format(
                    "Order {0} is already approved.", order.OrderNbr));
            }
            order.Status = OrderStatus.Approved;
            Orders.Update(order);
            Persist();
            if (isMassProcess)
            {
                PXProcessing.SetInfo(String.Format(
                    "Order {0} has been successfully approved.",
                    order.OrderNbr));
            }
        }
        //APPROVE ACTION
        public PXAction<SalesOrder> Approve; 
        [PXProcessButton] 
        [PXUIField(DisplayName = "Approve")] 
        protected virtual IEnumerable approve(PXAdapter adapter) 
        {    
            foreach (SalesOrder order in adapter.Get())    
            {        
                Actions.PressSave();
                PXLongOperation.StartOperation(this, delegate() 
                { 
                    SalesOrderEntry graph = PXGraph.CreateInstance<SalesOrderEntry>(); 
                    graph.ApproveOrder(order); 
                }); 
                yield return order;
            }
        }
        //MAKING APPROVED SALES MODULE IN READ ONLY MODE
        protected virtual void SalesOrder_RowSelected(PXCache sender, PXRowSelectedEventArgs e) 
        { 
            SalesOrder order = (SalesOrder)e.Row; 
            if (order == null) return; 
            bool editable = order.Status != 
                OrderStatus.Approved && order.Status != 
                OrderStatus.Completed; 
            Orders.Cache.AllowUpdate = editable; 
            Orders.Cache.AllowDelete = editable; 
            PXUIFieldAttribute.SetEnabled(sender, order, editable); 
            OrderDetails.Cache.AllowDelete = editable; 
            OrderDetails.Cache.AllowInsert = editable; 
            OrderDetails.Cache.AllowUpdate = editable; 
            Approve.SetEnabled(editable && order.Hold != true); 
        } 
    }
}