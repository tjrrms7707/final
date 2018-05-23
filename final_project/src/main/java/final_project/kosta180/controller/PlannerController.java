package final_project.kosta180.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import final_project.kosta180.domain.Plan;
import final_project.kosta180.service.PlannerServiceImpl;

@Controller
public class PlannerController {
		private String member_id = "kosta180";
		
		@Inject
		private PlannerServiceImpl service;
		
		@RequestMapping(value="/planner",method=RequestMethod.GET)
		public String planner(Model model)throws Exception {
			model.addAttribute("list", service.selectPlan(member_id));
			return "planner/planner";
		}
		@RequestMapping(value="/planner",method=RequestMethod.POST)
		public String planner(Plan plan)throws Exception{
			plan.setMember_id(member_id);
			service.insertPlan(plan);
			return "redirect:/planner";
		}
		
}
