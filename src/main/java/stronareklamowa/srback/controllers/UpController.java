package stronareklamowa.srback.controllers;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("api")
public class UpController {

    @GetMapping("/")
    public ResponseEntity<String> welcomePage (){
        return ResponseEntity.ok("App is running");
    }

}
