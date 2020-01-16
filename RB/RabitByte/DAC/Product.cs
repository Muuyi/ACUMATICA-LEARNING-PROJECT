﻿namespace RB.RabitByte
{
	using System;
	using PX.Data;
	
	[System.SerializableAttribute()]
	public class Product : PX.Data.IBqlTable
	{
		#region ProductCD
		public abstract class productCD : PX.Data.IBqlField
		{
		}
		protected string _ProductCD;
		[PXDBString(15, IsUnicode = true,IsKey=true)]
		[PXDefault]
		[PXUIField(DisplayName = "Product ID")]
		public virtual string ProductCD
		{
			get
			{
				return this._ProductCD;
			}
			set
			{
				this._ProductCD = value;
			}
		}
		#endregion
		#region ProductName
		public abstract class productName : PX.Data.IBqlField
		{
		}
		protected string _ProductName;
		[PXDBString(50, IsUnicode = true)]
		[PXDefault()]
		[PXUIField(DisplayName = "Product Name")]
		public virtual string ProductName
		{
			get
			{
				return this._ProductName;
			}
			set
			{
				this._ProductName = value;
			}
		}
		#endregion
		#region StockUnit
		public abstract class stockUnit : PX.Data.IBqlField
		{
		}
		protected string _StockUnit;
		[PXDBString(20, IsUnicode = true)]
		[PXDefault()]
		[PXUIField(DisplayName = "Stock Unit")]
		public virtual string StockUnit
		{
			get
			{
				return this._StockUnit;
			}
			set
			{
				this._StockUnit = value;
			}
		}
		#endregion
		#region UnitPrice
		public abstract class unitPrice : PX.Data.IBqlField
		{
		}
		protected decimal? _UnitPrice;
		[PXDBDecimal(2)]
		[PXDefault(TypeCode.Decimal,"0.0")]
		[PXUIField(DisplayName = "Unit Price")]
		public virtual decimal? UnitPrice
		{
			get
			{
				return this._UnitPrice;
			}
			set
			{
				this._UnitPrice = value;
			}
		}
		#endregion
		#region MinAvailQty
		public abstract class minAvailQty : PX.Data.IBqlField
		{
		}
		protected decimal? _MinAvailQty;
		[PXDBDecimal(2)]
		[PXDefault(TypeCode.Decimal,"0.0")]
		[PXUIField(DisplayName = "Min. Avail. Qty")]
		public virtual decimal? MinAvailQty
		{
			get
			{
				return this._MinAvailQty;
			}
			set
			{
				this._MinAvailQty = value;
			}
		}
		#endregion
		#region tstamp
		public abstract class Tstamp : PX.Data.IBqlField
		{
		}
		protected byte[] _tstamp;
		[PXDBTimestamp()]
		public virtual byte[] tstamp
		{
			get
			{
				return this._tstamp;
			}
			set
			{
				this._tstamp = value;
			}
		}
		#endregion
		#region ProductID
		public abstract class productID : PX.Data.IBqlField
		{
		}
		protected int? _ProductID;
		[PXDBIdentity()]
		public virtual int? ProductID
		{
			get
			{
				return this._ProductID;
			}
			set
			{
				this._ProductID = value;
			}
		}
		#endregion
		#region Active
		public abstract class active : PX.Data.IBqlField
		{
		}
		protected bool? _Active;
		[PXDBBool()]
		[PXDefault(true,PersistingCheck = PXPersistingCheck.Nothing )]
		[PXUIField(DisplayName = "Active")]
		public virtual bool? Active
		{
			get
			{
				return this._Active;
			}
			set
			{
				this._Active = value;
			}
		}
		#endregion
	}
}
