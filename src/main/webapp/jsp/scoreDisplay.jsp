<%@ page language="java" import="java.util.*, javax.swing.*" pageEncoding="UTF-8"%>
<%@ page import="cn.edu.njust.bean.*, cn.edu.njust.dao.*"%>
<jsp:include page="isAdmin.jsp"></jsp:include>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
Admin admin = new Admin();
admin = (Admin) session.getAttribute("user");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<head>
	<base href="<%=basePath%>">

    <title>CSP考试团报管理系统 | 成绩表查看</title>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="css/foundation.min.css">
    <link rel="stylesheet" href="css/foundation-icons.css">
    <link rel="stylesheet" href="css/foundation-icons.eot">
    <link rel="stylesheet" href="css/foundation-icons.svg">
    <link rel="stylesheet" href="css/foundation-icons.ttf">
    <link rel="stylesheet" href="css/foundation-icons.woff">
    <!-- Font Awesome Icons -->
    <link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="dist/css/adminlte.min.css">
    <!-- Google Font: Source Sans Pro -->
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
    <link rel="stylesheet" href="dist/css/mycss.css">
    <script src="js/jquery.min.js"></script>
    <script src="js/foundation.min.js"></script>
    <script src="js/modernizr.js"></script>
    <script>
		$(function () {
			$("#checkall").click(function () { //判断全选框的改变
				var flage = $(this).is(":checked"); //全选选中为true，否则为false
				$("input[name=grade]").each(function () {
					$(this).prop("checked", flage);
				})
			});
			//当子元素都选全选选中，其中一个不选取消全选
			$("input[name=grade]").click(function () {
				var flage1 = true;
				for (var i = 0; i < $("input[name=grade]").length; i++) {
					if (!$($("input[name=grade]")[i]).is(":checked")) {
						flage1 = false;
						break;
					}
				}
				$("#checkall").prop("checked", flage1);
			})
		})

		$(function () {
			$("#stuID").click(function () { //判断全选框的改变
				var flage = $(this).is(":checked"); //全选选中为true，否则为false
				$("input[name=stuid]").each(function () {
					$(this).prop("checked", flage);
				})
			});
			//当子元素都选全选选中，其中一个不选取消全选
			$("input[name=stuid]").click(function () {
				var flage1 = true;
				for (var i = 0; i < $("input[name=stuid]").length; i++) {
					if (!$($("input[name=stuid]")[i]).is(":checked")) {
						flage1 = false;
						break;
					}
				}
				$("#stuID").prop("checked", flage1);
			})
		})
	</script>

</head>

<body class="hold-transition layout-top-nav">
    <div class="wrapper">

        <!-- Navbar -->
        <nav class="main-header navbar navbar-expand-md navbar-light navbar-purple">
            <div class="container ">
                <a href="/CSP/jsp/managerMain.jsp" class="navbar-brand">
					<img src="/CSP/dist/njust.png" alt="ANJUST Logo" class=" brand-image img-circle elevation-3"">
        			<span class=" brand-text text-white font-weight-light"><strong>CSP团报管理系统</strong></span>
				</a>

                <button class="navbar-toggler order-1" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>

                <!-- Right navbar links -->
                <ul class="order-1 order-md-3 navbar-nav navbar-no-expand ml-auto">
                    <div class="collapse navbar-collapse order-3" id="navbarCollapse">
                        <!-- Left navbar links -->
                        <ul class="navbar-nav">
                            <li class="nav-item">
                                <a href="/CSP/jsp/managerMain.jsp" class="nav-link text-white">欢迎，<%=admin.getAdminGrade()%>级管理员!</a>
                            </li>
                            <li class="nav-item">
                                <a href="/CSP/jsp/managerMain.jsp" class="nav-link text-white">主页</a>
                            </li>
                            <li class="nav-item">
                                <a href="/CSP/jsp/logout.jsp" class="nav-link text-white">注销</a>
                            </li>
                        </ul>
                    </div>
                </ul>
            </div>
        </nav>
        <!-- /.navbar -->

        <div class="off-canvas-wrap" data-offcanvas style="height: 100%;">

            <div class="inner-wrap" style="height: 100%;">
                <nav class="tab-bar" style="background-color: #ffffff;">
                    <section class="left-small" style="background-color: #68838b;">
                        <a class="left-off-canvas-toggle menu-icon" href="#"><span></span></a>
                    </section>

                    <section class="middle tab-bar-section">
                        <h1 class="title"></h1>
                    </section>
                </nav>

                <aside class="left-off-canvas-menu" style="background-color: #68838b;height: 98%;">
                    <ul class="off-canvas-list test" style="height: 98%;">
                    	<li><a href="/CSP/jsp/scoreDisplay.jsp"><i class="fi-text-color"
									style="font-size:20px;color:white;"></i>
								<p style="color:white">查询成绩</p>
							</a></li>
                        <li class="divider"></li>
                        <li><a href="/CSP/jsp/importScore.jsp"><i class="fi-text-color"
									style="font-size:20px;color:white;"></i>
								<p style="color:white">导入成绩</p>
							</a></li>
                        <li class="divider"></li>
                        <li><a href="/CSP/jsp/importStudent.jsp"><i class="fi-torsos-all"
									style="font-size:20px;color:white;"></i>
								<p style="color:white">导入学生</p>
							</a></li>
                        <li class="divider"></li>
                        <li><a href="/CSP/jsp/managerOpen.jsp"><i class="fi-play"
									style="font-size:20px;color:white;"></i>
								<p style="color:white">开启团报</p>
							</a></li>
                        <li class="divider"></li>
                        <li><a href="/CSP/jsp/managerIntention.jsp"><i class="fi-widget"
									style="font-size:20px;color:white;"></i>
								<p style="color:white">团报意向管理</p>
							</a></li>
                        <li class="divider"></li>
                        <li><a href="/CSP/jsp/managerConfirm.jsp"><i class="fi-widget"
									style="font-size:20px;color:white;"></i>
								<p style="color:white">团报名单管理</p>
							</a></li>
                        <li class="divider"></li>
                    </ul>
                </aside>

                <section class="main-section">
					<!-- Content Wrapper. Contains page content -->
					<div class="content-wrapper">
						<!-- Content Header (Page header) -->
						<div class="content-header">
							<div class="container">
								<div class="row mb-3">
								</div>
								<!-- /.row -->
							</div>
							<!-- /.container-fluid -->
						</div>
						<!-- /.content-header -->

						<!-- Main content -->
						<div class="content">
							<div class="container">
								<div class="row">
									<div class="col-12">

										<form action="jsp/scoreDisplay.jsp" method="post">
											<div class="card mb-0">
												<div class="card-body table-responsive p-0">
													<table class="table table-hover">
														<tbody>
														<%
														String csp = "17";
														if(request.getParameter("cspnumber") != null) {
															csp = (String) request.getParameter("cspnumber");
														}
														if(admin.getAdminGrade().equals("0000")) {
															String[] grade = new String[4];
															if(request.getParameterValues("grade") == null) {
																grade[0] = "2016";
																grade[1] = "2017";
																grade[2] = "2018";
																grade[3] = "2019";
															} else {
																grade = request.getParameterValues("grade");
															}
														%>
															<tr>
																<td><input type="checkbox" name="allgrade" value="0000" id="checkall">&nbsp;All</td>
																<td><input type="checkbox" name="grade" value="2016">2016&nbsp;</td>
																<td><input type="checkbox" name="grade" value="2017">2017&nbsp;</td>
																<td><input type="checkbox" name="grade" value="2018">2018&nbsp;</td>
																<td><input type="checkbox" name="grade" value="2019">2019&nbsp;</td>
																<td colspan="2">
																	<select class="select" name="cspnumber">
																		<option value="CSP-<%=csp%>" selected>CSP-<%=csp%></option>
																		<option value="CSP-17">CSP-17</option>
																		<option value="CSP-18">CSP-18</option>
																		<option value="CSP-19">CSP-19</option>
																		<option value="CSP-20">CSP-20</option>
																	</select>
																</td>
																<td colspan="2">
																	<button type="submit" class="btn btn-block btn-primary btn-sm">刷新</button>
																</td>
															</tr>
														<%
														} else {
														%>
															<tr>
																<td colspan="5"><center>
																	<input type="text" name="grade" value="<%=admin.getAdminGrade()%>级学生成绩表" onfocus="this.blur()">
																</center></td>
																<td colspan="2">
																	<select class="select" name="cspnumber">
																		<option value="CSP-<%=csp%>" selected>CSP-<%=csp%></option>
																		<option value="CSP-17">CSP-17</option>
																		<option value="CSP-18">CSP-18</option>
																		<option value="CSP-19">CSP-19</option>
																		<option value="CSP-20">CSP-20</option>
																	</select>
																</td>
																<td colspan="2">
																	<button type="submit" class="btn btn-block btn-primary btn-sm">刷新</button>
																</td>
															</tr>
														<%
														}
														%>
														</tbody>
													</table>
												</div>
												<!-- /.card-body -->
											</div>
											<!-- /.card -->
										

										<div class="card mb-4">
											<!-- /.card-header -->
											<div class="card-body table-responsive p-0" style="height: 400px;">
												<table class="table table-head-fixed">
													<thead>
														<tr>
															<th>学号</th>
															<th>姓名</th>
															<th>CSP</th>
															<th>总成绩</th>
															<th>第一题得分</th>
															<th>第二题得分</th>
															<th>第三题得分</th>
															<th>第四题得分</th>
															<th>第五题得分</th>
														</tr>
													</thead>
													<tbody>
													<%
													if(admin.getAdminGrade().equals("0000")) {
														String[] grade = new String[4];
														if(request.getParameterValues("grade") == null) {
															grade[0] = "2016";
															grade[1] = "2017";
															grade[2] = "2018";
															grade[3] = "2019";
														} else {
															grade = request.getParameterValues("grade");
														}
														AdminDao dao1 = new AdminDao();
														ScoreDao dao2 = new ScoreDao();
														List<Student> list1 = new ArrayList<Student>();
														List<Score> list2 = new ArrayList<Score>();
														for(int i = 0; i < grade.length; i++) {
															list1 = dao1.getGradeStudent(grade[i]);
															for(int j = 0; j < list1.size(); j++) {
																list2 = dao2.getAllScore(list1.get(j).getStuID(), csp);
																for(int k = 0; k < list2.size(); k++) {
																	Score score = list2.get(k);
													%>
														<tr>
															<td><%=score.getStuID()%></td>
															<td><%=score.getStuName()%></td>
															<td><%=score.getSession()%></td>
															<td><%=score.getTotal_score()%></td>
															<td><%=score.getScore_1()%></td>
															<td><%=score.getScore_2()%></td>
															<td><%=score.getScore_3()%></td>
															<td><%=score.getScore_4()%></td>
															<td><%=score.getScore_5()%></td>
														</tr>
													<%
																}
															}
														}
													} else {
														String grade = admin.getAdminGrade();
														AdminDao dao1 = new AdminDao();
														ScoreDao dao2 = new ScoreDao();
														List<Student> list1 = new ArrayList<Student>();
														List<Score> list2 = new ArrayList<Score>();
														list1 = dao1.getGradeStudent(grade);
														for(int i = 0; i < list1.size(); i++) {
															list2 = dao2.getAllScore(list1.get(i).getStuID(), csp);
															for(int j = 0; j < list2.size(); j++) {
																Score score = list2.get(j);
													%>
														<tr>
															<td><%=score.getStuID()%></td>
															<td><%=score.getStuName()%></td>
															<td><%=score.getSession()%></td>
															<td><%=score.getTotal_score()%></td>
															<td><%=score.getScore_1()%></td>
															<td><%=score.getScore_2()%></td>
															<td><%=score.getScore_3()%></td>
															<td><%=score.getScore_4()%></td>
															<td><%=score.getScore_5()%></td>
														</tr>
													<%
															}
														}
													}
													%>
													</tbody>
												</table>
											</div>
											<!-- /.card-body -->
										</div>
										<!-- /.card -->
										</form>
									</div>
								</div>
							</div>
							<!-- /.container-fluid -->
						</div>
						<!-- /.content -->
					</div>
					<!-- /.content-wrapper -->

					<!-- Control Sidebar -->
					<aside class="control-sidebar control-sidebar-dark">
						<!-- Control sidebar content goes here -->
						<div class="p-3">
							<h5>Title</h5>
							<p>Sidebar content</p>
						</div>
					</aside>
					<!-- /.control-sidebar -->
				</section>
                <a class="exit-off-canvas"></a>
            </div>
            <!-- ./wrapper -->

            <!-- REQUIRED SCRIPTS -->

            <!-- jQuery -->
            <script src="../plugins/jquery/jquery.min.js"></script>
            <!-- Bootstrap 4 -->
            <script src="../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
            <!-- AdminLTE App -->
            <script src="../dist/js/adminlte.min.js"></script>
        </div>
    </div>

    <!-- 初始化 Foundation JS -->
    <script>
        $(document).ready(function() {
            $(document).foundation();
        })
    </script>

</body>

</html>