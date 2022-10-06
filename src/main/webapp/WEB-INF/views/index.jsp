<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>HOME</title>

	<link href="https://demo.dashboardpack.com/architectui-html-free/main.css" rel="stylesheet">
	<jsp:include page="./_shared.jsp"></jsp:include>
</head>
<body>
<jsp:include page="./_navbar.jsp"></jsp:include>
	<div class="container" style="font-size:20px; color: white">
		<div class="row">
			<div class="col-md-6 col-xl-4">
				<div class="card mb-3 widget-content bg-midnight-bloom">
					<div class="widget-content-wrapper text-white">
						<div class="widget-content-left">
							<a href="doctor" href="/doctor" style="color:white">
								<div class="widget-heading">Doctors</div>
								<div class="widget-subheading">Total Doctors</div>
							</a>
						</div>
						<div class="widget-content-right">
							<div class="widget-numbers text-white">
								<span>
									<a>${departments}5</a>
								</span>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-6 col-xl-4" id="patient">
				<div class="card mb-3 widget-content bg-arielle-smile">
					<div class="widget-content-wrapper text-white">
						<div class="widget-content-left">
							<a href="patient" href="/patient"> style="color:white">
								<div class="widget-heading">Patients</div>
								<div class="widget-subheading">Total Patients</div>
							</a>
						</div>
						<div class="widget-content-right">
							<div class="widget-numbers text-white"><span>568</span></div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-6 col-xl-4" id="department">
				<div class="card mb-3 widget-content bg-grow-early">
					<div class="widget-content-wrapper text-white">
						<div class="widget-content-left">
							<a href="department" href="/department" style="color:white">
								<div class="widget-heading">Departments</div>
								<div class="widget-subheading">Total Departments</div>
							</a>
						</div>
						<div class="widget-content-right">
							<div class="widget-numbers text-white"><span>46</span></div>
						</div>
					</div>
				</div>
			</div>


			<div class="col-md-6 col-xl-4" id="prescription">
				<div class="card mb-3 widget-content bg-midnight-bloom">
					<div class="widget-content-wrapper text-white">
						<div class="widget-content-left">
							<a href="prescription" href="/prescription" style="color:white">
								<div class="widget-heading">Prescription</div>
								<div class="widget-subheading">Prescription</div>
							</a>
						</div>
						<div class="widget-content-right">
							<div class="widget-numbers text-white"><span>50</span></div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-6 col-xl-4" id="medicine">
				<div class="card mb-3 widget-content bg-arielle-smile">
					<div class="widget-content-wrapper text-white">
						<div class="widget-content-left">
							<a href="medicine" href="/medicine"> style="color:white">
								<div class="widget-heading">Medicine</div>
								<div class="widget-subheading">Total Medicine</div>
							</a>
						</div>
						<div class="widget-content-right">
							<div class="widget-numbers text-white"><span>58</span></div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-6 col-xl-4" id="test">
				<div class="card mb-3 widget-content bg-grow-early">
					<div class="widget-content-wrapper text-white">
						<div class="widget-content-left">
							<a href="test" href="/test" style="color:white">
								<div class="widget-heading">Test</div>
								<div class="widget-subheading">Total Test</div>
							</a>
						</div>
						<div class="widget-content-right">
							<div class="widget-numbers text-white"><span>46</span></div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-6 col-xl-4" id="admission">
				<div class="card mb-3 widget-content bg-arielle-smile">
					<div class="widget-content-wrapper text-white">
						<div class="widget-content-left">
							<a href="admission" href="/admission" style="color:white">
								<div class="widget-heading">Admission</div>
								<div class="widget-subheading">Total Admission</div>
							</a>
						</div>
						<div class="widget-content-right">
							<div class="widget-numbers text-white"><span>50</span></div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-6 col-xl-4" id="illness">
				<div class="card mb-3 widget-content bg-grow-early">
					<div class="widget-content-wrapper text-white">
						<div class="widget-content-left">
							<a href="/illness" style="color:white">
								<div class="widget-heading">Illness</div>
								<div class="widget-subheading">Total Illness</div>
							</a>
						</div>
						<div class="widget-content-right">
							<div class="widget-numbers text-white"><span>46</span></div>
						</div>
					</div>
				</div>
			</div>

			<div class="col-md-6 col-xl-4" id="account">
				<div class="card mb-3 widget-content bg-grow-early">
					<div class="widget-content-wrapper text-white">
						<div class="widget-content-left">
							<a href="/patient" style="color: white">
								<div class="widget-heading">Account </div>
								<div class="widget-subheading">Total Account</div>
							</a>
						</div>
						<div class="widget-content-right">
							<div class="widget-numbers text-white"><span>10</span></div>
						</div>
					</div>
				</div>
			</div>

			<div class="col-md-6 col-xl-4" id="health-record">
				<div class="card mb-3 widget-content bg-grow-early">
					<div class="widget-content-wrapper text-white">
						<div class="widget-content-left">
							<a href="/health-record" style="color: white">
								<div class="widget-heading">Heal-record </div>
								<div class="widget-subheading">Total Health Record</div>
							</a>
						</div>
						<div class="widget-content-right">
							<div class="widget-numbers text-white"><span>10</span></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</div>
<script type="text/javascript" src="/public/js/dashboard.js"></script>
</body>
</html>