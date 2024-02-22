package kr.bit.service;

import java.util.List;

import kr.bit.entity.Board;
import kr.bit.entity.Member;

public interface BoardService {
	public List<Board> getList();
	public Member login(Member member);
	public void register(Board board);
	public Board get(int idx);
	public void modify(Board board);
	public void remove(int idx);
	public void replyProcess(Board board);
}
