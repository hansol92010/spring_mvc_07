package kr.bit.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.bit.entity.Board;
import lombok.extern.log4j.Log4j;

@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class BoardMapperTest {
	
	@Autowired
	private BoardMapper boardMapper;
	
	/*
	@Test
	public void testGetList() {
		List<Board> list = boardMapper.getList();
		for(Board vo : list) {
			// System.out.println(vo);
			log.info(vo);
		}
	}
	*/
	
	@Test
	public void testInsert() {
		Board vo = new Board();
		vo.setMemID("bit2");
		vo.setTitle("TEST2");
		vo.setContent("select key 테스트");
		vo.setWriter("테스트관리자2");
		
		// int cnt = boardMapper.insert(vo);
		// log.info(cnt);
		
		boardMapper.insert(vo);
		log.info(vo);
	}
	
	
}
