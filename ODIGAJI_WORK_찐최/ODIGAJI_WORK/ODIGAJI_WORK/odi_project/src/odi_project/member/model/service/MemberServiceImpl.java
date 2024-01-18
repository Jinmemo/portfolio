package odi_project.member.model.service;

import org.apache.ibatis.session.SqlSession;

import odi_project.common.template.Template;
import odi_project.member.model.dao.MemberDao;
import odi_project.member.model.vo.Member;

public class MemberServiceImpl implements MemberService {

	private MemberDao memberDao = new MemberDao();

	@Override
	public Member loginMember(Member m) {

		SqlSession sqlSession = Template.getSqlSession();

		Member loginUser = memberDao.loginMember(sqlSession, m);


		sqlSession.close();

		return loginUser;
	}

	public int insertMember(Member m) {

		SqlSession sqlSession = Template.getSqlSession();

		int result = memberDao.insertMember(sqlSession, m);

		if (result > 0) {
			sqlSession.commit();
		} else {
			sqlSession.rollback();
		}

		sqlSession.close();

		return result;
	}

	public int deleteMember(Member m) {

		SqlSession sqlSession = Template.getSqlSession();

		int result = memberDao.deleteMember(sqlSession, m);

		if (result > 0) {
			sqlSession.commit();
		} else {
			sqlSession.rollback();
		}
		sqlSession.close();

		return result;
	}

	public Member myPageMember(Member m) {

		
		SqlSession sqlSession = Template.getSqlSession();

		Member myPageMem = memberDao.myPageMember(sqlSession, m);

		sqlSession.close();

		return myPageMem;
	}

	public Member idfind(Member m) {
		
		SqlSession sqlSession = Template.getSqlSession();

		Member myPageMem = memberDao.idfind(sqlSession, m);

		sqlSession.close();

		return myPageMem;
	}

	public Member updatePwdMember(Member m) {

		SqlSession sqlSession = Template.getSqlSession();

		Member updatePwdMember = memberDao.updatePwdMember(sqlSession, m);

		sqlSession.close();

		return updatePwdMember;
	}


	public int pwdUpdate(Member m) {
		SqlSession sqlSession = Template.getSqlSession();

		int result = memberDao.pwdUpdate(sqlSession, m);

		if (result > 0) {
			sqlSession.commit();
		} else {
			sqlSession.rollback();
		}
		sqlSession.close();

		return result;
	}

	public Member idCheck(Member m) {
		
		SqlSession sqlSession = Template.getSqlSession();

		Member result = memberDao.idCheck(sqlSession,m);

		sqlSession.close();

		return result;
	}

	public int MemberUpdate(Member m) {
		
		SqlSession sqlSession = Template.getSqlSession();
		
		int result = memberDao.MemberUpdate(sqlSession, m);
		System.out.println(m);
		
		if(result > 0) {
			sqlSession.commit();
		} else {
			sqlSession.close();
		}
		
		sqlSession.close();
		
		return result;
	}

	public Member getMemberById(Member m1) {

		SqlSession sqlSession = Template.getSqlSession();

		Member myPageMem = memberDao.getMemberById(sqlSession, m1);

		sqlSession.close();

		return myPageMem;
	}

}