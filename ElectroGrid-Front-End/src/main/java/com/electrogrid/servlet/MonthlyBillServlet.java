 package com.electrogrid.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.electrogrid.model.Inquiry;
import com.electrogrid.model.MonthlyBill;
import com.electrogrid.repository.InquiryRepository;
import com.electrogrid.repository.MonthlyBillRepository;

@WebServlet("/MonthlyBillServlet")
public class MonthlyBillServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	MonthlyBill monthlybillObject = new MonthlyBill();

    public MonthlyBillServlet() {
    	super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		PrintWriter pw = response.getWriter();
		response.setContentType("text/html");
		String dispatchPage;
		
		try {
			MonthlyBillRepository monthlybillRepository = new MonthlyBillRepository();
			List <MonthlyBill> monthlybills = monthlybillRepository.getMonthlyBill();
			
			request.setAttribute("monthlybill_list", monthlybills);
			
			if(monthlybills != null) {
				dispatchPage = "MonthlyBillList.jsp";
				RequestDispatcher dispatcher = request.getRequestDispatcher(dispatchPage);
				dispatcher.forward(request, response);
			}else {
				pw.println("<script type = 'text/javascript'>");
				pw.println("alert('Not Found MonthlyBill Details');");
				pw.println("location = 'MonthlyBillServlet'");
				pw.println("</script>");
			}
			
		}catch (Exception ex){
			ex.printStackTrace();
		}
				
	}

	// add monthlybill
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
			MonthlyBillRepository monthlybillRepository = new MonthlyBillRepository();
			MonthlyBill monthlybills = new MonthlyBill();
			
			String account_number = request.getParameter("account_number");
			String date = request.getParameter("date");
			String no_of_units = request.getParameter("no_of_units");
			String charge_of_the_month = request.getParameter("charge_of_the_month");
			String total_amount = request.getParameter("total_amount");
			

			monthlybills.setAccount_number(account_number);
			monthlybills.setDate(date);
			monthlybills.setNo_of_units(no_of_units);
			monthlybills.setCharge_of_the_month(charge_of_the_month);
			monthlybills.setTotal_amount(total_amount);

			String output = monthlybillRepository.addMonthlyBill(monthlybills);
			response.getWriter().write(output);
			}

		//delete monthlybill
		protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
			response.setContentType("text/html");
		    PrintWriter pw = response.getWriter();
			
			String monthlybillId = request.getParameter("id");
			
		    try {
		        //Class.forName("com.mysql.jdbc.Driver");
		        //String user = "root";
		        //String pass = "root";
		        //String query = "delete from user_details where email=?";
		        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/electro_grid", "root", "root");
		        PreparedStatement ps = con.prepareStatement("DELETE FROM `electro_grid`.`monthlybill` WHERE (`id` = ?);");
		        ps.setString(1, "name");

		        int i = ps.executeUpdate();

		        if(i > 0) {
		            System.out.println("monthlybill successfully removed...");
		        }

		    } catch (Exception e) {
		        System.out.println(e);
		    }
		}
		
		
	}