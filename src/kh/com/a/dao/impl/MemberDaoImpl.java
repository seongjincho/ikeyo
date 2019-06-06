package kh.com.a.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.com.a.dao.MemberDao;
import kh.com.a.model.BbsParam;
import kh.com.a.model.MemberDto;

@Repository
public class MemberDaoImpl implements MemberDao {
	@Autowired
	SqlSession sqlSession;
	String ns = "Member.";

	@Override
	public void memberInsert(MemberDto mem) {
		
		sqlSession.insert(ns + "memberInsert", mem);
	}

	@Override
	public String idcheck(String id) {
		
		return sqlSession.selectOne(ns + "idcheck", id);
	}

	@Override
	public String emailcheck(String email) {
		
		return sqlSession.selectOne(ns + "emailcheck", email);
	}

	@Override
	public String phonecheck(String phone) {
		
		return sqlSession.selectOne(ns + "phonecheck", phone);
	}

	@Override
	public MemberDto login(MemberDto mem) {
		
		return sqlSession.selectOne(ns + "login", mem);
	}

	@Override
	public void updateAuthKey(MemberDto mem) throws Exception {
		
		sqlSession.update(ns + "updateAuthKey", mem);
	}

	@Override
	public void userAuth(String email) throws Exception {
		
		sqlSession.update(ns + "userAuth", email);
	}

	@Override
	public MemberDto findId(MemberDto mem) {
		
		return sqlSession.selectOne(ns + "findId", mem);
	}

	@Override
	public void findPwd(MemberDto mem) {
		
		sqlSession.update(ns + "findPwd", mem);
	}

	@Override
	public void naverLogin(MemberDto mem) {
	
		sqlSession.insert(ns + "naverLogin", mem);
	}

	@Override
	public int naverLoginCount(MemberDto mem) {
		
		return sqlSession.selectOne(ns + "naverLoginCount", mem);
	}

	@Override
	public MemberDto naverEmailCheck(MemberDto mem) {
		
		return sqlSession.selectOne(ns + "naverEmailCheck", mem);
	}
	
	@Override 
	public List<MemberDto> getMemberList(BbsParam param) {
		
		return sqlSession.selectList(ns + "getMemberPagingList", param);
	}

	@Override
	public int getMemberCount(BbsParam param) {
		
		return sqlSession.selectOne(ns + "getMemberCount", param);
	}

	@Override
	public boolean memberDel(String id) {
		
		int n = sqlSession.update(ns + "memberDel", id);
		
	
		return n>0?true:false; 
	}

}
