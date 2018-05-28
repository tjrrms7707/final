package final_project.kosta180.persistence;

import java.util.Date;
import java.util.List;

import final_project.kosta180.domain.Accom;
import final_project.kosta180.domain.Day;
import final_project.kosta180.domain.ListPlan;
import final_project.kosta180.domain.Plan;

public interface PlannerDAO {
	public List<Plan> selectPlan(String member_id)throws Exception;
	
	public void insertPlan(Plan plan)throws Exception;
	
	public int maxPlanCode(String member_id)throws Exception;
	
	public void insertList(ListPlan listPlan)throws Exception;
	
	public List<ListPlan> selectList(int plan_code)throws Exception;
	
	public Plan selectPlanCode(int plan_code)throws Exception;
	
	public void insertAccom(Accom accom)throws Exception;
	
	public Accom selectAccom(int list_code)throws Exception;
	
	public void deletAccom(int list_code)throws Exception;
	
	public List<Day> selectDay(int list_code)throws Exception;
	
	public void insertDay(Day day)throws Exception;
	
	public void deleteDay(int day_code)throws Exception;
}
