## Software Testing
- In each folder you will find one level of testing with its Readme file:
    1. Unit testing : test/unit_test
    3. E2E testing : integration_test (integration_test flutter package is user for e2e test)


### unit Testing

to run the test use the following command in the root of the project:
```
flutter test
```
I wrote 15 test cases for every function in the viewmodels

I used Mockito to mock all the services


### unit Testing

to run the test use the following command in the root of the project:
```
flutter test
```
I wrote 15 test cases for every function in the viewmodels

I used Mockito to mock all the services

### E2E Testing

to run the test use the following command in the root of the project:
```
flutter test integration_test
```
to run the test a runing emulateur is required

I wrote 2 test cases the first one is for login usecase and the second one for testing conversion usecase