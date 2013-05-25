namespace InspectorIT.RealTimeLogWatcher.Components
{
    public class JsonLevel
    {
        public JsonLevel(log4net.Core.Level level)
        {
            this.DisplayName = level.DisplayName;
            this.Name = level.Name;
            this.Value = level.Value;
        }

        public JsonLevel()
        {
        }

        public string DisplayName { get; set; }

        public string Name { get; set; }

        public int Value { get; set; }
    }
}
