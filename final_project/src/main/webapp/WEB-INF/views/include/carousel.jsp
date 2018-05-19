<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 사진 슬라이더 -->
	<div id="demo" class="carousel slide" data-ride="carousel">
		<ul class="carousel-indicators">
			<li data-target="#demo" data-slide-to="0" class="active"></li>
			<li data-target="#demo" data-slide-to="1"></li>
			<li data-target="#demo" data-slide-to="2"></li>
		</ul>
		<div class="carousel-inner">
			<div class="carousel-item active">

				<img src="resources/img/header/bk1.jpeg" alt="Chicago" width="100%"
					height="400px">
				<div class="carousel-caption " id="carousel-caption">
					<h3 class="display-4 text-center">무엇을 하고 싶으신가요?</h3>
					<h4 class="display-5 text-center">Do activity WITH US</h4>
					<br>
				</div>
			</div>
			<div class="carousel-item">
				<img src="resources/img/header/bk2.jpeg" alt="New York" width="100%"
					height="400px">
				<div class="carousel-caption" id="carousel-caption">
					<h3 class="display-4 text-center">함께 하면 더 즐거워요!</h3>
					<h4 class="display-5 text-center">Enjoy together WITH US</h4>
					<br>
				</div>
			</div>
			<div class="carousel-item">
				<img src="resources/img/header/bk3.jpeg" alt="wine" width="100%"
					height="400px">
				<div class="carousel-caption" id="carousel-caption">
					<h3 class="display-4 text-center">즐거움을 함께 나누세요!</h3>
					<h4 class="display-5 text-center">Share happiness WITH US</h4>
					<br>
				</div>
			</div>
		</div>
		<a class="carousel-control-prev" href="#demo" data-slide="prev"> <span
			class="carousel-control-prev-icon"></span>
		</a> <a class="carousel-control-next" href="#demo" data-slide="next">
			<span class="carousel-control-next-icon"></span>
		</a>
	</div>