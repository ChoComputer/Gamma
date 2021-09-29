package org.game.user.persistence;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.game.user.domain.ConsumerVO;
import org.game.user.mapper.UserMapper;
import org.game.user.service.UserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class UserDAOImpl implements UserDAO{
	@Autowired
	SqlSession sql;
	
	@Autowired
	private UserMapper mapper;
	
	// 회원가입
	@Override
	public void userJoin(ConsumerVO userVO) throws Exception {
		// TODO Auto-generated method stub
		sql.insert("mapper.userJoin",userVO);
	}
	
	// 로그인
	@Override
	public ConsumerVO userLogin(ConsumerVO userVO) throws Exception {

		return sql.selectOne("mapper.userLogin",userVO);
	}

	// 회원 정보 수정
	@Override
	public void userModify(ConsumerVO userVO) throws Exception {
		sql.update("mapper.userModify",userVO);
	}
	
	// 회원탈퇴
	@Override
	public void userDelete(ConsumerVO userVO) throws Exception {
		sql.delete("mapper.userDelete",userVO);
	}
	// 아이디중복체크
	@Override
	public int idChk(ConsumerVO userVO) throws Exception {
		int result=sql.selectOne("mapper.idChk",userVO);
		return result;
	}
	// 패스워드 중복체크
	@Override
	public int passChk(ConsumerVO userVO) throws Exception {
		int result =sql.selectOne("mapper.passChk",userVO);
		return result;
	}




	

}