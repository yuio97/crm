<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%
    String path = request.getContextPath();
    String basepath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
	<base href="<%=basepath %>" />
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>WangID办公管理系统</title>

    <!-- CSS -->
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/children.css">

    <!-- 在线图标库 地址：http://fontawesome.dashgame.com/-->
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">

    <!-- layui css -->
    <link rel="stylesheet" href="layui/css/layui.css">
    <script type="text/javascript" src="js/jquery-1.11.0.min.js"></script>
    <script src="js/vue.min.js"></script>
    <script src="js/axios.min.js"></script>    
</head>

<body>
    <div class="wangid_conbox" id="account">
        <!-- 当前位置 -->
        <div class="zy_weizhi bord_b">
            <i class="fa fa-home fa-3x"></i>
            <a>首页</a>
            <a>供应商信息管理</a>
            <span>供应商信息列表</span>
        </div>
        <!-- 筛选 --> 
        
        <div class="shuaix ">
            <div>
                <a  href="addStaff.jsp" class="layui-btn layui-btn-sm" style="margin-right: 50px; margin-left: 25px;">添加员工</a>
            </div>
             <div class="left"  style="margin-right:10px;">
                
                <select>   
                    <option value="按注册时间查询">按注册时间查询</option>                      
                </select>
            </div>
            <div class="layui-input-inline">
                <input type="text" class="layui-input" id="test2" placeholder="开始时间"> 
            </div>
            <div class="layui-input-inline">
                <input type="text" class="layui-input"  id="test3" placeholder="结束时间">
            </div>
            <div class="right"  style="margin-right:30px;" > 
                    <a href="javascript:;" >查询</a>
            </div>
  
            <!-- <div class="center">统计：【大：20 中：30 小：60】</div> -->
            <div class="right">
                <input type="text" id="test4" placeholder="按用户名进行检索" >
                
            </div>
            <div class="right"  style="margin-right:30px;" @click="seach()" > 
                    <a href="javascript:;" >查询</a>
            </div>
        </div>
        <!-- 下面写内容 -->

        <table class="layui-table" lay-filter="mylist" lay-size="lg">
            <thead>
                <tr> 
                  
                    <th >
                        <button @click="del" class="layui-btn layui-btn-sm">删除</button>
                    </th>
                    <th style="text-align:center" >操作</th>
                    <th lay-data="{field:'time',align:'center', minWidth:120}">用户名</th>
                    <th lay-data="{field:'www',align:'center',minWidth:260}">注册时间</th>
                    <th lay-data="{field:'www',align:'center',minWidth:260}">上次登录时间</th>
                    <th lay-data="{field:'user',align:'center',width:180}">是否锁定</th>


                    
                </tr> 
            </thead>
            <tbody>
                <tr v-for="s in accountList.list"> 
                    <td><input type="checkbox" :value="s.sysAccountId" name="chec" ></td>
                    <td style="text-align:center"> <a style="color:#205b9e;" :href="'goUpdateStaff?staffId=' + s.sysAccountId" >修改</a>
                        丨<a style="color:#205b9e;" href="javascript:;"  @click="lockk(s.sysAccountId,s.sysAccountSta)">{{s.sysAccountSta == 1?'解锁':'锁定'}}</a>
                        丨<a style="color:#205b9e;" href="javascript:;"  @click="checkk(s.sysStaffId)">详情</a> 
                    </td>
                    <td>{{s.sysAccountName}}</td>
                    <td>{{s.sysAccountTime}}</td>
                   
                    <td>{{s.sysLastlogin}}</td>
                    <td>
                        {{s.sysAccountSta == 1?'是':'否'}}
                    </td>
                   
                 
                </tr> 
                <tr>
                    <td colspan="6">
                        <div class="layui-box layui-laypage layui-laypage-default">
                            <a href="javascript:;" class="layui-laypage-prev" v-show="accountList.hasPreviousPage" >
                                    <i class="layui-icon"></i>
                            </a>
                            <span class="layui-laypage-curr" >
                                <em class="layui-laypage-em"></em>
                                <em>1</em>
                            </span>
                            <a href="javascript:;" class="layui-laypage-prev" >
                                <i class="layui-icon"></i>
                            </a>
                            <span>
                                到第
                                <input type="text" min="1" value="" class="layui-input">
                                页
                                <button type="button" class="layui-laypage-btn">确定</button>
                            </span>
                            <span class="layui-laypage-count">共18条</span>
                            <span class="layui-laypage-limits">
                                <select lay-ignore>
                                    <option value="10" selected>10条/页</option>
                                    <option value="10" >20条/页</option>
                                    <option value="10" >30条/页</option>
                                    <option value="10" >40条/页</option>
                                    <option value="10" >50条/页</option>
                                </select>
                            </span>
                            
                        </div>
                    </td>     
                </tr>                  
            </tbody>  
        </table>

    </div> 
<!-- 自定义头部工具栏 -->
    <script>
        new Vue({
            el:'#account',
            data:{
                accountList:[]
            },
            created() {
                var _this = this;
                axios.get('/getAccountList')
                .then(function(res){
                    _this.accountList = res.data;
                })
                .catch(err => {
                    console.error(err); 
                });
            },
            methods: {                
                checkk:function(id){
                    
                     Vip_xq(id);
                    
                },
                lockk:function(id,sta){
                    var r = confirm('请确认操作');   
                    if(r){
                        var _this = this;
                        axios.get('/lockAccount?accountId='+id+'&sta='+sta)
                        .then(function(res){
                            // _this.accountList = res.data;
                            _this.loadData();
                        })
                        .catch(err => {
                            console.error(err); 
                        });
                    }
                },
                loadData:function(){
                    var _this = this;
                    axios.get('/getAccountList?')
                    .then(function(res){
                        _this.accountList = res.data;
                    })
                    .catch(err => {
                        console.error(err); 
                    });
                },
                del:function()
                {   
                    //  var r = []
                    // r = $("input[name='chec']:checked");
                    var chk_value =[];//定义一个数组    
                        $('input[name="chec"]:checked').each(function(){//遍历每一个名字为interest的复选框，其中选中的执行函数    
                        chk_value.push($(this).val());//将选中的值添加到数组chk_value中    
                        });
                    console.log(chk_value) ;             
                    var url = '';
                    for(var i = 0;i<chk_value.length;i++){
                                                

                            url = url + '&accountId='+chk_value[i];                        
                    }
                    url = 'delAccount?'+ url;
                    console.log(url);
                    
                    var _this = this;
                    axios.post(url)
                    .then(function(res){
                        _this.loadData();
                    })
                    .catch(err => {
                        console.error(err); 
                    });
                },
                seach:function(){
                    var start = $('#test2').val();
                    var end = $('#test').val();
                    var name = $('#test4').val();

                    var _this = this;
                    axios.post('')
                    .then(function(res){
                        _this.loadData();
                    })
                    .catch(err => {
                        console.error(err); 
                    });
                }


            }
            
        })

        function checcc(obj){
            console.log(obj.value);
            
        }
    </script>

    <script type="text/html" id="toolbarDemo">
        <div class="layui-btn-container"> 
            <button class="layui-btn layui-btn-sm" lay-event="getCheckLength">删除</button> 
        </div>
    </script> 
    <!-- layui js -->
    <script src="layui/layui.js"></script>
    
</body>

</html>
<script type="text/javascript">


	//静态表格
    layui.use('table',function(){
            var table = layui.table;
            // //转换静态表格
            // table.init('mylist', {
            //     height: 'full-130' //高度最大化减去差值,也可以自己设置高度值：如 height:300
            //     ,count: 50 //数据总数 服务端获得
            //     ,limit: 10 //每页显示条数 注意：请务必确保 limit 参数（默认：10）是与你服务端限定的数据条数一致
            //     ,page:true //开启分页 
            //     ,toolbar: '#toolbarDemo' //指向自定义工具栏模板选择器 
            //     ,defaultToolbar:['filter', 'exports']
            //     ,limits:[10, 20, 30, 40, 50]//分页显示每页条目下拉选择
            //     ,cellMinWidth: 60//定义全局最小单元格宽度，其余自动分配宽度
            // }); 
            //监听头工具栏事件
            table.on('toolbar(mylist)', function(obj){
                var checkStatus = table.checkStatus(obj.config.id)
                ,data = checkStatus.data; //获取选中的数据 
                switch(obj.event){  
                case 'getCheckLength':
                    if(data.length === 0){
                    layer.msg('请选择一行');
                    } else {
                    layer.msg('删除');
                    }
                break;
                };
            }); 
        }); 
        layui.use('laydate', function(){
        var laydate = layui.laydate; 
        //年选择器
        laydate.render({
            elem: '#test2'
            ,type: 'month'
            
        });
        
        //年月选择器
        laydate.render({
            elem: '#test3'
            ,type: 'month'
        });
    });
    //  iframe层  详情信息
    function Vip_xq(id){
        //iframe层 
        layer.open({
            type: 2,//层类型
            title: "详情信息",//标题
            closeBtn: 1, //不显示关闭按钮
            shade: [0.3],//遮罩
            skin: 'demo_class_color',//iframe皮肤
            shadeClose:Boolean,//点击遮罩关闭
            area: ['800px', '460px'],
            // offset: 'rb', //右下角弹出
            // time: 2000, //2秒后自动关闭
            anim: 5,//动画
            content: ['/getStaffInfo?id='+id, 'no'], //iframe的url，no代表不显示滚动条 
        }); 
        
    }
    //  iframe层  回访记录
    function Vip_hf(){
        //iframe层 
        layer.open({
            type: 2,//层类型
            title: "详情信息",//标题
            closeBtn: 1, //不显示关闭按钮
            shade: [0.3],//遮罩
            skin: 'demo_class_color',//iframe皮肤
            shadeClose:Boolean,//点击遮罩关闭
            area: ['800px', '460px'],
            // offset: 'rb', //右下角弹出
            // time: 2000, //2秒后自动关闭
            anim: 5,//动画
            content: ['caigouxq.html', 'no'], //iframe的url，no代表不显示滚动条 
        }); 
        
    }
 
</script> 