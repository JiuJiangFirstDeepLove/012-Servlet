package utils;

import java.sql.*;

public class JDBCUtils {
    // 加载驱动，建立数据库连接
    public static Connection getConnection() throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        // 2. 通过DerverManage获取数据库连接
        String url = "jdbc:mysql://localhost:3306/cakeshop?serverTimezone=Asia/Shanghai&useSSL=false&characterEncoding=utf-8";
        String username="root";
        String password="123456";
        Connection conn = DriverManager.getConnection(url, username, password);
        return conn;
    }

    // 关闭数据库连接，释放资源
    public static void release(Statement stmt, Connection conn) {
        if(stmt !=null ) {
            try {
                stmt.close();
            } catch (SQLException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
            stmt = null;
        }
        if(conn !=null ) {
            try {
                conn.close();
            } catch (SQLException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
            conn = null;
        }
    }

    public static void release(ResultSet rs, Statement stmt, Connection conn) {
        if(rs != null) {
            try {
                rs.close();
            } catch (SQLException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
            rs = null;
        }
        release(stmt,conn);
    }
}
