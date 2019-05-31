<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/> 

<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="css/_common.css"/>
<link rel="stylesheet" href="css/ikeyo_v1-front.css">

<div id="login">
	<div class="container_c">
		<div class="head">
			<p class="noto">내 계정 찾기</p>
			<ul>
				<li onclick="findTypeChg1('findId')">아이디 찾기</li>
				<li onclick="findTypeChg1('findPwd')">비밀번호 찾기</li>
			</ul>
		</div>
		<div class="body">
			<div class="findId">
				<div class="enter">
					<input type="text" id="_name" name="name"
						data-msg="이름을" placeholder="이름">
					<div class="email">
						<input type="hidden" name="email" id="_email">
						<input type="text" id="_email1" data-msg="이메일을" placeholder="이메일">
						@ <input type="text" id="_email2" data-msg="이메일 주소를">
						<select id="_selemail">
							<option value="" selected>직접입력</option>
							<option value="gmail.com">gmail.com</option>
							<option value="naver.com">naver.com</option>
							<option value="daum.net">daum.net</option>
						</select>
					</div>
				</div>
				<p class="resultCmt noto"></p>
				<button class="send btn_s_blue btn_240" id="_btnRegi">
					아이디 찾기
				</button>
				<button class="buttonDiv3 btn_s_blue btn_240" onclick="location.href='login.do'">
					로그인
				</button>
			</div>
			<div class="findPwd">
				<div>
					<ul>
						<li>∙ 마이페이지 내정보수정을 통해 비밀번호를 재설정 하실 수 있습니다.</li>
					</ul>
				<form method="post" id="_frmForm" name="frmForm">
					<div class="enter">
						<input type="text" name="id" id="_uid" data-msg="아이디를" placeholder="아이디">
						<div class="email">
							<input type="hidden" name="email" id="_email0">
							<input type="text" id="_email3" data-msg="이메일을" placeholder="이메일">
							@ <input type="text" id="_email4" data-msg="이메일 주소를">
							<select id="_selemail1">
								<option value="" selected>직접입력</option>
								<option value="gmail.com">gmail.com</option>
								<option value="naver.com">naver.com</option>
								<option value="daum.net">daum.net</option>
							</select>
						</div>
					</div>
					<button class="buttonDiv3 btn_s_blue btn_240" style="left:50%;" id="_btnRegi1">
						비밀번호 찾기
					</button>
				</form>
				</div>
			</div>
		</div>
	</div>
</div>

<script>
/* ID찾기 버튼 */
$('#_btnRegi').click(function() {
	if($('#_name').val() == ""){
		alert($('#_name').attr("data-msg") + " 입력해주세요");
		$('#_name').focus();
		return false;
	} else if($('#_email1').val() == "" || $('#_email1').val().indexOf("@") != -1){
		if($('#_email1').val() == "") {
			alert($('#_email1').attr("data-msg") + " 입력해주세요");
			$('#_email1').focus();	
		} else {
			alert("이메일 형식이 알맞지 않습니다. 다시 확인해 주세요");
			$('#_email1').val("");
			$('#_email1').focus();
		}
		return false;
	} else if($('#_email2').val() == "") {
		alert($('#_email2').attr("data-msg") + " 입력해주세요");
		$('#_email2').focus();
		return false;
	} else {
		var email = $('#_email1').val().trim() + "@" + $('#_email2').val().trim();
		$('#_email').val(email);
	}
	
	$.ajax({
		url: "findIdAf.do",
		type: "post",
		data: {"name" : $('#_name').val().trim(), "email" : $('#_email').val().trim()},
		success:function(data) {
			if(data.trim() == "NO") {
				alert("이름과 이메일을 다시 확인해주세요");
			} else {
				alert("ID는 " + data + "입니다");
				$(".findId .enter").hide();
				$(".resultCmt").text("회원님의 계정 아이디는\n\n" + data + "입니다.");
				$(".resultCmt").show();
				$(".buttonDiv3").show();
				/* location.href = "login.do"; */
			}
		},
		error:function(xhr, textStatus, err) {
			console.log("ajax 에러가 발생했습니다.: " + xhr.responseText);
			console.log("textStatus: " + textStatus);
			console.log("error: " + error);
		}
	});
});

//메일 select ID찾기메일
$('#_selemail').change(function() {
	$('#_selemail option:selected').each(function() {
		if($(this).val() == "") {	// 직접 입력인 경우
			$('#_email2').val("");
			$('#_email2').attr("disabled", false);
		} else {
			$('#_email2').val($(this).text());	// 선택값 입력
			$('#_email2').attr("disabled", true);	// 비활성화
		}
	});
});

/* 패스워드 찾기 버튼 */
$('#_btnRegi1').click(function() {
	if($('#_uid').val() == ""){
		alert("아이디를 입력해주세요");
		$('#_uid').focus();
		return false;
	} else if($('#_email3').val() == "" || $('#_email3').val().indexOf("@") != -1){
		if($('#_email3').val() == "") {
			alert($('#_email3').attr("data-msg") + " 입력해주세요");
			$('#_email3').focus();	
		} else {
			alert("이메일 형식이 알맞지 않습니다. 다시 확인해 주세요");
			$('#_email3').val("");
			$('#_email3').focus();
		}
		return false;
	} else if($('#_email4').val() == "") {
		alert($('#_email4').attr("data-msg") + " 입력해주세요");
		$('#_email4').focus();
		return false;
	} else {
		var email = $('#_email3').val().trim() + "@" + $('#_email4').val().trim();
		$('#_email0').val(email);
		$('#_frmForm').attr("action", "findPwdAf.do").submit();
		alert("임시 비밀번호를 이메일로 전송했습니다.\n이메일을 확인해주세요.");
	}
});

//메일 select 패스워드 찾기메일
$('#_selemail1').change(function() {
	$('#_selemail1 option:selected').each(function() {
		if($(this).val() == "") {	// 직접 입력인 경우
			$('#_email4').val("");
			$('#_email4').attr("disabled", false);
		} else {
			$('#_email4').val($(this).text());	// 선택값 입력
			$('#_email4').attr("disabled", true);	// 비활성화
		}
	});
});	
</script>

<script>
function findTypeChg1(obj){
	findType1 = obj;
	if(findType1 == "findId"){
		$(".head li:nth-child(1)").css("border-bottom", "1px solid #c80a1e").css("color", "#c80a1e")
		$(".head li:nth-child(2)").css("border-bottom", "0px").css("color", "#AAAAAA")
		$(".findId").show()
		$(".findPwd").hide()
	} else{
		$(".head li:nth-child(1)").css("border-bottom", "0px").css("color", "#AAAAAA")
		$(".head li:nth-child(2)").css("border-bottom", "1px solid #c80a1e").css("color", "#c80a1e")
		$(".findId").hide()
		$(".findPwd").show()
	}
}
</script>