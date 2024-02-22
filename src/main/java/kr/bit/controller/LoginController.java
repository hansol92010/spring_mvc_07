package kr.bit.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.bit.entity.Member;
import kr.bit.service.BoardService;

@Controller
@RequestMapping("/login/*")
public class LoginController {
	
	@Autowired
	private BoardService boardService;
	
	// 로그인 처리
	@PostMapping("loginProcess")
	public String login(Member member, HttpSession session) {
		Member mVo = boardService.login(member);
		if(mVo != null) {
			session.setAttribute("member", mVo);	// 객체 바인딩
			return "redirect:/board/list";
		}
		return "redirect:/board/list";
	}
	
	// 로그아웃 처리
	@PostMapping("logoutProcess")
	public String logout(HttpSession session) {
		session.invalidate();	// 세션 무효화(로그아웃)
		return "redirect:/board/list";
	}
	
}
