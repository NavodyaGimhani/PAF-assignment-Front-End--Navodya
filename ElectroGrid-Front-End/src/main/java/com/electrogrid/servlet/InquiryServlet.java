package com.electrogrid.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.electrogrid.model.Inquiry;

import com.electrogrid.repository.InquiryRepository;

@WebServlet("/InquiryServlet")
public class InquiryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Inquiry inquiryObject = new Inquiry();

    public InquiryServlet() {
    	super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		PrintWriter pw = response.getWriter();
		response.setContentType("text/html");
		String dispatchPage;
		
		try {
			InquiryRepository inquiryRepository = new InquiryRepository();
			List <Inquiry> inquiries = inquiryRepository.getInquiries();
			
			request.setAttribute("inquiry_list", inquiries);
			
			if(inquiries != null) {
				dispatchPage = "InquiryList.jsp";
				RequestDispatcher dispatcher = request.getRequestDispatcher(dispatchPage);
				dispatcher.forward(request, response);
			}else {
				pw.println("<script type = 'text/javascript'>");
				pw.println("alert('Not Found Inquiry Details');");
				pw.println("location = 'InquiryServlet'");
				pw.println("</script>");
			}
			
		}catch (Exception ex){
			ex.printStackTrace();
		}
				
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
