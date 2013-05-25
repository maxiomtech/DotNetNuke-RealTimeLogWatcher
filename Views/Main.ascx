<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Main.ascx.cs" Inherits="InspectorIT.RealTimeLogWatcher.Views.Main" %>

<script src="<%= ControlPath %>../Scripts/angular.min.js"></script>
<script src="<%= ControlPath %>../Scripts/moment.min.js"></script>
<script src="<%= ControlPath %>../Scripts/jquery.signalR-1.1.1.min.js"></script>
<script src='<%: ResolveClientUrl("~/signalr/hubs") %>'></script>
<script src="<%= ControlPath %>../js/hub.js"></script>


<div class="iitLogger"  ng-app="iitLogger" ng-controller="LoggerCtl">
    <a href="#" ng-click="toggleScroll($event)" class="dnnPrimaryAction">{{actionText()}}</a>
    <a href="#" ng-click="clearLog($event)" class="dnnSecondaryAction">Clear</a>  
    <input type="text" ng-model="showNumber" id="showNumber" class="showNumber" name="showNumber" />
    <table id="log-table">
        <tr>
            <th>Date</th>
            <th>Time</th>
            <th>Level</th>
            <th>Logger</th>
            <th>Message</th>
        </tr>
        <tr ng-repeat="log in logs | orderBy:'TimeStamp':true | limitTo:showNumber" 
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