<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Report Criteria</title>
   
</head>
<body>
    <div class="header">
        <h1>Hospital Management System</h1>
    </div>
    
    
    <div class="form-container">
        <h2>Report Criteria</h2>
        <%
            String reportType = (String) request.getAttribute("reportType");
        %>
        <form action="ReportServlet" method="post">
            <input type="hidden" name="reportType" value="<%= reportType %>">
            
            <% if ("dateRange".equals(reportType)) { %>
                <div class="form-group">
                    <label for="startDate">Start Date:</label>
                    <input type="date" id="startDate" name="startDate" required>
                </div>
                
                <div class="form-group">
                    <label for="endDate">End Date:</label>
                    <input type="date" id="endDate" name="endDate" required>
                </div>
            <% } else if ("ailment".equals(reportType)) { %>
                <div class="form-group">
                    <label for="ailment">Ailment:</label>
                    <input type="text" id="ailment" name="ailment" placeholder="Enter ailment (e.g., Fever, Fracture)" required>
                </div>
            <% } else if ("doctor".equals(reportType)) { %>
                <div class="form-group">
                    <label for="doctor">Doctor Name:</label>
                    <input type="text" id="doctor" name="doctor" placeholder="Enter doctor's name" required>
                </div>
            <% } %>
            
            <button type="submit" class="btn">Generate Report</button>
        </form>
        
        <a href="reports.jsp" class="back-link">Back to Reports</a>
    </div>
</body>
</html>