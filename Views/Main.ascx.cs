using System;
using InspectorIT.RealTimeLogWatcher.Components.Commmon;

namespace InspectorIT.RealTimeLogWatcher.Views
{
    public partial class Main : CustomModuleBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DotNetNuke.Framework.jQuery.RegisterJQueryUI(this.Page);
        }
    }
}