package kr.bit.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.bit.entity.Board;
import kr.bit.entity.Member;

@Mapper	// 생략 가능
public interface BoardMapper {
	public List<Board> getList();
	public Member login(Member member);
	public void insert(Board board);
	public Board read(int idx);
	public void update(Board board);
	public void delete(int idx);
	public void replySeqUpdate(Board board);
	public void replyInsert(Board board);
}
