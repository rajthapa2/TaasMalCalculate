app.service("playerService", function ($http) {
    return ({
        submit: submit,
    }
    );

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
        }).error(function(data) {
        });


//        return ((request).then(handleSuccess, handleError));
    };

    function handleSuccess(response) {
        console.log(response.data);
        //return updateTotalMal(response.data);
    }

    function handleError(response) {
        console.log(response);
    }
});



//
//$http.post('/someUrl', { msg: 'hello word!' }).
//  success(function (data, status, headers, config) {
//      // this callback will be called asynchronously
//      // when the response is available
//  }).
//  error(function (data, status, headers, config) {
//      // called asynchronously if an error occurs
//      // or server returns response with an error status.
//  });