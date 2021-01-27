package address;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AddBL
 */
@WebServlet("/AddBL")
public class AddBL extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddBL() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//ADD.jspから値を受け取っている
		String name=request.getParameter("name");
		String address=request.getParameter("address");
		String tel=request.getParameter("tel");
		String errmsg="";

		//エラーメッセージの定数宣言
    	final String ERRMSG_NAME01="名前は全角20文字以内で入力してください";
    	final String ERRMSG_NAME02="名前は必須項目です";
    	final String ERRMSG_ADDRESS01="住所は全角40文字以内で入力してください";
    	final String ERRMSG_ADDRESS02="住所は必須項目です";
    	final String ERRMSG_TEL01="電話番号は「000-0000-0000」の形式で入力してください";

    	//名前が半角40文字以上なら
    	if( 40 < name.getBytes().length ) {
    		errmsg=ERRMSG_NAME01 + "<BR>";
    		}
    	//名前が未入力なら
    	if(name.getBytes().length == 0) {
    		errmsg= errmsg + ERRMSG_NAME02 + "<BR>";
    		}
    	//住所が半角80文字以上なら
		if (80 <  address.getBytes().length) {
			errmsg= errmsg +ERRMSG_ADDRESS01 + "<BR>";
			}
		//住所が未入力なら
		if(address.getBytes().length == 0) {
			errmsg= errmsg + ERRMSG_ADDRESS02 + "<BR>";
			}
		//電話番号が違う形で入力されている時
		if(tel.getBytes().length >  0 && !(tel.matches("[0-9]{3}-[0-9]{4}-[0-9]{4}")) ) {
			errmsg= errmsg + ERRMSG_TEL01 + "<BR>";
			}
		//AddCheck.jspに値を渡す
		request.setAttribute("name",name);
		request.setAttribute("address",address);
		request.setAttribute("tel",tel);
		request.setAttribute("errmsg",errmsg);

		//errmsgがブランクの場合とそれ以外の遷移
		if(errmsg == "") {
				getServletContext().getRequestDispatcher("/AddCheck.jsp").forward(request, response);
		}else{
				getServletContext().getRequestDispatcher("/Add.jsp").forward(request, response);
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
