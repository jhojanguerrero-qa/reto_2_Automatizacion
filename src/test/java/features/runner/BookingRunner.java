package features.runner;


import com.intuit.karate.junit5.Karate;

public class BookingRunner {
    @Karate.Test
    Karate runAllTest(){
        return Karate.run("classpath:features/booking/");
    }
}
