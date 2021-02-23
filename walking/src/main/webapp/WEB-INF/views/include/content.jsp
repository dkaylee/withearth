<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<section id="one" class="wrapper">
				<div class="inner">
					<div class="flex flex-3">
						<!-- 메인: 바로가기 서비스 -> 텀블러 인증 서비스 안내 및 이동 -->
						<article>
							<header>
								<h3>텀블러 사용 인증하기<br /> </h3>
							</header>
							<p>지정된 카페에서 텀블러 사용 인증 후 포인트를 적립받는 서비스입니다.</p>
							<footer>
								<a href="#" class="button special">More</a>
							</footer>
						</article>
						<!-- 메인: 바로가기 서비스 -> 걷기 인증 서비스 안내 및 이동 -->
						<article>
							<header>
								<h3>도보 인증 서비스<br /></h3>
							</header>
							<p>목적지 설정 후 도보로 목적지까지 이동하면 포인트를 적립받는 서비스입니다.</p>
							<footer>
							
								<a href="<c:url value="/course/loc/walkingservice"/>" class="button special">More</a>
							</footer>
						</article>
						<!-- 메인: 바로가기 서비스 -> 기부하기 안내 및 이동 -->
						<article>
							<header>
								<h3>기부하기<br /> </h3>
							</header>
							<p>사용하지 않는 물건 또는 음식들을 서로 공유하고 포인트를 적립받는 서비스입니다.</p>
							<footer>
								<a href="#" class="button special">More</a>
							</footer>
						</article>
						
				</div>
			</section>

		<!-- Two -->
			<section id="two" class="wrapper style1 special">
				<div class="inner">
					<header>
						<h2>비건 레시피 랭킹</h2>
						<p>인기 레시피를 참고해보세요!</p>
					</header>
					<div class="flex flex-4">
						<div class="box person">
							<div class="image round">
								<img src="images/pic03.jpg" alt="Person 1" />
							</div>
							<h3>Magna</h3>
							<p>Cipdum dolor</p>
						</div>
						<div class="box person">
							<div class="image round">
								<img src="images/pic04.jpg" alt="Person 2" />
							</div>
							<h3>Ipsum</h3>
							<p>Vestibulum comm</p>
						</div>
						<div class="box person">
							<div class="image round">
								<img src="images/pic05.jpg" alt="Person 3" />
							</div>
							<h3>Tempus</h3>
							<p>Fusce pellentes</p>
						</div>
						<div class="box person">
							<div class="image round">
								<img src="images/pic06.jpg" alt="Person 4" />
							</div>
							<h3>Dolore</h3>
							<p>Praesent placer</p>
						</div>
					</div>
				</div>
			</section>

		<!-- Three -->
			<section id="three" class="wrapper special">
				<div class="inner">
					<header class="align-center">
						<h2>Nunc Dignissim</h2>
						<p>Aliquam erat volutpat nam dui </p>
					</header>
					<div class="flex flex-2">
						<article>
							<div class="image fit">
								<img src="images/pic01.jpg" alt="Pic 01" />
							</div>
							<header>
								<h3>Praesent placerat magna</h3>
							</header>
							<p>Praesent dapibus, neque id cursus faucibus, tortor neque egestas augue, eu vulputate magna eros eu erat. Aliquam erat volutpat. Nam dui mi, tincidunt quis, accumsan porttitor lorem ipsum.</p>
							<footer>
								<a href="#" class="button special">More</a>
							</footer>
						</article>
						<article>
							<div class="image fit">
								<img src="images/pic02.jpg" alt="Pic 02" />
							</div>
							<header>
								<h3>Fusce pellentesque tempus</h3>
							</header>
							<p>Sed adipiscing ornare risus. Morbi est est, blandit sit amet, sagittis vel, euismod vel, velit. Pellentesque egestas sem. Suspendisse commodo ullamcorper magna non comodo sodales tempus.</p>
							<footer>
								<a href="#" class="button special">More</a>
							</footer>
						</article>
					</div>
				</div>
			</section>
			
			<!-- Form -->
								
								<h3>Form</h3>
								
								<form method="post" action="#">
									<div class="row uniform">
										<div class="6u 12u$(xsmall)">
											<input type="text" name="name" id="name" value="" placeholder="Name" />
										</div>
										<div class="6u$ 12u$(xsmall)">
											<input type="email" name="email" id="email" value="" placeholder="Email" />
										</div>
										<!-- Break -->
										<div class="12u$">
											<div class="select-wrapper">
												<select name="category" id="category">
													<option value="">- Category -</option>
													<option value="1">Manufacturing</option>
													<option value="1">Shipping</option>
													<option value="1">Administration</option>
													<option value="1">Human Resources</option>
												</select>
											</div>
										</div>
										<!-- Break -->
										<div class="4u 12u$(small)">
											<input type="radio" id="priority-low" name="priority" checked>
											<label for="priority-low">Low Priority</label>
										</div>
										<div class="4u 12u$(small)">
											<input type="radio" id="priority-normal" name="priority">
											<label for="priority-normal">Normal Priority</label>
										</div>
										<div class="4u$ 12u$(small)">
											<input type="radio" id="priority-high" name="priority">
											<label for="priority-high">High Priority</label>
										</div>
										<!-- Break -->
										<div class="6u 12u$(small)">
											<input type="checkbox" id="copy" name="copy">
											<label for="copy">Email me a copy of this message</label>
										</div>
										<div class="6u$ 12u$(small)">
											<input type="checkbox" id="human" name="human" checked>
											<label for="human">I am a human and not a robot</label>
										</div>
										<!-- Break -->
										<div class="12u$">
											<textarea name="message" id="message" placeholder="Enter your message" rows="6"></textarea>
										</div>
										<!-- Break -->
										<div class="12u$">
											<ul class="actions">
												<li><input type="submit" value="Send Message" /></li>
												<li><input type="reset" value="Reset" class="alt" /></li>
											</ul>
										</div>
									</div>
								</form>

								<hr />

								<form method="post" action="#">
									<div class="row uniform">
										<div class="9u 12u$(small)">
											<input type="text" name="query" id="query" value="" placeholder="Query" />
										</div>
										<div class="3u$ 12u$(small)">
											<input type="submit" value="Search" class="fit" />
										</div>
									</div>
								</form>
								</section>
								
							<!-- Table -->
								<h3>Table</h3>

								<h4>Default</h4>
								<div class="table-wrapper">
									<table>
										<thead>
											<tr>
												<th>Name</th>
												<th>Description</th>
												<th>Price</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>Item 1</td>
												<td>Ante turpis integer aliquet porttitor.</td>
												<td>29.99</td>
											</tr>
											<tr>
												<td>Item 2</td>
												<td>Vis ac commodo adipiscing arcu aliquet.</td>
												<td>19.99</td>
											</tr>
											<tr>
												<td>Item 3</td>
												<td> Morbi faucibus arcu accumsan lorem.</td>
												<td>29.99</td>
											</tr>
											<tr>
												<td>Item 4</td>
												<td>Vitae integer tempus condimentum.</td>
												<td>19.99</td>
											</tr>
											<tr>
												<td>Item 5</td>
												<td>Ante turpis integer aliquet porttitor.</td>
												<td>29.99</td>
											</tr>
										</tbody>
										<tfoot>
											<tr>
												<td colspan="2"></td>
												<td>100.00</td>
											</tr>
										</tfoot>
									</table>
								</div>
