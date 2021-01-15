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
 * Servlet implementation class DeleteCommitBL
 */
@WebServlet("/DeleteCommitBL")
public class DeleteCommitBL extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteCommitBL() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		//変数の宣言、jspから受け取った情報を変数に格納する
		String name=request.getParameter("name");
		String address=request.getParameter("address");
		String tel=request.getParameter("tel");
		String UpdQuery="";
		String id=request.getParameter("id");
							

		
		
		//DB更新用（削除として）のクエリを作成しUpdQueryへ設定している
				UpdQuery="UPDATE jyusyoroku SET delete_flg ='1' Where ID=" +  id;


				final String URL
			    = "jdbc:mysql://localhost:3306/jyusyoroku?serverTimezone=JST";
			    final String USER = "root";
			    final String PASS = "";
			    //final String SQL = "select * from jyusyoroku;";

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
			        PreparedStatement ps = conn.prepareStatement(UpdQuery)){


			    	//DBに変更をかけている
			    	int i = ps.executeUpdate();
			    	getServletContext().getRequestDispatcher("/ListBL").forward(request, response);

			    } catch (SQLException e) {
					// TODO 自動生成された catch ブロック
					e.printStackTrace();
				}

						
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
