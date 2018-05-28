package final_project.kosta180.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import final_project.kosta180.domain.Accom;
import final_project.kosta180.domain.Day;
import final_project.kosta180.domain.ListPlan;
import final_project.kosta180.domain.Plan;

@Repository
public class PlannerDAOImpl implements PlannerDAO {
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace="final_project.kosta180.mapper.PlannerMapper";
	@Override
	public List<Plan> selectPlan(String member_id)throws Exception {
		
		return sqlSession.selectList(namespace+".selectPlan", member_id);
	}
	@Override
	public void insertPlan(Plan plan) throws Exception {
		sqlSession.insert(namespace+".insertPlan",plan);
	}
	@Override
	public int maxPlanCode(String member_id) throws Exception {
		return sqlSession.selectOne(namespace+".maxPlanCode",member_id);
	}
	@Override
	public void insertList(ListPlan listPlan) throws Exception {
		sqlSession.insert(namespace+".insertList", listPlan);
	}
	@Override
	public Plan selectPlanCode(int plan_code) throws Exception {
		return sqlSession.selectOne(namespace+".selectPlanCode",plan_code);
	}
	@Override
	public void insertAccom(Accom accom) throws Exception {
		sqlSession.insert(namespace+".insertAccom",accom);
	}
	@Override
	public Accom selectAccom(int list_code) throws Exception {
		return sqlSession.selectOne(namespace+".selectAccom", list_code);
	}
	@Override
	public List<Day> selectDay(int list_code) throws Exception {
		return sqlSession.selectList(namespace+".selectDay",list_code);
	}
	@Override
	public void insertDay(Day day) throws Exception {
		sqlSession.insert(namespace+".insertDay", day);
	}
	@Override
	public void deleteDay(int day_code) throws Exception {
		sqlSession.delete(namespace+".deleteDay", day_code);
	}
	@Override
	public List<ListPlan> selectList(int plan_code) throws Exception {
		return sqlSession.selectList(namespace+".selectList", plan_code);
	}
	@Override
	public void deletAccom(int list_code) throws Exception {
		sqlSession.delete(namespace+".deletAccom", list_code);
	}

}
