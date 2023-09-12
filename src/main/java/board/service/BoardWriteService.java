package board.service;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.control.CommandProcess;

import board.dao.BoardDAO;

public class BoardWriteService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		//데이터
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		//JSP에선 세션이라는 내장객체를 쓰고있기 떄문에 문제없지만, 지금은 자바파일 써서 HttpSession 써야쓸수있다.
		//인터페이스라 new 못쓴다.  HttpSession session 이렇게 써야된다.
		HttpSession session = request.getSession(); // 자바에서 세션객체 사용.
		
		String id = (String)session.getAttribute("memId");
		String name = (String)session.getAttribute("memName");
		String email = (String)session.getAttribute("memEmail");

		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("name", name);
		map.put("email", email);
		map.put("subject", subject);
		map.put("content", content);
		//DB
		BoardDAO boardDAO = new BoardDAO();
		boardDAO.boardWrite(map);
		//응답
		return "/board/boardWrite.jsp";
	}

}
