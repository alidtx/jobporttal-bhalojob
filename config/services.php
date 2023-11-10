<?php

return [
    /*
      |--------------------------------------------------------------------------
      | Third Party Services
      |--------------------------------------------------------------------------
      |
      | This file is for storing the credentials for third party services such
      | as Stripe, Mailgun, SparkPost and others. This file provides a sane
      | default location for this type of information, allowing packages
      | to have a conventional place to find your various credentials.
      |
     */
    'mailgun' => [
        'domain' => env('MAILGUN_DOMAIN'),
        'secret' => env('MAILGUN_SECRET'),
    ],
    'ses' => [
        'key' => env('SES_KEY'),
        'secret' => env('SES_SECRET'),
        'region' => 'us-east-1',
    ],
    'sparkpost' => [
        'secret' => env('SPARKPOST_SECRET'),
    ],
    'stripe' => [
        'model' => App\User::class,
        'key' => env('STRIPE_KEY'),
        'secret' => env('STRIPE_SECRET'),
    ],

    //socialite
    // 'github' => [
    //     'client_id' => env('GITHUB_CLIENT_ID'),
    //     'client_secret' => env('GITHUB_CLIENT_SECRET'),
    //     'redirect' => 'http://example.com/callback-url',
    // ],
    'google' => [
        'client_id' => env('GOOGLE_CLIENT_ID'),
        'client_secret' => env('GOOGLE_CLIENT_SECRET'),
        'redirect' => '/auth/google/callback',
    ],

//    'facebook' => [
//        'client_id'     => env('FB_CLIENT_ID'),
//        'client_secret' => env('FB_CLIENT_SECRET'),
//        'redirect'      =>  'http://localhost:8000/auth/facebook/callback',
//    ],


    // 'google' => [
    //     'client_id' => '140734460864-su4b331nenivln96cb32urq4t7tjpr19.apps.googleusercontent.com',
    //     'client_secret' => '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',
    //     'redirect' => 'http://127.0.0.1:8000/auth/google/callback',
    // ],

    // 'facebook' => [
    //     'client_id' => '809749700437828',
    //     'client_secret' => '074502daad4ba9aaa40bb36496610182',
    //     'redirect' => 'http://localhost:8000/auth/facebook/callback',
    // ],
];
