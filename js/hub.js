var iitLogger = iitLogger || {};
iitLogger.logs = [];
iitLogger.angular = angular.module('iitLogger', []);

iitLogger.angular.animation('customSlideDown-enter', function () {
    return {
        setup: function(elm) {
        },
        start: function(elm, done) {
            $(elm).find("td > div").slideDown(500, function() {
                done();
            });
        }
    };
});

iitLogger.angular.animation('customSlideDown-leave', function () {
    return {
        setup: function(elm) {
        },
        start: function(elm, done) {
            $(elm).find("td > div").slideUp(500, function() {
                done();
            });
        }
    };
});


iitLogger.log4net = $.connection.signalrAppenderHub;

iitLogger.log4net.client.onLoggedEvent = function (eventString, loggedEvent) {
    loggedEvent.CleanTime = moment(loggedEvent.TimeStamp).format("h:mm:ss A");
    loggedEvent.CleanDate = moment(loggedEvent.TimeStamp).format("MM/DD/YYYY");
    iitLogger.logs.push(loggedEvent);
    angular.element("#log-table").scope().update();
};

$.connection.hub.start().done(function () {
    //log4net.server.listen();
});


function LoggerCtl($scope,$timeout) {
    $scope.logs = iitLogger.logs;
    $scope.savedLogs = [];
    $scope.showNumber = 10;
    $scope.isEnabled = true;
    $scope.actionText = function () {
        return $scope.isEnabled ? "Pause" : "Continue";
    };
    $scope.update = function () {
        if ($scope.isEnabled) {
            $scope.$apply();
        }
    };

    $scope.toggleScroll = function(e) {
        e.preventDefault();
        $scope.isEnabled = !$scope.isEnabled;
    };

    $scope.clearLog = function(e) {
        e.preventDefault();
        $scope.logs = iitLogger.logs = [];
    };

    $scope.saveLog = function () {
        $scope.savedLogs.push(this.log);
    };

    $scope.removeSaved = function (index) {
        if (confirm("Are you sure you want to remove this saved log?")) {
            $scope.savedLogs.splice(index, 1);
        }
    };


}
