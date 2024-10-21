<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="modal modal_alert">
	<div class="modal_container">
		<div class="modal_header">
			<h3 class="title">ALERT</h3>
			<div class="btn_close">
				<i class="bi bi-x-lg"></i>
			</div>
		</div>
		<div class="modal_body"></div>
		<div class="modal_footer">
			<button class="btn_cancel mainbtn full">확인</button>
		</div>
	</div>
	<div class="backdrop"></div>
</div>

<div class="modal modal_confirm">
	<div class="modal_container">
		<div class="modal_header">
			<h3 class="title">ALERT</h3>
			<div class="btn_close">
				<i class="bi bi-x-lg"></i>
			</div>
		</div>
		<div class="modal_body"></div>
		<div class="modal_footer">
			<div class="btn_flex">
				<div class="width50p">
					<button class="btn_confirm mainbtn full">예</button>
				</div>
				<div class="width50p">
					<button class="btn_cancel subbtn full">아니오</button>
				</div>
			</div>
		</div>
	</div>
	<div class="backdrop"></div>
</div>