﻿namespace RB.RabitByte
{
	using System;
	using PX.Data;
	
	[System.SerializableAttribute()]
	public class Country : PX.Data.IBqlTable
	{
		#region CountryCD
		public abstract class countryCD : PX.Data.IBqlField
		{
		}
		protected string _CountryCD;
		[PXDBString(2, IsUnicode = true, IsKey = true)]
		[PXDefault()]
		[PXUIField(DisplayName = "Country Id")]
		public virtual string CountryCD
		{
			get
			{
				return this._CountryCD;
			}
			set
			{
				this._CountryCD = value;
			}
		}
		#endregion
		#region Description
		public abstract class description : PX.Data.IBqlField
		{
		}
		protected string _Description;
		[PXDBString(50, IsUnicode = true)]
		[PXUIField(DisplayName = "Description")]
		public virtual string Description
		{
			get
			{
				return this._Description;
			}
			set
			{
				this._Description = value;
			}
		}
		#endregion
	}
}
