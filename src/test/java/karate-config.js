function fn() {
    // get system property 'karate.env'
    let env = karate.env;
    // settings to wait a response from servers 5 seconds
    karate.configure('connectTimeout', 5000);
    karate.configure('readTimeout', 5000);
    karate.log('karate.env property was:', env);

    if (!env) {
        env = 'dev';
    }

    var config = {
        env: env,
        //    baseUrl: 'https://686df563c9090c495387bde6.mockapi.io/api/v1/',
        // baseUrl: 'https://6878ff9563f24f1fdca06418.mockapi.io/api/v1/',
        user: 'juanito'
    }

    return config;
}