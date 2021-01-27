package address;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AddCommitBL
 */
@WebServlet("/AddCommitBL")
public class AddCommitBL extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddCommitBL() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String name=request.getParameter("name");
		String address=request.getParameter("address");
		String tel=request.getParameter("tel");

		// telの‐を無くし、結合
		if(tel.getBytes().length >  0 && (tel.matches("[0-9]{3}-[0-9]{4}-[0-9]{4}")) ) {
		String tel1=tel.substring(0,3);
		String tel2=tel.substring(4,8);
		String tel3=tel.substring(9,13);
		tel=tel1 + tel2 + tel3;
		}




		//DB登録用のクエリを作成し（INSERT文）InsQueryへ設定している
		String InsQuery="INSERT INTO jyusyoroku (name,address,tel,delete_flg)VALUES('"+ name + "','" + address + "','" + tel + "','" + "0')";



		final String URL
		= "jdbc:mysql://localhost:3306/jyusyoroku?serverTimezone=JST";
		final String USER = "root";
		final String PASS = "";

		try {
			//Mysqlに繋げている（道順）
			Class.forName("com.mysql.cj.jdbc.Driver");
			} catch (ClassNotFoundException e1) {
			// TODO 自動生成された catch ブロック
			e1.printStackTrace();
			}
			//DBの鍵
			try(Connection conn =
			DriverManager.getConnection(URL, USER, PASS);
			//connが必要、connと(繋ぎたいSQL)をセットで使う

			PreparedStatement ps = conn.prepareStatement(InsQuery)){


			//DBに変更をかけている
			int i = ps.executeUpdate();

			 } catch (SQLException e) {
			// TODO 自動生成された catch ブロック
			e.printStackTrace();
			}


		 //ListBLに遷移している
	    getServletContext().getRequestDispatcher("/ListBL").forward(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
