<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Generate Reports</title>
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
        .report-option {
            cursor: pointer;
            transition: all 0.3s;
        }
        .report-option:hover {
            transform: translateY(-5px);
            box-shadow: 0 15px 30px rgba(0,0,0,0.1);
        }
    </style>
</head>
<body>
    <div class="container py-5">
        <div class="row">
            <div class="col-12">
                <div class="card p-4">
                    <div class="d-flex justify-content-between align-items-center mb-4">
                        <h2>Generate Reports</h2>
                        <a href="index.jsp" class="btn btn-primary">
                            <i class="fas fa-home"></i> Home
                        </a>
                    </div>
                    
                    <% if (request.getParameter("error") != null) { %>
                        <div class="alert alert-danger alert-dismissible fade show" role="alert">
                            <%= request.getParameter("error") %>
                            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                        </div>
                    <% } %>
                    
                    <div class="row g-4">
                        <div class="col-md-4">
                            <div class="card report-option p-4 text-center" data-bs-toggle="modal" data-bs-target="#dateRangeModal">
                                <div class="card-icon mb-3">
                                    <i class="fas fa-calendar-alt fa-3x text-primary"></i>
                                </div>
                                <h4>Date Range Report</h4>
                                <p class="text-muted">Patients admitted between specific dates</p>
                            </div>
                        </div>
                        
                        <div class="col-md-4">
                            <div class="card report-option p-4 text-center" data-bs-toggle="modal" data-bs-target="#ailmentModal">
                                <div class="card-icon mb-3">
                                    <i class="fas fa-heartbeat fa-3x text-primary"></i>
                                </div>
                                <h4>Ailment Report</h4>
                                <p class="text-muted">Patients with specific ailments</p>
                            </div>
                        </div>
                        
                        <div class="col-md-4">
                            <div class="card report-option p-4 text-center" data-bs-toggle="modal" data-bs-target="#doctorModal">
                                <div class="card-icon mb-3">
                                    <i class="fas fa-user-md fa-3x text-primary"></i>
                                </div>
                                <h4>Doctor Report</h4>
                                <p class="text-muted">Patients assigned to specific doctors</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Date Range Modal -->
    <div class="modal fade" id="dateRangeModal" tabindex="-1" aria-labelledby="dateRangeModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="dateRangeModalLabel">Date Range Report</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <form action="ReportServlet" method="post">
                    <div class="modal-body">
                        <input type="hidden" name="reportType" value="dateRange">
                        <div class="mb-3">
                            <label for="startDate" class="form-label">Start Date</label>
                            <input type="date" class="form-control" id="startDate" name="startDate" required>
                        </div>
                        <div class="mb-3">
                            <label for="endDate" class="form-label">End Date</label>
                            <input type="date" class="form-control" id="endDate" name="endDate" required>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary">Generate Report</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- Ailment Modal -->
    <div class="modal fade" id="ailmentModal" tabindex="-1" aria-labelledby="ailmentModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="ailmentModalLabel">Ailment Report</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <form action="ReportServlet" method="post">
                    <div class="modal-body">
                        <input type="hidden" name="reportType" value="ailment">
                        <div class="mb-3">
                            <label for="ailment" class="form-label">Ailment/Condition</label>
                            <input type="text" class="form-control" id="ailment" name="ailment" required>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary">Generate Report</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- Doctor Modal -->
    <div class="modal fade" id="doctorModal" tabindex="-1" aria-labelledby="doctorModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="doctorModalLabel">Doctor Report</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <form action="ReportServlet" method="post">
                    <div class="modal-body">
                        <input type="hidden" name="reportType" value="doctor">
                        <div class="mb-3">
                            <label for="doctor" class="form-label">Doctor Name</label>
                            <input type="text" class="form-control" id="doctor" name="doctor" required>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary">Generate Report</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- Bootstrap 5 JS Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Set default dates for date range report
        document.addEventListener('DOMContentLoaded', function() {
            const today = new Date();
            const oneMonthAgo = new Date();
            oneMonthAgo.setMonth(today.getMonth() - 1);
            
            document.getElementById('startDate').valueAsDate = oneMonthAgo;
            document.getElementById('endDate').valueAsDate = today;
        });
    </script>
</body>
</html>