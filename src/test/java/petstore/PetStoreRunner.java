package petstore;

import static org.junit.jupiter.api.Assertions.assertEquals;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import com.intuit.karate.junit5.Karate.Test;

class PetStoreRunner {

  //  @Karate.Test
 //   Karate testPetstore() {
  //      return Karate.run("petstore2").relativeTo(getClass());
  //  }

  @Test
    void testAll() {
        Results results = Runner.path("classpath:petstore") 
                .outputCucumberJson(true)
                .parallel(5); 
        
        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }

}