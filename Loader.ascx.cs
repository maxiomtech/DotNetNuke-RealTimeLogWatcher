using System;
using InspectorIT.RealTimeLogWatcher.Components.Commmon;
using InspectorIT.RealTimeLogWatcher.Views;

namespace InspectorIT.RealTimeLogWatcher
{
    public partial class Loader : CustomModuleBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.Controls.Add(LoadControl(ControlPath + "Views/Main.ascx") as Main);
        }
    }
}