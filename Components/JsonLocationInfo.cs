using log4net.Core;

namespace InspectorIT.RealTimeLogWatcher.Components
{
    public class JsonLocationInfo
    {
        public JsonLocationInfo()
        {

        }

        public JsonLocationInfo(LocationInfo locationInfo)
        {
            this.ClassName = locationInfo.ClassName;
            this.FileName = locationInfo.FileName;
            this.FullInfo = locationInfo.FullInfo;
            this.LineNumber = locationInfo.LineNumber;
            this.MethodName = locationInfo.MethodName;
            this.StackFrames = locationInfo.StackFrames;
        }

        public string ClassName { get; set; }

        public string FileName { get; set; }

        public string FullInfo { get; set; }

        public string LineNumber { get; set; }

        public string MethodName { get; set; }

        public System.Diagnostics.StackFrame[] StackFrames { get; set; }
    }
}
