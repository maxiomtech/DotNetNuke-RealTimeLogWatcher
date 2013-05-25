using System.Web.Routing;
using DotNetNuke.Web.Api;

namespace InspectorIT.RealTimeLogWatcher.Components
{
    public class RouteMapper : IServiceRouteMapper
    {
        public void RegisterRoutes(IMapRoute mapRouteManager)
        {
            RouteTable.Routes.MapHubs();
        }

    }
}