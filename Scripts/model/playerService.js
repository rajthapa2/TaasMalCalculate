app.service("playerService", function ($http) {
    return ({
        submit: submit,
    }
    );

    function submit(players) {

	players.forEach(function(x) {
    delete x.$$hashKey;
		});

		//var data = JSON.stringify(players);


		var request = $http({
            url: 'Home/Calculate',
            method: "post",
            data: { Name: players[0].Name,
            		Mal: 1,
            		MalSeen: false,
					GameWon: false
            }
        });
        return ((request).then(handleSuccess, handleError));
        };

    function handleSuccess(response) {
        return (response.data);
    }

    function handleError(response) {
        console.log(response);
    }
});