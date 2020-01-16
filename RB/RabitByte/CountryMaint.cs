using System;
using System.Collections;
using System.Collections.Generic;
using PX.SM;
using PX.Data;


namespace RB.RabitByte
{
    public class CountryMaint : PXGraph<CountryMaint>
    {
        public PXCancel<Country> Cancel;
        public PXSave<Country> Save;
        public PXSelect<Country> Countries;
    }
}