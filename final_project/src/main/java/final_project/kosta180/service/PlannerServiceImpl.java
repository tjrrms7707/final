package final_project.kosta180.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import final_project.kosta180.domain.Accom;
import final_project.kosta180.domain.Day;
import final_project.kosta180.domain.ListPlan;
import final_project.kosta180.domain.Plan;
import final_project.kosta180.persistence.PlannerDAOImpl;

@Service
public class PlannerServiceImpl implements PlannerService {
	
	@Inject
	private PlannerDAOImpl dao;
	
	@Override
	public List<Plan> selectPlanService(String member_id)throws Exception {
		return dao.selectPlan(member_id);
	}

	@Override
	public void insertPlanService(Plan plan) throws Exception {
		dao.insertPlan(plan);
	}

	@Override
	public int maxPlanCodeService(String member_id) throws Exception {
		return dao.maxPlanCode(member_id);
	}

	@Override
	public void insertListService(ListPlan listPlan) throws Exception {
		dao.insertList(listPlan);
	}

	@Override
	public Plan selectPlanCodeService(int plan_code) throws Exception {
		return dao.selectPlanCode(plan_code);
	}

	@Override
	public void insertAccomService(Accom accom) throws Exception {
		dao.insertAccom(accom);
	}

	@Override
	public Accom selectAccomService(int list_code) throws Exception {
		return dao.selectAccom(list_code);
	}

	@Override
	public List<Day> selectDayService(int list_code) throws Exception {
		return dao.selectDay(list_code);
	}

	@Override
	public void insertDayService(Day day) throws Exception {
		dao.insertDay(day);
	}

	@Override
	public void DeleteDayService(int day_code) throws Exception {
		dao.deleteDay(day_code);
	}

	@Override
	public List<ListPlan> selectListService(int plan_code) throws Exception {
		return dao.selectList(plan_code);
	}

	@Override
	public void deletAccomService(int list_code) throws Exception {
		dao.deletAccom(list_code);
	}

}
