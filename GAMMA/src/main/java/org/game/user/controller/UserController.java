package org.game.user.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.game.friends.service.FriendsService;
import org.game.gamelibrary.domain.ResultLibraryVO;
import org.game.gamelibrary.service.GameLibraryService;
import org.game.user.domain.AuthVO;
import org.game.user.domain.ConsumerVO;
import org.game.user.service.UserMailSendService;
import org.game.user.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/user/*")
public class UserController {

	@Inject
	UserService service;
	@Inject
	BCryptPasswordEncoder pwdEncoder;

	@Autowired
	private FriendsService fservice;

	@Autowired
	private GameLibraryService libraryService;

	@GetMapping("/agreeJoin")
	private String agreeJoin() {
		log.info("약관의 동의");
		return "/user/agreeJoin";
	}

	// 유저프로필
	@PreAuthorize("permitAll")
	@GetMapping("/userPro")
	public String userPro(String cid, Principal principal, Model model) {

		if(principal != null) {
			String myCid = principal.getName();
			model.addAttribute("myCid", myCid);
		}
		System.out.println("cid값 : " + cid);

		ConsumerVO userVO = service.userGet(cid);
 
		System.out.println("userVO들어왓나 : " + userVO);
		model.addAttribute("cid", userVO.getCid());
		model.addAttribute("cadmin", userVO.getCadmin());
		model.addAttribute("nickname", userVO.getNickname());

		List<ResultLibraryVO> libraryList = libraryService.getAllConsumerLibrary(userVO.getCid());

		model.addAttribute("libraryList", libraryList);

		return "/user/userPro";
	}

	/*
	 * @PostMapping("/userPro") public String userPro(ConsumerVO userVO, Model
	 * model) {
	 * 
	 * service.userGet(userVO.getCid()); // 아마 이거 작성되어야 프로필 조회할 수 있을듯..
	 * model.addAttribute("result" ,fservice.fOrNot(null, userVO.getCid())); // null
	 * 에는 해당 로직으로 이동하면 나오는 user 정보 추가 예정, cid는 로그인 계정 log.info(fservice.fOrNot(null,
	 * userVO.getCid())); model.addAttribute("follower", null);
	 * model.addAttribute("following", userVO.getCid());
	 * 
	 * model.addAttribute("dto", service.userGet(userVO.getCid()));
	 * log.info("클릭한유저번호" + userVO); if (userVO.getAttachList() != null) {
	 * userVO.getAttachList().forEach(attach -> log.info(attach)); }
	 * 
	 * List<ResultLibraryVO> libraryList =
	 * libraryService.getAllConsumerLibrary(userVO.getCid());
	 * 
	 * model.addAttribute("libraryList", libraryList);
	 * 
	 * return "/user/userPro"; }
	 */

	@GetMapping("/userGet")
	public String userGet(HttpSession session, Model model) { // 세션 아이디, 어드민
		String cid = (String) session.getAttribute("session_cid");
		String cadmin = String.valueOf(session.getAttribute("session_cadmin"));
		model.addAttribute("cid", cid);
		model.addAttribute("cadmin", cadmin);
		return "/user/userGet";
	}

	// 유저 상제정보창
	@PreAuthorize("hasAnyRole('ROLE_MEMBER')")
	@PostMapping("/userGet")
	public String userGet(ConsumerVO userVO, Model model, Principal principal) {
		if (principal != null) {
			String cid = principal.getName();
			model.addAttribute("cid", cid);
			if (cid != null) {
				ConsumerVO consumer = service.userGet(cid);
				model.addAttribute("consumer", consumer);
				System.out.println("consumer : " + consumer);
			}
		}

		log.info("클릭한유저번호" + userVO);
		if (userVO.getAttachList() != null) {
			userVO.getAttachList().forEach(attach -> log.info(attach));
		}

		return "/user/userGet";
	}

	// 회원가입 get방식으로 접근여부 가능
	/*
	 * @GetMapping("/userJoin") public String userJoin() throws Exception {
	 * log.info("get방식회원가입접속");
	 * 
	 * return "/user/userJoin";
	 * 
	 * }
	 * 
	 * // 회원가입
	 * 
	 * @PostMapping("/userJoin") public String userJoin(ConsumerVO userVO) throws
	 * Exception { // log.info("회원가입"); // service.userJoin(userVO);
	 * 
	 * log.info("poset회원가입실행"); long result = service.idChk(userVO.getCid());
	 * log.info("result값: " + result); try { if (result == 1) { return
	 * "/user/userJoin"; } else if (result == 0) { // String inputPass =
	 * userVO.getPassword(); // String pwd = pwdEncoder.encode(inputPass); //
	 * userVO.setPassword(pwd); service.userJoin(userVO); }
	 * 
	 * } catch (Exception e) { throw new RuntimeException(); }
	 * 
	 * return "/user/userLogin"; }
	 */
	/*
	 * @PreAuthorize("permitAll")
	 * 
	 * @PostMapping("/userJoin") public String userJoin(ConsumerVO userVO, String[]
	 * role) throws Exception { // log.info("회원가입"); // service.userJoin(userVO);
	 * log.info("가입시받는데이터" + userVO); log.info("권한받은거" + role);
	 * 
	 * String beforeCrPw = userVO.getPassword();
	 * 
	 * log.info("poset회원가입실행"); long result = service.idChk(userVO.getCid());
	 * log.info("result값: " + result); try { if (result == 1) { return
	 * "/user/userJoin"; } else if (result == 0) { // String inputPass =
	 * userVO.getPassword(); // String pwd = pwdEncoder.encode(inputPass); //
	 * userVO.setPassword(pwd); service.userJoin(userVO); }
	 * 
	 * } catch (Exception e) { throw new RuntimeException(); }
	 * 
	 * return "/user/userLogin"; }
	 */

	/*
	 * @GetMapping("/userHome") public String home(Locale locale, Model model) {
	 * log.info("userHome실행");//로깅이 안되는거같네요. 우선 System.out.println으로 대체해서 디버깅하시고.
	 * System.out.println("userHome접속함"); Date date = new Date(); DateFormat
	 * dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG,
	 * locale);
	 * 
	 * String formattedDate = dateFormat.format(date);
	 * 
	 * model.addAttribute("serverTime", formattedDate);
	 * 
	 * return "/user/userHome"; }
	 */

	// get로그인
	/*
	 * @GetMapping("/userLogin") public String userLogin() throws Exception {
	 * 
	 * return "/user/userLogin"; }
	 */
	/*
	 * @SuppressWarnings("unused")
	 * 
	 * @PostMapping("/userLogin") public String userLogin(ConsumerVO userVO,
	 * HttpServletRequest req, RedirectAttributes rttr) throws Exception {
	 * log.info("로그인컨트롤실행"); HttpSession session = req.getSession(); String
	 * memberSession = String.valueOf(session.getAttribute("member"));
	 * System.out.println("멤버세션값 : " + memberSession); ConsumerVO login =
	 * service.userLogin(userVO);
	 * 
	 * System.out.println("UserVO : " + userVO); System.out.println("DB : " +
	 * login); System.out.println("UserVO의 비번 : " + userVO.getPassword());
	 * System.out.println("DB의 비번 : " + login.getPassword()); // boolean pwdMatch =
	 * pwdEncoder.matches(userVO.getPassword(), // login.getPassword()); //
	 * System.out.println("비번매칭 : " + pwdMatch); if (login == null) {
	 * session.setAttribute("member", null); memberSession =
	 * String.valueOf(session.getAttribute("member"));
	 * System.out.println("멤버세션값 else : " + memberSession);
	 * rttr.addFlashAttribute("msg", false);
	 * 
	 * return "redirect:/user/userLogin"; } boolean result =
	 * login.getPassword().equals(userVO.getPassword()); if(result==true){
	 * System.out.println("result 값 : " + result); session.setAttribute("member",
	 * login); session.setAttribute("session_cid", login.getCid());
	 * session.setAttribute("session_cadmin", login.getCadmin()); memberSession =
	 * String.valueOf(session.getAttribute("member"));
	 * System.out.println("멤버세션값 iftrue : " + memberSession); } else {
	 * session.setAttribute("member", null); memberSession =
	 * String.valueOf(session.getAttribute("member"));
	 * System.out.println("멤버세션값 else : " + memberSession);
	 * rttr.addFlashAttribute("msg", false); return "redirect:/user/userLogin"; //
	 * rttr.addF~ 는 return에 redirect: 안넣으면 안보내진다 } return
	 * "redirect:/user/userLogin"; }
	 */
	/*
	 * // 로그아웃 과 세션 초기화 // 시큐리티 적용 전 얘하나로만 했었음
	 * 
	 * @GetMapping("/userLogout") public String userLogout(HttpSession session)
	 * throws Exception { // security-con~ 에서 세션파기설정이되있음 session.invalidate();
	 * 
	 * return "redirect:/main/main"; }
	 */

	/*
	 * @GetMapping("/userLogin") public String userLogin() throws Exception {
	 * 
	 * return "/user/userLogin"; }
	 */

	/*
	 * @PreAuthorize("permitAll")
	 * 
	 * @SuppressWarnings("unused")
	 * 
	 * @PostMapping("/userLogin") public String userLogin(ConsumerVO userVO,
	 * HttpServletRequest req, RedirectAttributes rttr) throws Exception {
	 * log.info("로그인컨트롤실행"); System.out.println("넘어오는 cid : " + userVO.getCid());
	 * System.out.println("넘어오는 userVO : " + userVO); HttpSession session =
	 * req.getSession(); String memberSession =
	 * String.valueOf(session.getAttribute("member")); System.out.println("멤버세션값 : "
	 * + memberSession); ConsumerVO login = service.userLogin(userVO);
	 * 
	 * System.out.println("UserVO : " + userVO); System.out.println("DB : " +
	 * login); System.out.println("UserVO의 비번 : " + userVO.getPassword());
	 * System.out.println("DB의 비번 : " + login.getPassword()); boolean pwdMatch =
	 * pwdEncoder.matches(userVO.getPassword(), login.getPassword());
	 * System.out.println("비번매칭 : " + pwdMatch);
	 * 
	 * if (login == null) { session.setAttribute("member", null); memberSession =
	 * String.valueOf(session.getAttribute("member"));
	 * System.out.println("멤버세션값 else1 : " + memberSession);
	 * rttr.addFlashAttribute("msg", false);
	 * 
	 * return "redirect:/user/userLogin"; }
	 */
	
	/*
	 * 시큐리티 적용전 (비번복호화전) boolean result =
	 * login.getPassword().equals(userVO.getPassword());
	 * System.out.println("result 값 : "+result);
	 */
	/*
	 * if (pwdMatch == true) { System.out.println("비번매칭 : " + pwdMatch);
	 * session.setAttribute("member", login); session.setAttribute("session_cid",
	 * login.getCid()); session.setAttribute("session_cadmin", login.getCadmin());
	 * memberSession = String.valueOf(session.getAttribute("member"));
	 * System.out.println("멤버세션값 iftrue : " + memberSession); } else {
	 * session.setAttribute("member", null); memberSession =
	 * String.valueOf(session.getAttribute("member"));
	 * System.out.println("멤버세션값 else2 : " + memberSession);
	 * rttr.addFlashAttribute("msg", false); return "redirect:/user/userLogin"; //
	 * rttr.addF~ 는 return에 redirect: 안넣으면 안보내진다 } return
	 * "redirect:/user/userLogin"; }
	 */
	// 로그아웃 과 세션 초기화
	// 시큐리티 적용 전 얘하나로만 했었음
	/*
	 * @GetMapping("/userLogout") public String userLogout(HttpSession session)
	 * throws Exception { // security-con~ 에서 세션파기설정이되있음 session.invalidate();
	 * 
	 * return "redirect:/main/main"; }
	 */

	// 로그아웃 과 세션 초기화 시큐리티적용버전
	/*
	 * @GetMapping("/userLogout") public void userLogoutget() { // security-con~ 에서
	 * 세션파기설정이되있음 session.invalidate(); log.info("로그아웃 폼으로 이동"); }
	 * 
	 * @PostMapping("/userLogout") public void userLogout() {
	 * log.info("포스트방식으로 로그아웃 처리");
	 * 
	 * }
	 */

	// 겟으로 접근하는 수정창 -- ajax쓰기려고 넘김
	@GetMapping("/userModify")
	public String userModify() throws Exception {
		return "user/userModify";
	}

	// post 회원정보 수정
	@PostMapping("/userModify")
	public String registerUpdate(ConsumerVO vo, HttpSession session) throws Exception {
		String beforeCrPw = vo.getPassword();
		vo.setPassword(pwdEncoder.encode(beforeCrPw));

		vo.setAuthList(new ArrayList<AuthVO>());
		vo.getAuthList().add(new AuthVO());
		vo.getAuthList().get(0).setCid(vo.getCid());
		service.userModify(vo);
		session.invalidate();
		return "redirect:/user/userLogin";
	}

	// 회원 탈퇴 get
	@PreAuthorize("hasAnyRole('ROLE_MEMBER')")
	@GetMapping("/userDelete")
	public String userDelete(HttpSession session) throws Exception {
		return "/user/userDelete";
	}

	// 회원 탈퇴 post
	@PreAuthorize("hasAnyRole('ROLE_MEMBER')")
	@PostMapping("/userDelete")
	public String memberDelete(ConsumerVO vo, HttpSession session, RedirectAttributes rttr) throws Exception {

		ConsumerVO login = service.userGet(vo.getCid());

		 boolean pwdMatch = pwdEncoder.matches(vo.getPassword(),  login.getPassword()); 
		if(pwdMatch==true) {
		service.userDelete(vo);
		session.invalidate();
		}
		return "/user/userLogin";
	}
	
	// 비밀번호찾기 이메일발송
	@GetMapping("/findpw")
	public String findPwGet() throws Exception {
		return "/user/findpw";
	}

	@PostMapping("/findpw")
	public String findPwPost() throws Exception {
		return "/user/findpw";
	}

}