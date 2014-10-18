app.service("playerService", function ($http) {
    return ({
        submit: submit,
    });

    function submit(players, totalMalFunction) {
        players.forEach(function (x) {
            delete x.$$hashKey;
        });

        var request = $http({
            url: 'Home/Calculate',
            method: "post",
            data: players
        });

        request.success(function (data) {
            return totalMalFunction(data);
        }).error(function () {
            alert("Something is wrong. Please correct it and submit it again");
        });
    };
});
