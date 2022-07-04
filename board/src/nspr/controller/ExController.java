package nspr.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ExController {

	@GetMapping("/error")
	public String Error() {
		
		return "bad";
	}

}
