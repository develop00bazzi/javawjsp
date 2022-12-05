package board;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class BoGoodPlusCommand implements BoardInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int idx=Integer.parseInt(request.getParameter("idx"));
	
		BoardVO vo=new BoardVO();
		
		BoardDAO dao=new BoardDAO();
		

    	dao.setBoGood(idx);
   

	}
}
