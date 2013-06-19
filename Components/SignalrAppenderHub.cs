using Microsoft.AspNet.SignalR;
using Microsoft.AspNet.SignalR.Hubs;

namespace InspectorIT.RealTimeLogWatcher.Components
{
    [HubName("logWatcherHub")]
    public class SignalrAppenderHub : Hub
    {
        public SignalrAppenderHub()
        {
            SignalrAppender.LocalInstance.MessageLogged = OnMessageLogged;
        }

        public void OnMessageLogged(LogEntry e)
        {
            Clients.All.onLoggedEvent(e.FormattedEvent, e.LoggingEvent);
        }
    }
}