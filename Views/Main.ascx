<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Main.ascx.cs" Inherits="InspectorIT.RealTimeLogWatcher.Views.Main" %>
<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.Web.Client.ClientResourceManagement" Assembly="DotNetNuke.Web.Client" %>

<dnn:DnnJsInclude ID="DnnJsInclude2" runat="server" FilePath="~/DesktopModules/InspectorIT/RealTimeLogWatcher/js/angular.min.js" Priority="101"  />
<dnn:DnnJsInclude ID="DnnJsInclude3" runat="server" FilePath="~/DesktopModules/InspectorIT/RealTimeLogWatcher/js/moment.min.js" Priority="102"  />
<dnn:DnnJsInclude ID="DnnJsInclude4" runat="server" FilePath="~/DesktopModules/InspectorIT/RealTimeLogWatcher/js/jquery.signalR-1.1.1.min.js" Priority="103"  />
<dnn:DnnJsInclude ID="DnnJsInclude5" runat="server" FilePath="~/signalr/hubs" Priority="104"  />
<dnn:DnnJsInclude ID="DnnJsInclude1" runat="server" FilePath="~/DesktopModules/InspectorIT/RealTimeLogWatcher/js/Main.js" Priority="106"  />


<div class="iitLogger"  ng-app="iitLogger" ng-controller="LoggerCtl">
    <a href="#" ng-click="toggleScroll($event)" class="dnnPrimaryAction">{{actionText()}}</a>
    <a href="#" ng-click="clearLog($event)" class="dnnSecondaryAction">Clear</a>  
    <input type="text" ng-model="showNumber" id="showNumber" class="showNumber" name="showNumber" />
    <select id="ddlLevel" ng-model="level">
        <option>ALL</option>
        <option>VERBOSE</option>
        <option>TRACE</option>
        <option>DEBUG</option>
        <option>INFO</option>
        <option>NOTICE</option>
        <option>WARN</option>
        <option>ERROR</option>
        <option>SEVERE</option>
        <option>CRTICAL</option>
        <option>ALERT</option>
        <option>FATAL</option>
        <option>EMERGENCY</option>
    </select>
    <table id="log-table">
        <tr>
            <th>Date</th>
            <th>Time</th>
            <th>Level</th>
            <th>Logger</th>
            <th>Message</th>
        </tr>
        <tr ng-repeat="log in logs | orderBy:'TimeStamp':true | limitTo:showNumber | filter:levelFilter" 
            class="{{log.Level.Name.toLowerCase()}}" 
            ng-class-even="'odd'"
            ng-click="saveLog()" 
            ng-animate="{enter:'customSlideDown-enter', leave:'customSlideDown-leave'}">
            <td><div>{{log.CleanDate}}</div></td>
            <td><div>{{log.CleanTime}}</div></td>
            <td><div>{{log.Level.Name}}</div></td>
            <td><div>{{log.LoggerName}}</div></td>
            <td class="message"><div>{{log.Message}}</div></td>
        </tr>
    </table>
    
    <div ng-show="savedLogs.length > 0">
    <h3>Saved Logs</h3>
        <table id="saved-table">
            <tr>
                <th>Date</th>
                <th>Time</th>
                <th>Level</th>
                <th>Logger</th>
                <th>Message</th>
            </tr>
            <tr ng-repeat="log in savedLogs" 
                class="{{log.Level.Name.toLowerCase()}}" 
                ng-click="removeSaved($index)"
                ng-animate="{enter:'customSlideDown-enter', leave:'customSlideDown-leave'}"
                ng-class-even="'odd'">
                <td><div>{{log.CleanDate}}</div></td>
                <td><div>{{log.CleanTime}}</div></td>
                <td><div>{{log.Level.Name}}</div></td>
                <td><div>{{log.LoggerName}}</div></td>
                <td class="message"><div>{{log.Message}}</div></td>
            </tr>
        </table>
    </div>
    
</div>