package final_project.kosta180.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import final_project.kosta180.domain.Accom;
import final_project.kosta180.domain.Day;
import final_project.kosta180.domain.ListPlan;
import final_project.kosta180.domain.Plan;
import final_project.kosta180.etc.TransDate;
import final_project.kosta180.service.PlannerServiceImpl;

@Controller
public class PlannerController {
		private String member_id = "kosta180";
		private static final TransDate transdate = new TransDate();
		@Inject
		private PlannerServiceImpl service;
		
		@RequestMapping(value="/planner",method=RequestMethod.GET)
		public String planner()throws Exception {
			return "planner/planner";
		}
		@RequestMapping(value="plannerJson",method=RequestMethod.GET)
		public ResponseEntity<List<Plan>> listPlan(){
			ResponseEntity<List<Plan>> entity = null;
			try {
				entity=new ResponseEntity<>(service.selectPlanService(member_id),HttpStatus.OK);
			} catch (Exception e) {
				e.printStackTrace();
				entity= new ResponseEntity<>(HttpStatus.BAD_REQUEST);
			}
			return entity;
		}
		@RequestMapping(value="/planner",method=RequestMethod.POST)
		public ResponseEntity<String> test(@RequestBody Plan plan)throws Exception{
			int minusDate = Integer.parseInt(transdate.diffOfDate(plan.getStart_date(),plan.getEnd_date()));
			
			ResponseEntity<String> entity = null;
			try {
				service.insertPlanService(plan);
				int plan_code = service.maxPlanCodeService(member_id);
				ListPlan listPlan = new ListPlan();
				listPlan.setPlan_code(plan_code);
				for(int i=1;i<=minusDate;i++) {
					listPlan.setList_day(i);
					service.insertListService(listPlan);
				}
				entity= new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
			} catch (Exception e) {
				e.printStackTrace();
				entity= new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
			}
			return entity;
		}
		@RequestMapping(value="plannerDetail",method=RequestMethod.GET)
		public String plannerDetail(@RequestParam("plan_code") int plan_code,Model model)throws Exception {
			Plan plan = service.selectPlanCodeService(plan_code);
			List<ListPlan> listPlan = service.selectListService(plan_code);
			List<String> listDay = transdate.gapDate(plan.getStart_date(), plan.getEnd_date());
			model.addAttribute("listDay",listDay);
			model.addAttribute("plan",plan);
			model.addAttribute("listPlan", listPlan);
			return "planner/plannerDetail";
		}
		//숙소
		@RequestMapping(value="accom",method=RequestMethod.POST)
			public String accom1(@RequestParam("list_code") int list_code,Model model){
				model.addAttribute("list_code", list_code);
				try {
					Accom accom = service.selectAccomService(list_code);
					model.addAttribute("accom",accom);
				} catch (Exception e) {
					e.printStackTrace();
				}
				return "planner/accom";
			}
		@RequestMapping(value="insertAccom",method=RequestMethod.POST)
		public ResponseEntity<String> accom(@RequestBody Accom accom)throws Exception{
			ResponseEntity<String> entity = null;
			try {
				service.insertAccomService(accom);
				entity = new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
			} catch (Exception e) {
				e.printStackTrace();
				entity= new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
			}
			return entity;
		}
		@RequestMapping(value="accomJson/{list_code}",method=RequestMethod.GET)
		public ResponseEntity<Accom> listAccom(@PathVariable("list_code") int list_code){
			ResponseEntity<Accom> entity = null;
			try {
				entity=new ResponseEntity<>(service.selectAccomService(list_code),HttpStatus.OK);
			} catch (Exception e) {
				e.printStackTrace();
				entity= new ResponseEntity<>(HttpStatus.BAD_REQUEST);
			}
			return entity;
		}
		@RequestMapping(value="deleteAccom/{list_code}",method=RequestMethod.DELETE)
		public ResponseEntity<String> deleteAccom(@PathVariable("list_code") int list_code){
			ResponseEntity<String> entity = null;
			try {
				service.deletAccomService(list_code);
				entity = new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
			} catch (Exception e) {
				e.printStackTrace();
				entity = new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
			}
			return entity;
		}
		//일정
		@RequestMapping(value="dayJson/{list_code}",method=RequestMethod.GET)
		public ResponseEntity<List<Day>> dayJson(@PathVariable("list_code") int list_code) {
			ResponseEntity<List<Day>> entity = null;
			try {
				entity=new ResponseEntity<>(service.selectDayService(list_code),HttpStatus.OK);
			} catch (Exception e) {
				e.printStackTrace();
				entity= new ResponseEntity<>(HttpStatus.BAD_REQUEST);
			}
			return entity;
		}
		@RequestMapping(value="insertDay",method=RequestMethod.POST)
		public ResponseEntity<String> insertList(@RequestBody Day day){
			ResponseEntity<String> entity = null;
			try {
				service.insertDayService(day);
				entity= new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
			} catch (Exception e) {
				e.printStackTrace();
				entity= new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
			}
			return entity;
		}
		@RequestMapping(value="day",method=RequestMethod.GET)
		public String day(@RequestParam("list_code") int list_code,Model model) {
			model.addAttribute("list_code", list_code);
			return "planner/1day";
		}
		@RequestMapping(value="deleteDay/{day_code}",method=RequestMethod.DELETE)
		public ResponseEntity<String> deleteDay(@PathVariable("day_code") int day_code){
			ResponseEntity<String> entity = null;
			try {
				service.DeleteDayService(day_code);
				entity=new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
			} catch (Exception e) {
				e.printStackTrace();
				entity=new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
				}
			return entity;
		}
		
}
