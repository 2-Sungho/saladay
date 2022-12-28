<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="pagination" value="${map.pagination}"/>
<c:set var="optionList" value="${map.optionList}"/>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>관리자-옵션관리</title>
    <link rel="stylesheet" href="/resources/css/admin/menuManage/updateMenu.css">
    <!-- 폰트어썸 -->
    <script src="https://kit.fontawesome.com/e4f69a07ca.js" crossorigin="anonymous"></script>
  </head>

<body>
    <jsp:include page="/WEB-INF/views/main/adminHeader.jsp"></jsp:include>
    
    <section class="menu-wrapper">
    
      <div class="menu-m-tit">
        <div>
          <span>옵션 관리</span>
        </div>
        <div class="m-btn-area">
          <button type="button" id="addBtn">추가</button>
          <button type="button" id="delBtn" onclick="deleteValue();">삭제</button>
        </div>
      </div>

      <table>
        <caption style="display:none">
            <summary>메뉴조회</summary>
        </caption>

        <colgroup>
          <col width="2%">
          <col width="32%">
          <col width="20%">
          <col width="23%">
          <col width="23%">
        </colgroup>

        <thead>
          <tr>
            <th scope="col"><input type="checkbox" name="allCheck" id="allCheck"></th>
            <th scope="col"><span>옵션명</span></th>
            <th scope="col"><span>구분</span></th>
            <th scope="col"><span>옵션가격</span></th>
            <th scope="col"><span>옵션칼로리</span></th>
          </tr>
        </thead>
        
        <tbody>
          <c:forEach items="${optionList}" var="option">
            <tr>
              <td scope="col"><input type="checkbox" name="rowCheck" value="${option.optionNo}"></td>
              <td scope="col"><span class="menu-n"><a href="${option.optionImage}">${option.optionName}</a></span></td>
              <c:choose>
                <c:when test="${option.optionType eq 'M'}">
                <td scope="col"><span class="menu-i">메인토핑</span></td>
                </c:when>
                <c:when test="${option.optionType eq 'S'}">
                <td scope="col"><span class="menu-i">소스</span></td>
                </c:when>
                <c:otherwise>
                <td scope="col"><span class="menu-i">야채</span></td>
                </c:otherwise>
              </c:choose>
              <td scope="col"><span class="menu-p">${option.price}</span></td>
              <td scope="col"><span class="menu-c">${option.optionCalorie} Kcal</span></td>
            </tr>
          </c:forEach>
        </tbody>
      </table>

      <div class="pagination-area">
            <c:if test="${not empty optionList}">
                <ul class="pagination">
                    <!-- 이전 목록 마지막 번호로 이동 --> 
                    <li><a href="?cp=${pagination.prevPage}">&lt;</a></li>
                        <c:forEach var="i" begin="${pagination.startPage}" 
                        end="${pagination.endPage}" step="1">
                            <c:choose>
                                <c:when test="${i == pagination.currentPage}">
                                    <!-- 현재 보고있는 페이지 -->
                                    <li><a class="current">${i}</a></li>
                                </c:when>
                                <c:otherwise>
                                    <!-- 현재 페이지를 제외한 나머지 -->
                                    <li><a href="?cp=${i}">${i}</a></li>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                    <!-- 다음 목록 시작 번호로 이동 -->
                    <li><a href="?cp=${pagination.nextPage}">&gt;</a></li>
                </ul>
            </c:if>
        </div>
    </section>  
    
    <jsp:include page="/WEB-INF/views/main/footer.jsp"></jsp:include>

    <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>

    <script src="/resources/js/admin/menuManage/updateOption.js"></script>
</body>
</html>

