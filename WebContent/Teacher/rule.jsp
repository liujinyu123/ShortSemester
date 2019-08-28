<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>

<%@page import="Bean.User"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">  
	<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
	<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="./js/lhgcore.js" ></script>
<script type="text/javascript" src="./js/lhgcalendar.js"></script>
<style type="text/css">
body,#table1 td,#table1 input,#table1 select{
		font-family: Arial,'宋体';
		font-size: 14px;
	}
	#table1 input:focus {
        outline: none;
        border:#9fc9f4 solid 1px;
        box-shadow: 0 0 2px #3998f8;
    }
	#table1{
		border-collapse:separate;
		border-spacing:10px;
	}
	.scan{
		width: 200px;
	}
	.cal_panel {
	    cursor: default;
	    border: 2px solid #0aa6e0;
	    padding: 3px 2px 2px 3px;
	    background-color: #fff;
	    background-image: url(../img/d_h_bg.gif);
	    background-repeat: repeat-x;
	    font: 12px Verdana, Arial, sans-serif;
	}
	#table2 td{
		line-height:2.0;
	}
	#table2 thead td{
		text-align: center;
		font-size: 14px;
	}
	#table2 tbody td{
		text-align: left;
		height: 45px;
	}
	#table2 a{
		text-decoration: none;
	}
	#table2 a:visited {
		color: blue;
	}
	#table2 a:hover {
		color: red;
	}
</style>
<script type="text/javascript">

var i = 1;
var j = 0;
function add2(){
	document.getElementById('p3').style.display="inline";
	i++;
	j++;
	document.getElementById('number1').value=i;
	document.getElementById('number2').value=j;
};
function add1(){
	document.getElementById('p2').style.display="inline";
	i++;
	j++;
	document.getElementById('number1').value=i;
	document.getElementById('number2').value=j;
};
function add3(){
	document.getElementById('p4').style.display="inline";
	i++;
	j++;
	document.getElementById('number1').value=i;
	document.getElementById('number2').value=j;
};
function delete1(){
	alert("此条件不能删除！！")
};
function delete2(){
	document.getElementById('p2').style.display="none";
	i--;
	j--
	document.getElementById('number1').value=i;
	document.getElementById('number2').value=j;
};
function delete3(){
	document.getElementById('p3').style.display="none";
	i--;
	j--;
	document.getElementById('number1').value=i;
	document.getElementById('number2').value=j;
};
function delete4(){
	document.getElementById('p4').style.display="none";
	i--;
	j--;
	document.getElementById('number1').value=i;
	document.getElementById('number2').value=j;

}
</script>
<title>Insert title here</title>
</head>
<body>
<form action="${pageContext.request.contextPath}/RuleServlet?method=add" method="post">

     <div id="p1" style="padding-left:70px">
     &nbsp;  &nbsp;  &nbsp;
        <div class="form-inline">
                <input type="button" value="+" onclick="add1()"  class="btn"/>
           <input type="button" value="-" onclick="delete1()"  class="btn"/>  
           <input type="button" value="条件一" class="btn"/>          
              <input type="text" name="shuru1" id="shuru1" class="form-control"/>  
            </div>
        </div>
<div hidden id="p2" class="row">

  <div class="form-inline">
   &nbsp;  &nbsp;  &nbsp; &nbsp;  &nbsp;  &nbsp; &nbsp;  &nbsp;  &nbsp;
  <input type="button" value="+" onclick="add2()" class="btn"/>
<input type="button" value="-" onclick="delete2()" class="btn"/>
 <input type="button" value="条件二" class="btn"/>   
<input type="text" name="shuru2" id="shuru2" class="form-control"/>



</div>
</div>


<div hidden id="p3">
<div class="form-inline">
 &nbsp;  &nbsp;  &nbsp; &nbsp;  &nbsp;  &nbsp; &nbsp;  &nbsp;  &nbsp;
<input type="button" value="+" onclick="add3()" class="btn"/>
<input type="button" value="-" onclick="delete3()" class="btn"/>
 <input type="button" value="条件二" class="btn"/> 
<input type="text" name="shuru3" id="shuru3" class="form-control"/>
<input type="hidden" value="1" name="number" id="number" class="btn"/>
</div>
</div>
<br>
<div hidden id="p4">
<div class="form-inline">
&nbsp;  &nbsp;  &nbsp; &nbsp;  &nbsp;  &nbsp; &nbsp;  &nbsp;  &nbsp;
<input type="button" value="+"  class="btn"/>

<input type="button" value="-" onclick="delete4()" class="btn"/>
  <input type="button" value="条件四" class="btn"/> 
<input type="text" name="shuru4" id="shuru4" class="form-control"/>
</div>
</div>
<p>
</p>
<p>			
<input type="submit" name="提交" class="btn" />
</p>

</form>

   
    </tbody>

</body>
</html>