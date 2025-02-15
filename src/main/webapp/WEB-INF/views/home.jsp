<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>메인 페이지</title>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
		<link rel="stylesheet" href="../../../resources/css/index.css">
		<link rel="stylesheet" href="../../../resources/css/header.css">
		<link rel="stylesheet" href="../../../resources/css/footer.css">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css" integrity="sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
	</head>
	<body>
		<!----------------- 헤더, 네브바 start ---------------->
		<header class="top-top p-3 text-bg-dark">
		    <div class="container-fluid">
		      	<div class="d-flex flex-wrap align-items-center justify-content-around">
				<a href="/">
		          	<img src="../../../resources/img/logo.png" alt="logo">
				</a>	
					
					<form class="d-flex align-items-center">
					    <div class="flex-grow-1" style="width: 400px;">
					        <input type="search" class="form-control form-control-dark text-bg-dark" placeholder="레시피 검색..." aria-label="Search">
					    </div>
					    <div>
					        <i class="fa-solid fa-magnifying-glass fa-2x"></i>
					    </div>
					</form>

			        <div class="text-end">
						<!-- 로그인 상태에 따른 처리 -->
						<c:choose>
						    <c:when test="${loggedIn}">
						        <!-- 로그인 중인 경우에 보이는 내용 -->
						        <button id="headerBtn" type="button" class="btn me-2" onclick="window.location.href='/recipe/register.oc'">레시피 등록</button>
						        <button id="headerBtn" type="button" class="btn me-2" onclick="window.location.href='/user/logout.oc'">로그아웃</button>
						        <button id="headerBtn" type="button" class="btn me-2" onclick="window.location.href='/user/mypage.oc'">마이페이지</button>
						    </c:when>
						    <c:otherwise>
						        <!-- 로그인 중이 아닌 경우에 보이는 내용 -->
						        <button id="headerBtn" type="button" class="btn me-2" onclick="window.location.href='/user/login.oc'">로그인</button>
						    </c:otherwise>
						</c:choose>

			        </div>
		      	</div>
		    </div>
		</header>	  
		<div>
			<nav class="container-nav align-items-center justify-content-center">
                <div>
                    <ul class="nav nav-pills justify-content-center pb-3 mb-3">
                        <li class="nav-item  mx-5">
                            <a class="nav-link text-white" aria-current="page" href="/">추천</a>
                        </li>
                        <li class="nav-item  mx-5">
                            <a class="nav-link text-white " href="/ranking/ranking.oc">랭킹</a>
                        </li>
                        <li class="nav-item  mx-5">
                            <a class="nav-link text-white" href="/notice/list.oc">고객센터</a>
                        </li>
                    </ul>
                </div>
            </nav>
		</div>
		<!----------------- 헤더, 네브바 end ---------------->
		<h1>추천 레시피</h1>
		<div>
			<form action="/home.oc" method="get" enctype="multipart/form-data" class="select-button">
			    <input type="submit" name="popRecipe" value="추천"/>
			    <input type="submit" name="recRecipe" value="인기"/>
			</form>
			<br>
			<!-- 추천, 인기 레시피 슬라이더 -->
			<div class="container">
	            <div class="row blog">
	                <div class="col-md-12">
	                    <div id="blogCarousel" class="carousel slide" data-ride="carousel">
	                        <ol class="carousel-indicators">
	                            <li data-target="#blogCarousel" data-slide-to="0" class="active"></li>
	                            <li data-target="#blogCarousel" data-slide-to="1"></li>
	                        </ol>
	                        
	                        
<div id="carouselExample" class="carousel slide" data-bs-ride="carousel">
    <div class="carousel-inner">
        <div class="carousel-item active">
            <div class="row">
                <c:forEach items="${rList}" var="recommend" varStatus="i">
<%--                 <c:forEach items="${tImage}" var="image" varStatus="innerLoop"> --%>
					<c:if test="${i.index < 4}">
                     <div class="col-md-3">
                         <a href="/recipe/detail.oc?recipeNumber=${recommend.recipeNumber}">
                             <img src="${pageContext.request.contextPath}/resources/RecipeTitleImgs/${recommend.titleImage.imageRename}" alt="${image.imageRename}" style="width:250px; height: 250px">
                         </a>
                     </div>
                    </c:if>
                </c:forEach>
                <c:forEach items="${rList}" var="recommend" varStatus="i">
                    <c:if test="${i.index < 4}">
                        <div class="col-md-3">
                            <tr>
                                <td class="">${recommend.recipeName}</td>
                            </tr>
                        </div>
                    </c:if>
                </c:forEach>
            </div>
        </div>
    </div>
</div>

							    </div>
<!-- 							    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExample" data-bs-slide="prev"> -->
<!-- 							        <span class="carousel-control-prev-icon" aria-hidden="true"></span> -->
<!-- 							        <span class="visually-hidden">Previous</span> -->
<!-- 							    </button> -->
<!-- 							    <button class="carousel-control-next" type="button" data-bs-target="#carouselExample" data-bs-slide="next"> -->
<!-- 							        <span class="carousel-control-next-icon" aria-hidden="true"></span> -->
<!-- 							        <span class="visually-hidden">Next</span> -->
<!-- 							    </button> -->
							</div>
                        </div>
                    </div>
                </div>
            </div>
		</div>
		<!-- 카테고리별 레시피 -->
		<div class="categoty-container">
			<div class="container-fluid" style="margin-top:20px;">
			<h1 style="color:green;">카테고리별</h1><br>
			<div class="" id="categoryBtn">
			
				<form action="/home.oc" method="get" enctype="multipart/form-data" class="select-button">
				    <input type="submit" name="foodType" value="한식"/>
				    <input type="submit" name="foodType" value="양식"/>
				    <input type="submit" name="foodType" value="일식"/>
				    <input type="submit" name="foodType" value="중식"/>
				    <input type="submit" name="foodType" value="분식"/>
				    <br>
				    <input type="submit" name="foodType" value="퓨전"/>
				    <input type="submit" name="foodType" value="간식"/>
				    <input type="submit" name="foodType" value="안주"/>
				    <input type="submit" name="foodType" value="반찬"/>
				    <input type="submit" name="foodType" value="기타"/>
				    <br>
				    <br>
				</form>
			<br>
			</div>
			<div class="container">
				<div class="tab-content" id="pills-tabContent">
					  <div class="tab-pane fade show active" id="showall" role="tabpanel" aria-labelledby="showall-tab">
					  
						<c:forEach items="${tImageCategory}" var="tImageCategory" varStatus="i">
						    <c:if test="${i.index < 10}">
						        <div class="Portfolio">
						            <a href="/recipe/detail.oc?recipeNumber=${tImageCategory.recipeNumber}">
						                <img class="card-img" src="${pageContext.request.contextPath}/resources/RecipeTitleImgs/${tImageCategory.imageRename}" alt="">
						            </a>
						            <div class="desc">
						                <c:forEach items="${foodList}" var="category" varStatus="j">
						                    <c:if test="${j.index == i.index}">
						                        레시피 : ${category.recipeName} <br>
						                        카테고리 : ${category.recipeCategory} <br>
						                        조회수 : ${category.recipeCount}
						                    </c:if>
						                </c:forEach>
						            </div>
						        </div>
						    </c:if>
						</c:forEach>

					</div>
				</div>
			</div>
		
<!-- 			<div> -->
<!-- 				<table> -->
						
<!-- 					<tr align="center"> -->
<!-- 						<td colspan="5"> -->
<%-- 							<c:if test="${pInfo.startNavi ne '1' }"> --%>
<%-- 								<a href="/notice/list.kh?page=${pInfo.startNavi -1 }">이전</a> --%>
<%-- 							</c:if> --%>
<%-- 							<c:forEach begin="${pInfo.startNavi }" end="${pInfo.endNavi }" var="p"> --%>
<%-- 								<a href="/notice/list.kh?page=${p }">${p }</a> --%>
<%-- 							</c:forEach> --%>
<%-- 							<c:if test="${pInfo.endNavi ne pInfo.naviTotalCount }"> --%>
<%-- 								<a href="/notice/list.kh?page=${pInfo.endNavi +1 }">다음</a> --%>
<%-- 							</c:if> --%>
<!-- 						</td> -->
<!-- 					</tr> -->
<!-- 				</table> -->
	
			</div>
		</div>
		
		<!----------------- 푸터 start ---------------->
		<footer class="py-3 my-4">	
			<ul class="nav justify-content-center border-bottom pb-3 mb-3 mx-auto bg-light">
			      <li class="nav-item"><a href="#" class="nav-link px-2 text-body-secondary mx-4">사이트 이용약관</a></li>
			      <li class="nav-item"><a href="#" class="nav-link px-2 text-body-secondary mx-5">개인정보 처리방침</a></li>
			      <li class="nav-item"><a href="#" class="nav-link px-2 text-body-secondary mx-5">고객센터</a></li>
			</ul>
			
			<p class="text-center text-body-secondary">회사 주소 : 서울시 중구</p>
			<p class="text-center text-body-secondary">회사 전화번호 : 01000001234</p>
			<p class="text-center text-body-secondary">회사 대표 : 추노</p>
			<p class="text-center text-body-secondary">사업자번호 : 123123123</p>
			<p class="text-center text-body-secondary">© All Right reserved OneCook</p>
        </footer>
		<!----------------- 푸터 end ---------------->
		<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
		<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	</body>
</html>