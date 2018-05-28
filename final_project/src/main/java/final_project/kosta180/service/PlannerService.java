package final_project.kosta180.service;

import java.util.List;

import final_project.kosta180.domain.Accom;
import final_project.kosta180.domain.Day;
import final_project.kosta180.domain.ListPlan;
import final_project.kosta180.domain.Plan;

public interface PlannerService {
	public List<Plan> selectPlanService(String member_id)throws Exception;
	
	public void insertPlanService(Plan plan)throws Exception;
	
	public int maxPlanCodeService(String member_id)throws Exception;
	
	public void insertListService(ListPlan listPlan)throws Exception;
	
	public Plan selectPlanCodeService(int plan_code)throws Exception;
	
	public void insertAccomService(Accom accom)throws Exception;
	
	public Accom selectAccomService(int list_code)throws Exception;
	
	public void deletAccomService(int list_code)throws Exception;
	
	public List<Day> selectDayService(int list_code)throws Exception;
	
	public void insertDayService(Day day)throws Exception;
	
	public void DeleteDayService(int day_code)throws Exception;
	
	public List<ListPlan> selectListService(int plan_code)throws Exception;
}
