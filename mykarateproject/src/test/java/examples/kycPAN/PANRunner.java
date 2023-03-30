package examples.kycPAN;

import com.intuit.karate.junit5.Karate;

class PANRunner {
    
    @Karate.Test
    Karate testKYC() {
        return Karate.run("kycpanupdatesave").relativeTo(getClass());
    }    

}
