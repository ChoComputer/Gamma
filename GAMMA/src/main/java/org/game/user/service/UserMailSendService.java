package org.game.user.service;

import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.servlet.http.HttpServletRequest;

import org.game.user.dao.UserDao;
import org.game.user.domain.ConsumerVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class UserMailSendService {

	@Autowired
	private JavaMailSender mailSender;
	@Autowired
	private SqlSessionTemplate sqlSession;
	private UserDao userDao;
	
	// 이메일 난수 만드는 메서드
	private String init() {
		Random ran = new Random();
		StringBuffer sb = new StringBuffer();
		int num = 0;

		do {
			num = ran.nextInt(75) + 48;
			if ((num >= 48 && num <= 57) || (num >= 65 && num <= 90) || (num >= 97 && num <= 122)) {
				sb.append((char) num);
			} else {
				continue;
			}

		} while (sb.length() < size);
		if (lowerCheck) {
			return sb.toString().toLowerCase();
		}
		return sb.toString();
	}

	// 난수를 이용한 키 생성
	private boolean lowerCheck;
	private int size;

	public String getKey(boolean lowerCheck, int size) {
		this.lowerCheck = lowerCheck;
		this.size = size;
		return init();
	}

	// 회원가입 발송 이메일(인증키 발송)
	public void mailSendWithUserKey(String email, String cid, HttpServletRequest request) {
		
		String key = getKey(false, 20);
		userDao = sqlSession.getMapper(UserDao.class);
		userDao.GetKey(cid, key); 
		MimeMessage mail = mailSender.createMimeMessage();
		String htmlStr = "<h2>안녕하세요 <주>Gamma입니다!</h2><br><br>" 
				+ "<h3>" + cid + "님</h3>" + "<p>인증하기 버튼을 누르시면 로그인을 하실 수 있습니다 : " 
				+ "<a href='http://localhost:8181" + request.getContextPath() + "/user/key_alter?cid="+ cid +"&user_key="+key+"'>인증하기</a></p>"
				+ "(혹시 잘못 전달된 메일이라면 이 이메일을 무시하셔도 됩니다)";
		try {
			mail.setSubject("[본인인증] 회원님의 인증메일입니다", "utf-8");
			mail.setText(htmlStr, "utf-8", "html");
			mail.addRecipient(RecipientType.TO, new InternetAddress(email));
			mailSender.send(mail);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		
		// 아마존 주소 : http://54.180.117.142/MS/user/key_alter?user_id=
		
	}
	
	// 패스워드 찾기 이메일 발송
	public void mailSendWithPassword(String cid, String email) {
		// 비밀번호는 6자리로 보내고 데이터베이스 비밀번호를 바꿔준다
		String key = getKey(false, 6);
		userDao = sqlSession.getMapper(UserDao.class);
		// 비밀번호 바꿔주는 메서드
		userDao.searchPassword(cid, email, key); 
		// 회원 이름 꺼내는 코드
		ConsumerVO vo = userDao.userInfo(cid);
		String name = vo.getCid();
		
		System.out.println("비밀번호 찾기 : Service");
		
		MimeMessage mail = mailSender.createMimeMessage();
		String htmlStr = "<h2>안녕하세요 '"+ name +"' 님</h2><br><br>" 
				+ "<p>비밀번호 찾기를 신청해주셔서 임시 비밀번호를 발급해드렸습니다.</p>"
				+ "<p>임시로 발급 드린 비밀번호는 <h2 style='color : blue'>'" + key +"'</h2>이며 로그인 후 비밀번호를 변경해주시면 됩니다.</p><br>"
				+ "(혹시 잘못 전달된 메일이라면 이 이메일을 무시하셔도 됩니다)";
		try {
			mail.setSubject("[MS :p] 임시 비밀번호가 발급되었습니다", "utf-8");
			mail.setText(htmlStr, "utf-8", "html");
			mail.addRecipient(RecipientType.TO, new InternetAddress(email));
			mailSender.send(mail);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}

	// 인증 확인 메서드 (Y 값으로 바꿔주는 메서드)
	public int alter_userKey_service(String cid, String key) {
		
		int resultCnt = 0;
		
		userDao = sqlSession.getMapper(UserDao.class);
		resultCnt = userDao.alter_userKey(cid, key);
		
		return resultCnt;
	}
	
}


