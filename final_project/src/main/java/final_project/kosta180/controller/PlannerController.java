package final_project.kosta180.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class PlannerController {
		
		@RequestMapping(value="/planner",method=RequestMethod.GET)
		public String planner() {
			return "planner/planner";
		}
}
