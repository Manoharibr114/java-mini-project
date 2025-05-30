<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.dao.HospitalDAO, com.model.Patient" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Patient</title>
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        .card {
            border: none;
            border-radius: 15px;
            box-shadow: 0 10px 20px rgba(0,0,0,0.1);
        }
        .form-control, .form-select {
            border-radius: 10px;
            padding: 12px 15px;
            border: 1px solid #ddd;
        }
        .btn-primary {
            background-color: #0d6efd;
            border: none;
            border-radius: 10px;
            padding: 12px 30px;
            font-weight: 600;
        }
        .btn-primary:hover {
            background-color: #0b5ed7;
        }
        .form-label {
            font-weight: 600;
        }
    </style>
</head>
<body>
    <div class="container py-5">
        <div class="row justify-content-center">
            <div class="col-lg-8">
                <div class="card p-4 p-md-5">
                    <h2 class="text-center mb-4">Update Patient Information</h2>
                    
                    <% if (request.getParameter("error") != null) { %>
                        <div class="alert alert-danger alert-dismissible fade show" role="alert">
                            <%= request.getParameter("error") %>
                            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                        </div>
                    <% } %>
                    
                    <% 
                    String id = request.getParameter("id");
                    if (id == null) { 
                    %>
                        <form method="get" action="" class="mb-4">
                            <div class="input-group">
                                <input type="number" class="form-control" name="id" placeholder="Enter Patient ID" required>
                                <button class="btn btn-primary" type="submit">Search</button>
                            </div>
                        </form>
                    <% 
                    } else {
                        HospitalDAO hospitalDAO = new HospitalDAO();
                        Patient patient = hospitalDAO.selectPatient(Integer.parseInt(id));
                        if (patient != null) { 
                    %>
                            <form action="UpdatePatientServlet" method="post">
                                <input type="hidden" name="patientID" value="<%= patient.getPatientID() %>">
                                <div class="row g-3">
                                    <div class="col-md-6">
                                        <label for="patientName" class="form-label">Patient Name</label>
                                        <input type="text" class="form-control" id="patientName" name="patientName" 
                                               value="<%= patient.getPatientName() %>" required>
                                    </div>
                                    <div class="col-md-6">
                                        <label for="age" class="form-label">Age</label>
                                        <input type="number" class="form-control" id="age" name="age" 
                                               value="<%= patient.getAge() %>" min="0" max="120" required>
                                    </div>
                                    <div class="col-md-6">
                                        <label for="gender" class="form-label">Gender</label>
                                        <select class="form-select" id="gender" name="gender" required>
                                            <option value="Male" <%= patient.getGender().equals("Male") ? "selected" : "" %>>Male</option>
                                            <option value="Female" <%= patient.getGender().equals("Female") ? "selected" : "" %>>Female</option>
                                            <option value="Other" <%= patient.getGender().equals("Other") ? "selected" : "" %>>Other</option>
                                        </select>
                                    </div>
                                    <div class="col-md-6">
                                        <label for="admissionDate" class="form-label">Admission Date</label>
                                        <input type="date" class="form-control" id="admissionDate" name="admissionDate" 
                                               value="<%= new java.sql.Date(patient.getAdmissionDate().getTime()) %>" required>
                                    </div>
                                    <div class="col-12">
                                        <label for="ailment" class="form-label">Ailment/Condition</label>
                                        <input type="text" class="form-control" id="ailment" name="ailment" 
                                               value="<%= patient.getAilment() %>" required>
                                    </div>
                                    <div class="col-12">
                                        <label for="assignedDoctor" class="form-label">Assigned Doctor</label>
                                        <input type="text" class="form-control" id="assignedDoctor" name="assignedDoctor" 
                                               value="<%= patient.getAssignedDoctor() %>" required>
                                    </div>
                                    <div class="col-12 mt-4">
                                        <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                                            <a href="patientupdate.jsp" class="btn btn-secondary me-md-2">Cancel</a>
                                            <button type="submit" class="btn btn-primary">Update Patient</button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                    <% 
                        } else { 
                    %>
                            <div class="alert alert-warning">No patient found with ID: <%= id %></div>
                            <a href="patientupdate.jsp" class="btn btn-primary">Try Again</a>
                    <% 
                        } 
                    } 
                    %>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap 5 JS Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>