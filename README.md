DotNetNuke-RealTimeLogWatcher
=============================

DotNetNuke module to live monitor log4net logs.

### How it works

- Uses a custom log4net appender to send out messages through <code>SignalR</code>
- Enables you to pause the incoming messages to more closely inspect them.
- Clicking on a row will save it to a saved log section where it will stay until the page is refreshed or you click to remove it.
- You may change the number of log messages that are displayed at one time.
- You can clear the list of log messages at any time.
- Entries are color coded by their log level.

### Installation
- Install like any other module and add to a admin page.
- Add custom appender to your <code>DotNetNuke.log4net.config</code> found in the root of your DotNetNuke website.


```xml
	<appender name="SignalrAppender" type="InspectorIT.RealTimeLogWatcher.Components.SignalrAppender, InspectorIT.RealTimeLogWatcher">
		<layout type="log4net.Layout.PatternLayout">
			<conversionPattern value="%date %-5level - %message%newline" />
		</layout>
	</appender>
	<root>
		<level value="ALL" />
		<appender-ref ref="RollingFile" />
		<appender-ref ref="SignalrAppender"/>
	</root>
```


*Note:* If you set your root log level to <code>ALL</code> you'll want to add the following to your <code>RollingFile</code> so it doesn't fill up with <code>trace</code> messages.
```xml
<param name="Threshold" value="ERROR" />
```

### Roadmap
- Automatically add appender to <code>DotNetNuke.log4net.config</code>
- Counting recurring messages.

### Special Thanks

Thanks to *Chris Fulstow* and his [log4net.SignalR](https://github.com/ChrisFulstow/log4net.SignalR) project for giving me the idea.

### Screenshot

![ScreenShot](https://dl.dropboxusercontent.com/u/10620012/DotNetNuke-RealTimeLogWatcher.png)