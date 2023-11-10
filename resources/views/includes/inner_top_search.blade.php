<form action="{{route('job.list')}}" method="get">
	<!-- Page Title start -->
	<div class="container">
		<div class="pageSearch">
				


			<div class="banner-bottom">
				<div class="container">
					<div class="banner-bottom-main">
						<div class="cycle-tab-container">
							<ul class="nav nav-tabs">
								<li class="cycle-tab-item active">
									<a class="nav-link job" role="tab" data-toggle="tab" href="#job"> Job Seeker </a>
								</li>
								<li class="cycle-tab-item">
									<a class="nav-link student" role="tab" data-toggle="tab" href="#student"> Student </a>
								</li>
								<li class="cycle-tab-item">
									<a class="nav-link employer" role="tab" data-toggle="tab" href="#employer"> Employer
									</a>
								</li>
							</ul>
							<div class="tab-content">
								<div class="tab-pane fade active in" id="job" role="tabpanel" aria-labelledby="home-tab">
									<div class="select-and-search">
										<div class="form-group">
											<select class="form-select select-category" aria-label="Default select example">
												<option selected> Select Category </option>
												<option value="1">One</option>
												<option value="2">Two</option>
												<option value="3">Three</option>
											</select>
										</div>
										<div class="form-group">
											<select class="form-select select-subject" aria-label="Default select example">
												<option selected> Select Subject </option>
												<option value="1">One</option>
												<option value="2">Two</option>
												<option value="3">Three</option>
											</select>
										</div>
										<div class="form-group">
											<select class="form-select select-place" aria-label="Default select example">
												<option selected> Place </option>
												<option value="1">One</option>
												<option value="2">Two</option>
												<option value="3">Three</option>
											</select>
										</div>
										<div class="search-button">
											<button type="search" class="btn"> Search </button>
										</div>
									</div>
								</div>
								<div class="tab-pane fade" id="student" role="tabpanel" aria-labelledby="profile-tab">
									<div class="select-and-search">
										<div class="form-group">
											<select class="form-select select-category" aria-label="Default select example">
												<option selected> Select Category </option>
												<option value="1">One</option>
												<option value="2">Two</option>
												<option value="3">Three</option>
											</select>
										</div>
										<div class="form-group">
											<select class="form-select select-subject" aria-label="Default select example">
												<option selected> Select Subject </option>
												<option value="1">One</option>
												<option value="2">Two</option>
												<option value="3">Three</option>
											</select>
										</div>
										<div class="form-group">
											<select class="form-select select-place" aria-label="Default select example">
												<option selected> Place </option>
												<option value="1">One</option>
												<option value="2">Two</option>
												<option value="3">Three</option>
											</select>
										</div>

										<div class="search-button">
											<button type="search" class="btn"> Search </button>
										</div>
									</div>
								</div>
								<div class="tab-pane fade" id="employer" role="tabpanel" aria-labelledby="messages-tab">
									<div class="select-and-search">
										<div class="form-group">
											<select class="form-select select-category" aria-label="Default select example">
												<option selected> Select Category </option>
												<option value="1">One</option>
												<option value="2">Two</option>
												<option value="3">Three</option>
											</select>
										</div>
										<div class="form-group">
											<select class="form-select select-subject" aria-label="Default select example">
												<option selected> Select Subject </option>
												<option value="1">One</option>
												<option value="2">Two</option>
												<option value="3">Three</option>
											</select>
										</div>
										<div class="form-group">
											<select class="form-select select-place" aria-label="Default select example">
												<option selected> Place </option>
												<option value="1">One</option>
												<option value="2">Two</option>
												<option value="3">Three</option>
											</select>
										</div>
										<div class="search-button">
											<button type="search" class="btn"> Search </button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Page Title end -->
</form>
