package kr.bit.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.bit.entity.Board;
import kr.bit.service.BoardService;

@Controller
@RequestMapping("/board/*")
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	// 게시물 전체 리스트
	@GetMapping("list")
	public String getList(Model model) {
		List<Board> list = boardService.getList();
		model.addAttribute("list", list);	// 객체바인딩
		return "board/list";
	}
	
	// 게시물 작성 페이지
	@GetMapping("register")
	public String register() {
		return "board/register";
	}

	// 작성된 게시물 등록 처리
	@PostMapping("register")
	public String register(Board board, RedirectAttributes rttr) {
		// System.out.println("#####################" + board);	// 수집된 파라미터만 있는 board 객체
		boardService.register(board);
		//System.out.println("#####################" + board);	// selectKey 부분이 먼저 실행되어 idx와 boardGroup이 board 객체에 포함됨
		
		rttr.addFlashAttribute("result", "게시글이 등록되었습니다");
		
		return "redirect:/board/list";
	}
	
	// 상세보기  페이지
	@GetMapping("get")
	public String get(@RequestParam("idx") int idx, Model model) {
		Board board = boardService.get(idx);
		model.addAttribute("board", board);
		return "board/get";
	}
	
	// 수정 페이지
	@GetMapping("modify")
	public String modify(@RequestParam("idx") int idx, Model model) {
		Board board = boardService.get(idx);
		model.addAttribute("board", board);
		return "board/modify";
	}
	
	// 수정 처리
	@PostMapping("modify")
	public String modify(Board board, RedirectAttributes rttr) {
		boardService.modify(board);
		rttr.addFlashAttribute("result", "게시글이 수정되었습니다");
		return "redirect:/board/list";
	}
	
	// 게시글 삭제
	@GetMapping("remove")
	public String remove(@RequestParam("idx") int idx, RedirectAttributes rttr) {
		boardService.remove(idx);
		rttr.addFlashAttribute("result", "게시물이 삭제되었습니다");
		return "redirect:/board/list";
	}
	
	// 답글 작성 페이지
	@GetMapping("reply")
	public String reply(@RequestParam("idx") int idx, Model model) {
		Board board = boardService.get(idx);
		model.addAttribute("board", board);
		return "board/reply";
	}
	
	// 답글 처리
	@PostMapping("reply")
	public String reply(Board board) {
		boardService.replyProcess(board);
		return "redirect:/board/list";
	}
}
