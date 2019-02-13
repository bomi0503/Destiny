<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

<style>
html{overflow-x:hidden; overflow-y:scroll;}
html, body{margin:0; padding:0; width:100%; height:100%;}
header, section, article, div, p, h1, h2, h3, h4, h5, h6, ul, ol, li, dl, dt, dd, span{margin:0; padding:0;}
ul{list-style:none;}
a, a:hover, a:focus, a:active, a:link, a:visited{text-decoration:none;}

.wrap{max-width:1440px; margin:0 auto;}
table{border-collapse:collapse; table-layout:fixed;}
.table-type01{width:100%;}
.table-type01 thead tr th{position:relative; padding:13px 5px; vertical-align:middle; text-align:center; border-top:2px solid #000; font-size:16px; font-weight:600;}
.table-type01 thead tr th:before{content:''; position:absolute; top:50%; left:0; width:1px; height:20px; background:#DDD; transform:translateY(-50%);}
.table-type01 thead tr th:first-child:before{display:none;}
.table-type01 tbody tr td{padding:13px 5px; vertical-align:middle; text-align:center; border-bottom:1px solid #DDD; font-size:14px;}
.table-type01 tbody tr:first-child td{border-top:1px solid #DDD;}

.pager-wrap{margin-top:30px; text-align:center; font-size:0;}
.pager-wrap .btn-page-move{display:inline-block; vertical-align:top; width:30px; height:30px; line-height:30px; font-size:12px; font-weight:600; color:#666;}
.pager-wrap ul{display:inline-block; margin:0 15px;}
.pager-wrap ul li{display:inline-block; vertical-align:top; margin:0 5px;}
.pager-wrap ul li a{display:block; width:30px; height:30px; line-height:30px; background:#DDD; border-radius:50%; font-size:12px; color:#000;}
.pager-wrap ul li.on a{background:#fed53e;}
</style>
</head>
<body>
    <div class="wrap">
        <table class="table-type01">
            <colgroup>
                <col style="width:5%">
                <col style="width:10%">
                <col style="width:50%">
                <col style="width:25%">
                <col style="width:5%">
            </colgroup>
            <thead>
                <tr>
                    <th>제목1</th>
                    <th>제목2</th>
                    <th>제목3</th>
                    <th>제목4</th>
                    <th>제목5</th>
                </tr>
            </thead>
    
            <tbody>
                <tr>
                    <td>내용1</td>
                    <td>내용2</td>
                    <td>내용3</td>
                    <td>내용4</td>
                    <td>내용5</td>
                </tr>
    
                <tr>
                    <td>내용1</td>
                    <td>내용2</td>
                    <td>내용3</td>
                    <td>내용4</td>
                    <td>내용5</td>
                </tr>
    
                <tr>
                    <td>내용1</td>
                    <td>내용2</td>
                    <td>내용3</td>
                    <td>내용4</td>
                    <td>내용5</td>
                </tr>
    
                <tr>
                    <td>내용1</td>
                    <td>내용2</td>
                    <td>내용3</td>
                    <td>내용4</td>
                    <td>내용5</td>
                </tr>
    
                <tr>
                    <td>내용1</td>
                    <td>내용2</td>
                    <td>내용3</td>
                    <td>내용4</td>
                    <td>내용5</td>
                </tr>
            </tbody>
        </table>

        <div class="pager-wrap">
            <a href="#" class="btn-page-move">&lt;&lt;</a>
            <a href="#" class="btn-page-move">&lt;</a>
            <ul>
                <li class="on"><a href="#">1</a></li>
                <li><a href="#">2</a></li>
                <li><a href="#">3</a></li>
                <li><a href="#">4</a></li>
                <li><a href="#">5</a></li>
            </ul>
            <a href="#" class="btn-page-move">&gt;</a>
            <a href="#" class="btn-page-move">&gt;&gt;</a>
        </div>
    </div>

</body>
</html>