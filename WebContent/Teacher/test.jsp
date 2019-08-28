<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>制作进度条的两种方法</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<style>
*{
    margin:0;
    padding:0;
}
body{font-size:12px;}h1{font-size:15px;}
.wrap{
    font-size: 12px;
    margin:40px auto;
    width:400px;
}
/*进度条样式*/
.progressbar_1{
    background-color:#eee;
    height:16px;
    width:150px;
    border:1px solid #bbb;
    color:#222;
}
.progressbar_1 .bar {
    background-color:#6CAF00;
    height:16px;
    width:0;
}
</style>
</head>
<body>
<div class="wrap">
    <h1>1，构建基本的HTML结构和CSS样式</h1>
   

 
    0%的状态：
    <div class="progressbar_1">
        <div class="bar"></div>
    </div>
   

 
    50%的状态：
    <div class="progressbar_1">
        <div class="bar" style="width: 50%;"></div>
    </div>
   

 
    80%的状态：
    <div class="progressbar_1">
        <div class="bar" style="width: 80%;"></div>
    </div>
    
   

 
    100%的状态：
    <div class="progressbar_1">
        <div class="bar" style="width: 100%;"></div>
    </div>
   
 

</div>
</body>
</html> 