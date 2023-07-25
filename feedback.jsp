<%@ page import="java.sql.*" %>
<%
    // Retrieve form data
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String message = request.getParameter("message");

    // JDBC connection parameters
    String url = "jdbc:mysql://localhost:3306/test";
    String username = "root";
    String password = "root";

    try {
        // Establish database connection
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection(url, username, password);

        // Prepare SQL statement
        String sql = "INSERT INTO feedback (name, email, message) VALUES (?, ?, ?)";
        PreparedStatement statement = conn.prepareStatement(sql);
        statement.setString(1, name);
        statement.setString(2, email);
        statement.setString(3, message);

        // Execute the query
        statement.executeUpdate();

        // Close database connection
        statement.close();
        conn.close();

        // Redirect to a success page
        response.sendRedirect("success.jsp");
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
