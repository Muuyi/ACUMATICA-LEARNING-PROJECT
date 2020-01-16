using System;
using System.Web.UI;
using Autofac;
using PX.Data;
using PX.Data.RelativeDates;
using PX.Data.Wiki.Parser;
using PX.Data.EP;

public class ServiceRegistration: Module
{
    protected override void Load(ContainerBuilder builder)
    {
        builder.RegisterType<FinancialPeriodManagerStub>().As<IFinancialPeriodManager>().SingleInstance();
        builder.RegisterType<TodayUTC>().As<ITodayUtc>().SingleInstance();
		builder.RegisterInstance<Func<Page, ISettings>>(PXWikiSettingsRelative.GetSettings).Named<Func<Page, ISettings>>("Relative");
        builder.RegisterType<EmptyNotificationSender>().As<INotificationSender>().PreserveExistingDefaults();
        builder.RegisterType<EmptyNotificationSender>()
            .As<INotificationSenderWithActivityLink>()
            .SingleInstance()
            .PreserveExistingDefaults();
    }
}