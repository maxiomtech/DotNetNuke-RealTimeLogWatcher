using System;
using DotNetNuke.Entities.Modules;

namespace InspectorIT.RealTimeLogWatcher.Components.Commmon
{
    public class CustomModuleBase : PortalModuleBase
    {

        protected void Page_Init(object sender, EventArgs e)
        {
            var currentCtl = this as PortalModuleBase;
            while (currentCtl == null || currentCtl.ModuleConfiguration == null)
            {
                currentCtl = currentCtl.Parent as PortalModuleBase;
            }

            ModuleConfiguration = currentCtl.ModuleConfiguration;
        }
    }
}