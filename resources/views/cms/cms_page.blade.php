@extends('layouts.app')
@section('content')
<!-- Header start -->
@include('includes.header')
<!-- Header end --> 
<!-- Inner Page Title start -->
@include('job.inc.main_job_search')
<!-- Inner Page Title end -->

<section id="about" class="about">
			<div class="section-heading text-center">
				<h2> 会社情報 - About us</h2>
			</div>
			<div class="container">
				<div class="about-content">
					<div class="row">
						<div class="col-sm-6">
							<div class="single-about-txt">
								
                        <p>
                            私は2001年に日本へ留学生として降り立ってから23年の月日が経ちました。日本で学び、企業いたしました。たくさんの日本人のサポートや協力があったから今日まで日本で生活ができております。
							私が得たたくさんの日本での経験を基に多くの南アジア、東南アジアの国々から優秀な人材を日本企業へご紹介できる機会を設けることで、日本への恩返しとグローバル社会での日本の未来にを担う人材が
							これkらの日本の未来を構築し社会貢献を行うためにバロジョブ・ポータルサイトを立ち上げました。このサービスが日本と世界をつなぐ架け橋となる事をて私は信じております。​
                        
                            日本語スタッフや在日駐在員が常駐し、クライアントのニーズに寄り添ったサービスを提供し、スムーズな運営をサポートします。​
								
						
						また日本語教育センター等を設立し、日本就労時に必要な礼儀作法教育や定期的な実技訓練を実施しています。
						専門用語や方言実習などのユニークな教育が強みです。
						機械・木材・水産などの加工業や農業、建設分野への派遣業務を担います。
						<br>
						また日本語教育センター等を設立し、日本就労時に必要な礼儀作法教育や定期的な実技訓練を実施しています。
						</p>
								<div class="row">
									<div class="col-sm-4">
										<div class="single-about-add-info">
											<h3>phone</h3>
											<p>042-850-9471</p>
										</div>
									</div>
									<div class="col-sm-4">
										<div class="single-about-add-info">
											<h3>E-mail</h3>
											<p>info@bhalojob.com</p>
										</div>
									</div>
									<div class="col-sm-4">
										<div class="single-about-add-info">
											<h3>website</h3>
											<p><a href="https://aikon.co.jp/">www.bhalojob.com</a></p>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-sm-offset-1 col-sm-5">
							<div class="single-about-img">
                                 <img src="{{asset('about/profile.jpeg')}}" alt="">
							
								<div class="about-list-icon">
									<ul>
										<li>
											<a target="_blank" href="https://www.facebook.com/moinjp">
                                            <i class="fab fa-facebook-f"></i>
											</a>
										</li>
										<li>
											<a target="_blank" href="https://twitter.com/moinjp">
                                            <i class="fab fa-twitter"></i>
											</a>
										</li>
										<li>
											<a target="_blank" href="https://www.linkedin.com/in/moinul-tahmid-8053bab/">
											<i class="fab fa-linkedin-in"></i>
											</a>
										</li>
										<li>
											<a  target="_blank" href="#">
                                            <i class="fab fa-instagram iconpicker-component"></i>
											</a>
										</li>
										<li>
											<a  target="_blank" href="#">
                                            <i class="fab fa-google-plus-g"></i>
											</a>
										</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="container">
				<div class="section-heading text-center">
					<h2> 会社情報 - About us</h2>
				</div>
				<div class="compnay-information">
					<table>
						<tbody>
							<tr>
								<th>社名 </th>
								<td>ピクト株式会社（英社名：PIKT Co., Ltd)</td>
							</tr>
							<tr>
								<th> 住所 </th>
								<td>〒242-0017 神奈川県大和市大和東3-12-22　 </td>
							</tr>
							<tr>
								<th> 設立 </th>
								<td> 平成17年9月2日 </td>
							</tr>
							<tr>
								<th>資本金 </th>
								<td> 資本金 : １７００万円</td>
							</tr>
							<tr>
								<th> 代表取締役 </th>
								<td> タハミド モイヌル 、金子　和夫</td>
							</tr>
							<tr>
								<th> 事業内容 </th>
								<td>労働者派遣事業（派　１３−３０４５８０） </td>
							</tr>
                            <tr>
                                <th class="text-center" colspan="2">関連事業</th>
                            </tr>
							<tr>
								<th> 外国高度人材総合サイト</th>
								<td> <a href="https://bhalojob.com/">www.bhalojob.com</a> </td>
							</tr>
							<tr>
								<th> システム開発事業 </th>
								<td> <a href="https://pikt.jp/">www.pikt.jp</a> </td>
							</tr>
							<tr>
								<th>Webサイト </th>
								<td><a href="https://aikon.co.jp/">www.aikon.co.jp</a> </td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</section>

@include('includes.footer')
@endsection