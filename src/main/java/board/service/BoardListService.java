package board.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.control.CommandProcess;

import board.bean.BoardDTO;
import board.bean.BoardPaging;
import board.dao.BoardDAO;

public class BoardListService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		//데이터
		int pg = Integer.parseInt(request.getParameter("pg"));

		//1페이지당 5개씩
		int endNum = pg*5;
		int startNum = endNum-4;

		//DB
		BoardDAO boardDAO = new BoardDAO();
		List<BoardDTO> list = boardDAO.getBoardList(startNum, endNum);
		
		//페이징 처리
		int totalA = boardDAO.getTotalA(); //총글수

		BoardPaging boardPaging = new BoardPaging();
		boardPaging.setCurrentPage(pg);
		boardPaging.setPageBlock(3);
		boardPaging.setPageSize(5);
		boardPaging.setTotalA(totalA);

		boardPaging.makePagingHTML();
		
		//세션
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("memId");
		
		//응답
		request.setAttribute("pg", pg);
		request.setAttribute("list", list);//객체를 실어보낸다.
		request.setAttribute("boardPaging", boardPaging); //페이징도 실어보내야 저기서 처리한다.
		
		return "/board/boardList.jsp";
	}

}
