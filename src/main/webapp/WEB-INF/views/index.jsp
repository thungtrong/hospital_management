<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>HOME</title>
	<jsp:include page="./_shared.jsp"></jsp:include>
	<link href="/css/main.css" rel="stylesheet">
</head>
<body>
<jsp:include page="./_navbar.jsp"></jsp:include>
	<div class="container" style="font-size:20px">
		<div class="row">
			<div class="col-md-6 col-xl-4">
				<div class="card mb-3 widget-content bg-midnight-bloom">
					<div class="widget-content-wrapper text-white">
						<div class="widget-content-left">
							<div class="widget-heading">Doctors</div>
							<div class="widget-subheading">Total Doctors</div>
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
							<div class="widget-heading">Patients</div>
							<div class="widget-subheading">Total Patients</div>
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
							<div class="widget-heading">Department</div>
							<div class="widget-subheading">Current departments</div>
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
							<div class="widget-heading">Prescription </div>
							<div class="widget-subheading">Total Prescription</div>
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
							<div class="widget-heading">Medicine</div>
							<div class="widget-subheading">Total Medicine</div>
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
							<div class="widget-heading">Test</div>
							<div class="widget-subheading"> Total Test</div>
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
							<div class="widget-heading">Admission</div>
							<div class="widget-subheading">Total Admission</div>
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
							<div class="widget-heading">Illness</div>
							<div class="widget-subheading">Total Illness</div>
						</div>
						<div class="widget-content-right">
							<div class="widget-numbers text-white"><span>46</span></div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-6 col-xl-4" id="healrecord">
				<div class="card mb-3 widget-content bg-arielle-smile">
					<div class="widget-content-wrapper text-white">
						<div class="widget-content-left">
							<div class="widget-heading">Health Record</div>
							<div class="widget-subheading">Total Health Record</div>
						</div>
						<div class="widget-content-right">
							<div class="widget-numbers text-white"><span>568</span></div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-6 col-xl-4" id="account">
				<div class="card mb-3 widget-content bg-grow-early">
					<div class="widget-content-wrapper text-white">
						<div class="widget-content-left">
							<div class="widget-heading">Account </div>
							<div class="widget-subheading">Total Account</div>
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