<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    String path = request.getContextPath();
    String basepath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
	<base href="<%=basepath %>" />
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>每日签到</title>
	
	<!-- CSS -->
	<link rel="stylesheet" href="css/style.css">
	 <link rel="stylesheet" href="css/children.css">

	<!-- 在线图标库 地址：http://fontawesome.dashgame.com/-->
	<link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">

	<!-- layui css -->
	<link rel="stylesheet" href="layui/css/layui.css" media="all">
	<script type="text/javascript" src="js/jquery-1.11.0.min.js"></script> 
	
	<!-- layui js -->
	<script src="layui/layui.js"></script>
	<style>
        * {
            margin: 0;
            padding: 0
        }

        li {
            list-style: none
        }

        html,
        body {
            width: 100%;
            background-color: #4D56A3;
        }

        div {
            width: 100%;
        }

        .clear {
            clear: both
        }

        .clear:after {
            clear: both;
            display: table;
            content: ''
        }

        .sign-layer {
            position: fixed;
            top: 0;
            bottom: 0;
            left: 0;
            z-index: 888;
            display: none;
            width: 100%
        }

        .darkcolor {
            color: #b25d06 !important;
        }

        .darkbcolor {
            background-color: #b25d06 !important;
        }

        .trh {}

        .trh th {
            width: 14.2857%;
            font-size: 140%;
            text-align: center;
            line-height: 60px;
        }

        .trb {
            font-size: 200%;
            font-weight: bold;
        }

        .trb td {
            width: 14.2857%;
            height: calc(width);
            min-height: 50px;
            line-height: 200%;
            text-align: center;
        }

        .trb td div {
            border-radius: 5px;
            background-color: #FFFFF1;
            height: 100%;
            vertical-align: middle;
            position: relative;
        }

        .radius5 {
            border-radius: 5px;
            -webkit-border-radius: 5px;
            -moz-border-radius: 5px;
            -o-border-radius: 5px;
            -ms-border-radius: 5px;
        }

        .sign-cand {
            background-color: #FFBD66;
            padding-bottom: 10px;
            border-radius: 10px;
        }

        .sign-blank {}

        .sign-signed {}

        .sign-unsign {}

        .sign-today {
            background-color: #FFEF7E !important;
        }

        .btns {
            font-size: 150%;
            padding: 4px 10px;
            cursor: pointer;
        }

        .sign-pin {
            position: absolute !important;
            left: 0;
            top: 0;
            margin: 0;
        }

        .svg-triangle {
            width: 35px !important;
            height: 35px !important;
            margin: 0px auto;
        }

        .svg-triangle polygon {
            fill: #7ac143;
            stroke: #65b81d;
            stroke-width: 2;
        }

        #spCurrentDay {
            font-size: 120%;
            line-height: 40px;
            padding-left: 10px;
        }

        .circle {
            width: 100px;
            height: 100px;
            background-color: #FFEB42;
            border-radius: 50%;
            -moz-border-radius: 50%;
            -webkit-border-radius: 50%;
        }


        .smallClose {
            color: grey;
            font-size: 140%;
            float: right;
            margin-right: 10px;
            cursor: pointer;
        }

        .sign-history-body {
            width: 100%;
            height: 100%;
            text-align: center;
            vertical-align: middle;
            display: flex;
            justify-content: center;
            align-items: center;
            background-color: rgba(0, 0, 0, .33);
        }

        .sign-history-bodymain {
            border: 3px #33b23f solid;
            border-radius: 5px;
            background-color: #fff;
            opacity: 1;
        }

        .sign-history-head {
            margin-top: 25px;
            color: #666;
            text-align: center;
            font-size: 14px
        }

        .sign-history-head li {
            float: left;
            width: 25%
        }

        .sign-history-head li h4 {
            color: #33b23f;
            font-size: 40px;
            line-height: 50px
        }

        .sign-history-table {
            overflow: hidden;
            border-radius: 5px 5px 0 0;
        }

        .sign-history-table table {
            width: 100%;
            color: #666;
            text-align: center;
            font-size: 1pc;
            border-spacing: 0
        }

        .sign-history-table table th {
            width: 33.3%;
            background-color: #f2f2f2;
            text-align: center;
            line-height: 40px
        }

        .sign-history-table td {
            width: 33.3%;
            border-bottom: 1px #e5e5e5 dashed;
            line-height: 34px
        }
    </style>
</head>
<body>
	<div id="divmain">
        <!--签到-->
        <div style="width:100%;">
            <div style="width:100%;text-align:center;vertical-align:middle;">
                <div style="margin-top:20px;">
                    <div class="circle" style="margin: 0 auto;">
                    	<c:if test="${isCheck }">
                    		<a class="btns radius5 darkcolor" style="line-height:100px;font-weight:bold;font-size:160%;" id="btnSign">已签到</a>
                    	</c:if>
                        <c:if test="${!isCheck}">
                    		<a   href="task/addBookMission" class="btns radius5 darkcolor" style="line-height:100px;font-weight:bold;font-size:160%;">签到</a>
                    	</c:if>
                    </div>
                </div>
                <div style="padding:5px 0 10px 0;"><span style="color:white;">&emsp;<strong id="spSignDays">&emsp;</strong></span></div>
            </div>
        </div>

        <!--签到日历-->
        <div class="sign-cand">
            <div>
                <table style="width:100%;">
                    <tbody>
                        <tr>
                            <td style="text-align:left;"><span class="darkcolor" id="spCurrentDay"></span></td>
                            <td style="text-align:right;">
                                <a href="task/selectTaskReception" class="btns radius5 darkbcolor" style="color:white;font-size:120%;margin-right:10px;">点击返回</a>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <div style="width:100%;">
                <table id="tblSign" class="radius5" style="width:100%;" border="0">
                    <thead>
                        <tr class="darkcolor trh" style="background-color:#FFF7EE;">
                            <th id="th0">周日</th>
                            <th>周一</th>
                            <th>周二</th>
                            <th>周三</th>
                            <th>周四</th>
                            <th>周五</th>
                            <th>周六</th>
                        </tr>
                    </thead>
                    <tbody id="signTable">
                        <tr class="darkcolor trb">
                            <td>
                                <div>1</div>
                            </td>
                            <td>
                                <div><span>2</span></div>
                            </td>
                            <td>
                                <div><span>3</span></div>
                            </td>
                            <td>
                                <div>
                                    <span>4</span><svg xmlns="http://www.w3.org/2000/svg" version="1.1" class="sign_pin svg-triangle ">
                                        <polygon points="0,0 35,0 0,35" /></svg>
                                </div>
                            </td>
                            <td>
                                <div><span>5</span></div>
                            </td>
                            <td>
                                <div><span>6</span></div>
                            </td>
                            <td>
                                <div><span>7</span></div>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>

        <!--签到历史-->
        <div id="divHistory" class="sign-layer">
            <div class="sign-history-body">
                <div class="radius sign-history-bodymain">
                    <a id="btnPopClose" class="smallClose">&times;</a>
                    <ul class="sign-history-head clear">
                        <li>
                            <p>连续签到</p>
                            <h4>5</h4>
                        </li>
                        <li>
                            <p>本月签到</p>
                            <h4>17</h4>
                        </li>
                        <li>
                            <p>总共签到数</p>
                            <h4>28</h4>
                        </li>
                        <li>
                            <p>签到累计奖励</p>
                            <h4>30</h4>
                        </li>
                    </ul>
                    <div class="sign-history-table">
                        <table>
                            <thead>
                                <tr>
                                    <th>签到日期</th>
                                    <th>奖励</th>
                                    <th>说明</th>
                                </tr>
                            </thead>
                        </table>
                        <table>
                            <tbody>
                                <tr>
                                    <td>2016-1-6 14:23:45</td>
                                    <td>0.20</td>
                                    <td>连续签到19天奖励</td>
                                </tr>
                                <tr>
                                    <td>2016-1-6 14:23:45</td>
                                    <td>0.20</td>
                                    <td>分享奖励</td>
                                </tr>
                                <tr>
                                    <td>2016-1-6 14:23:45</td>
                                    <td>0.20</td>
                                    <td>连续签到19天奖励</td>
                                </tr>
                                <tr>
                                    <td>2016-1-6 14:23:45</td>
                                    <td>0.20</td>
                                    <td>连续签到19天奖励</td>
                                </tr>
                                <tr>
                                    <td>2016-1-6 14:23:45</td>
                                    <td>0.20</td>
                                    <td>连续签到19天奖励</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.1/jquery.min.js"></script>
<script type="text/javascript">
    var dataObjs = null;
    //Demo 参考了这个例子
    //https://frankgu2014.github.io/%E7%AD%BE%E5%88%B0/demo.html

    window.onload = function () {
        //构建日期数据
        var da = buildData();
        dataObjs = da;
        //控件初始化
        initControls(da);
        //渲染
        renderData(da);
        //通过接口获取数据，合并再重新渲染
        getData();
    }
    //控件
    function initControls(da) {
        $("#spCurrentDay").text(da.current);
        //$('td').height($('#th0').width());

        $("#btnHistory").on('click', function () { $('#divHistory').fadeIn(); })
        $("#btnPopClose").on('click', function () { $('#divHistory').fadeOut(); });

        $("#btnSign").on('click', function () {
            //if (dataObjs && dataObjs.isSigned) return;
            //调用服务器的签到方法
            var btn = $("#btnSign");
            btn.attr('disabled', 'disabled');
            btn.removeClass('actived');
            btn.text('已签到');
            //WH.getAjax(baseUrl + 'Sign').done(function (d) {
            //    if (!d.IsSuccess) {
            //        Msg.notifyWarn(d.ResultMessage);
            //        return;
            //    }
            //    dataObjs.signToday();
            //    var btn = $("#btnSign");
            //    btn.attr('disabled', 'disabled');
            //    btn.removeClass('actived');
            //    btn.text('已签到');
            //}).fail(ajaxError);
        });


    }

    //生成日期数据
    function buildData() {
        var da = {
            dates: [],//日期数据，从1号开始
            current: '',//当前日期
            monthFirst: 1,//获取当月的1日等于星期几
            month: 0,//当前月份
            days: 30,//当前月份共有多少天
            day: 0,//今天几号了
            isSigned: false,//今天是否已经签到
            signLastDays: "",//连续签到日子 */

            signToday: function () {
                this.isSigned = true;
                this.dates[this.day].isSigned = true;
            },
        };
        var ds = [];
        //初始化日期数据
        var dt = new Date();
        /*   console.log(dt.getDay());  */
        da.current = dt.getFullYear() + '年' + (dt.getMonth() + 1) + '月' + dt.getDate() + '日'; //dt.ToString('yyyy年M月d日');
        da.monthFirst = new Date(dt.getFullYear(), dt.getMonth(), 1).getDay();
        da.month = dt.getMonth() + 1;
        da.days = new Date(dt.getFullYear(), parseInt(da.month), 0).getDate();//获取当前月的天数
        da.day = dt.getDate();

        for (var i = 1; i < da.days + 1; i++) {
            var o = {
                isSigned: false,//是否签到了
                num: i,//日期
                isToday: i == da.day,//是否今天
                isPass: i < da.day,//时间已过去
            };
            ds[i] = o;
        }
        da.dates = ds;
        return da;
    }

    //渲染数据
    function renderData(da) {
        var signDays = document.getElementById('spSignDays');
        signDays.innerText = da.signLastDays;

        var root = document.getElementById("signTable");
        root.innerHTML = '';

        var tr, td;
        var st = da.monthFirst;
        var dates = da.dates;

        var rowcount = 0;
        //最多6行
        for (var i = 0; i < 42; i++) {
            if (i % 7 == 0) {
                //如果没有日期了，中断
                if (i > (st + da.days))
                    break;

                tr = document.createElement('tr');
                tr.className = 'darkcolor trb';
                root.appendChild(tr);
                rowcount++;
            }
            //前面或后面的空白
            if (i < st || !dates[i - st + 1]) {
                td = document.createElement('td');
                td.innerHTML = '<div class="sign-blank"><span></span></div>';
                tr.appendChild(td);
                continue;
            }
            //填充数字部分
            var d = dates[i - st + 1];
            td = document.createElement('td');
            var tdcss = '';
            if (d.isToday)
                tdcss = 'sign-today';
            else if (d.isPass)
                tdcss = 'sign-pass';
            else
                tdcss = 'sign-future';

            if (d.isSigned) {
                tdcss = 'sign-signed ' + tdcss;
                td.innerHTML = '<div class="' + tdcss + '"><span>' + d.num + '</span><svg xmlns="http://www.w3.org/2000/svg" version="1.1" class="sign-pin svg-triangle "><polygon points="0,0 35,0 0,35" /></svg></div>';
            } else {
                tdcss = 'sign-unsign ' + tdcss;
                td.innerHTML = '<div class="' + tdcss + '"><span>' + d.num + '</span></div>';
            }
            tr.appendChild(td);
        }
        //计算是否需要添加最后一行
        if ((st + da.days + 1) / 7 > rowcount)
            root.appendChild(tr);
    }

    //从服务器获取数据
    function getData() {
    	//是否已经签到，签到日期
    	$.ajax({
    		type:'GET',
    		url:'task/selectBookMission',
    		data:null,
    		resultType:'json',
    		success:function(res){
    			var signDays = res.date;
   			 	var d = { IsSigned: true, SignDays: signDays };
   		        var da = dataObjs;
   		        if (!da) return;
   		        da.isSigned = d.IsSigned;
   		        for (var i = 1; i <= da.days; i++) {
   		            var dx = da.dates[i];
   		            dx.isSigned = d.SignDays.indexOf(dx.num) >= 0;
   		        }
   		        renderData(da);
    		}
    	});
    }
</script>