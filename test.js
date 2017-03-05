function WelcomeController($scope,$timeout) {
    var text=["Welcome","Bienvenue","Ahlan wa sahlan","Willkommen","Bienvenido","Valkommen"];
    $scope.welcomeText = text[0];

    $scope.pos = 1;
    $scope.onTimeout = function(){
        mytimeout = $timeout($scope.onTimeout,3000);
	$scope.welcomeText = text[$scope.pos];
        $scope.pos = ($scope.pos + 1) % text.length;
    }
    var mytimeout = $timeout($scope.onTimeout,3000);
            
}


var welcomes=["Welcome","Bienvenue","Ahlan wa sahlan","Willkommen","Bienvenido","Valkommen"];
i = 0;
$('#welcomeText').text(function (j, origText) {
    return welcomes[i];
});

setInterval(

function () {
    i = (i + 1) % welcomes.length;
    $('#welcomeText').animate({
        'opacity': 0.25
    }, 1000, function () {
        $(this).text(welcomes[i]);
    }).animate({
        'opacity': 1
    }, 1000);
},
4000);
