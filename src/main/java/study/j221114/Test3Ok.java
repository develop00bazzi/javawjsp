package study.j221114;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/221114_Test3Ok")

public class Test3Ok extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");

		PrintWriter out=response.getWriter();
		
		String[] products=request.getParameterValues("product");
		
//		name이 같은 자료가 여러개이므로 배열로 처리!
		
		String strProduct="";
		
//		for(String product:products) {
//			strProduct+=product.trim()+"/";
//		}
		
		for(int i=0; i<products.length; i++) {
			if(products[i].trim()!="") {
				strProduct+=products[i].trim()+"/";
			}
		}
		
		if(!strProduct.equals("")) {
			strProduct=strProduct.substring(0,strProduct.length()-1);
		}
		else {
			out.println("<script>");
			out.println("alert('1개 이상의 상품은 등록하셔야 합니다!');");
			out.println("history.back();");
			out.println("</script>");
		}
		
		
		
		out.println("<p>등록하신 상품은?</p>");
		out.println("<p>"+strProduct+"</p>");
		out.println("<script>");
		out.println("alert('상품 등록 완료!');");
		out.println("</script>");
		out.println("<p><a href='"+request.getContextPath()+"/study/221114/test3.jsp'>돌아가기</a></p>");
	}

}
