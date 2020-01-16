using System;
using System.Collections;
using System.Collections.Generic;
using PX.SM;
using PX.Data;


namespace RB.RabitByte
{
    public class ShipmentEntry : PXGraph<ShipmentEntry, Shipment>
    {
        public PXSelect<Shipment> Shipments; 
        public PXSelect<ShipmentLine, Where<ShipmentLine.shipmentNbr, 
            Equal<Current<Shipment.shipmentNbr>>>, 
            OrderBy<Desc<ShipmentLine.gift>>> ShipmentLines; 
    }
}