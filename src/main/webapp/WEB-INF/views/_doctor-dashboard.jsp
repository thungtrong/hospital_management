	<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
								<a>${doctors}</a>
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
						<a href="patient" href="/patient" style="color:white">
							<div class="widget-heading">Patients</div>
							<div class="widget-subheading">Total Patients</div>
						</a>
					</div>
					<div class="widget-content-right">
						<div class="widget-numbers text-white"><span>
								${patients}
							</span></div>
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
						<div class="widget-numbers text-white"><span>${departments}</span></div>
					</div>
				</div>
			</div>
		</div>


		<div class="col-md-6 col-xl-4" id="medicine">
			<div class="card mb-3 widget-content bg-arielle-smile">
				<div class="widget-content-wrapper text-white">
					<div class="widget-content-left">
						<a href="medicine" href="/medicine" style="color:white">
							<div class="widget-heading">Medicine</div>
							<div class="widget-subheading">Total Medicine</div>
						</a>
					</div>
					<div class="widget-content-right">
						<div class="widget-numbers text-white"><span>${medicines}</span></div>
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
						<div class="widget-numbers text-white"><span>${tests}</span></div>
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
						<div class="widget-numbers text-white"><span>${admissionForms}</span></div>
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
						<div class="widget-numbers text-white"><span>${illnesses}</span></div>
					</div>
				</div>
			</div>
		</div>


		<div class="col-md-6 col-xl-4" id="health-record">
			<div class="card mb-3 widget-content bg-grow-early">
				<div class="widget-content-wrapper text-white">
					<div class="widget-content-left">
						<a href="/health-record" style="color: white">
							<div class="widget-heading">Health Record </div>
							<div class="widget-subheading">Total Health Record</div>
						</a>
					</div>
					<div class="widget-content-right">
						<div class="widget-numbers text-white"><span>${healthRecords}</span></div>
					</div>
				</div>
			</div>
		</div>


	</div>
</div>