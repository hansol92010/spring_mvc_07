package kr.bit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.bit.entity.Board;
import kr.bit.entity.Member;
import kr.bit.mapper.BoardMapper;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private BoardMapper boardMapper;

	@Override
	public List<Board> getList() {
		List<Board> list = boardMapper.getList();
		return list;
	}

	@Override
	public Member login(Member member) {
		Member mVo = boardMapper.login(member);
		return mVo;
	}

	@Override
	public void register(Board board) {
		boardMapper.insert(board);
	}

	@Override
	public Board get(int idx) {
		Board board = boardMapper.read(idx);
		return board;
	}

	@Override
	public void modify(Board board) {
		boardMapper.update(board);
	}

	@Override
	public void remove(int idx) {
		boardMapper.delete(idx);
	}

	@Override
	public void replyProcess(Board board) {
		// 1. 부모글(원글)의 정보를 가져오기
		Board parentBoard = boardMapper.read(board.getIdx());
		
		// 2. 부모글(원글)의 boardGroup의 값을 답글 정보에 저장
		board.setBoardGroup(parentBoard.getBoardGroup());
		
		// 3. 부모글(원글)의 boardSequence의 값에 1을 더해서 답글 정보에 저장
		board.setBoardSequence(parentBoard.getBoardSequence() + 1);
		
		// 4. 부모글(원글)의 boardLevel의 값에 1을 더해서 답글 정보에 저장
		board.setBoardLevel(parentBoard.getBoardLevel()+1);
		
		// 5. 같은 boardGroup에 있는 글 중에 부모글(원글)의 boardSequence보다 큰 값들을 모두 1씩 증가(업데이트)
		boardMapper.replySeqUpdate(parentBoard);
		
		// 6. 답글을 등록하기
		boardMapper.replyInsert(board);
		
	}

}
