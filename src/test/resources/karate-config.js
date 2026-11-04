function fn() {

    var config = {
        baseUrl: 'https://restful-booker.herokuapp.com'
    };

    karate.configure('headers', {
        Accept: 'application/json',
        'Content-Type': 'application/json'
    });

    return config;
}