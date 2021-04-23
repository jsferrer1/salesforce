@istest
public class TestHelloWorld {

    @istest
    public static void TestHelloWorldFunction() {
        HelloWorldClass hello = new HelloWorldClass();
        Test.startTest();
        hello.HelloWorld();
        Test.stopTest();
    }

}