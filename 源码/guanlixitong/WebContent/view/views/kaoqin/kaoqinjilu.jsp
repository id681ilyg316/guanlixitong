<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>

<head>
<meta charset="UTF-8">
<title></title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/view/layuiadmin/css/font.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/view/layuiadmin/css/xadmin.css">
<script type="text/javascript"
	src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/view/layuiadmin/lib/layui/layui.js"
	charset="utf-8"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/view/layuiadmin/js/xadmin.js"></script>
<!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
<!--[if lt IE 9]>
      <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
      <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>
	<div class="layui-card">

		<div class="x-nav">
			<span class="layui-breadcrumb"> <a href="">首页</a> <a href="">考勤</a>
				<a> <cite>考勤记录</cite></a>
			</span>
		</div>
		<div class="x-body">
			<xblock>
			<button class="layui-btn layui-btn-danger" onclick="delAll()">
				<i class="layui-icon"></i>批量删除
			</button>
			<button class="layui-btn"
				onclick="x_admin_show('添加考勤记录','${pageContext.request.contextPath}/view/views/kaoqin/kaoqinjilu-add.jsp')">
				<i class="layui-icon"></i>添加
			</button>
			<span class="x-right" style="line-height: 40px">共有数据：${count }
				条</span> </xblock>
			<table class="layui-table">
				<thead>
					<tr>
						<th>
							<div class="layui-unselect header layui-form-checkbox"
								lay-skin="primary">
								<i class="layui-icon">&#xe605;</i>
							</div>
						</th>
						<th>编号</th>
						<th>考勤时间</th>
						<th>类别</th>
						<th>员工信息</th>
						<th>考勤时段</th>
						<th>说明</th>
						<th>记录人</th>
						<th>操作</th>
				</thead>
				<tbody>
					<c:forEach items="${pageBean.kaoqinjiluList}" var="kaoqinjilu">
						<tr>
							<td>
								<div class="layui-unselect layui-form-checkbox"
									lay-skin="primary">
									<i class="layui-icon">&#xe605;</i>
								</div>
							</td>
							<td>${kaoqinjilu.id}</td>
							<td>${kaoqinjilu.kaoqinshijian}</td>
							<td>${kaoqinjilu.leibie}</td>
							<td>${kaoqinjilu.staff_name}</td>
							<td>${kaoqinjilu.kaoqinshiduan}</td>
							<td>${kaoqinjilu.shuoming}</td>
							<td>${kaoqinjilu.jiluren}</td>

							<td class="td-manage"><a title="编辑"
								onclick="x_admin_show('编辑','${pageContext.request.contextPath}/view/views/kaoqin/kaoqinjilu-edit.jsp?id=${kaoqinjilu.id}&kaoqinshijian=${kaoqinjilu.kaoqinshijian}&leibie=${kaoqinjilu.leibie}&staff_name=${kaoqinjilu.staff_name}&kaoqinshiduan=${kaoqinjilu.kaoqinshiduan}&shuoming=${kaoqinjilu.shuoming}&jiluren=${kaoqinjilu.jiluren}')"
								href="javascript:void(0);"> <i class="layui-icon">&#xe642;</i>
							</a> <a title="删除" onclick="member_del('${kaoqinjilu.id}')"
								href="javascript:void(0);"> <i class="layui-icon">&#xe640;</i>
							</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class="page">
				<div>
					<c:if test="${pageBean.currentPage==1 }">
						<a class="layui-btn-disabled">&lt;&lt;</a>
					</c:if>
					<c:if test="${pageBean.currentPage!=1 }">
						<a class="prev"
							href="${pageContext.request.contextPath }/KaoqinjiluList?currentPage=${pageBean.currentPage-1 }">&lt;&lt;</a>
					</c:if>
					<c:forEach begin="1" end="${pageBean.totalPage }" var="page">
						<c:if test="${pageBean.currentPage==page }">
							<span class="current" href="javascript:void(0);">${page }</span>
						</c:if>
						<c:if test="${pageBean.currentPage!=page }">
							<a class="num"
								href="${pageContext.request.contextPath }/KaoqinjiluList?currentPage=${page }">${page }</a>
						</c:if>
					</c:forEach>
					<c:if test="${pageBean.currentPage==pageBean.totalPage}">
						<a class="layui-btn-disabled">&gt;&gt;</a>
					</c:if>
					<c:if test="${pageBean.currentPage!=pageBean.totalPage }">
						<a class="next"
							href="${pageContext.request.contextPath }/KaoqinjiluList?currentPage=${pageBean.currentPage+1 }">&gt;&gt;</a>
					</c:if>
				</div>
			</div>
		</div>

	</div>
	<script>
		layui.use('laydate', function() {
			var laydate = layui.laydate;

			//执行一个laydate实例
			laydate.render({
				elem : '#start' //指定元素
			});

			//执行一个laydate实例
			laydate.render({
				elem : '#end' //指定元素
			});
		});

		/*用户-停用*/
		function member_stop(obj, id) {
			layer.confirm('确认要停用吗？', function(index) {

				if ($(obj).attr('title') == '启用') {

					//发异步把用户状态进行更改
					$(obj).attr('title', '停用')
					$(obj).find('i').html('&#xe62f;');

					$(obj).parents("tr").find(".td-status").find('span')
							.addClass('layui-btn-disabled').html('已停用');
					layer.msg('已停用!', {
						icon : 5,
						time : 1000
					});

				} else {
					$(obj).attr('title', '启用')
					$(obj).find('i').html('&#xe601;');

					$(obj).parents("tr").find(".td-status").find('span')
							.removeClass('layui-btn-disabled').html('已启用');
					layer.msg('已启用!', {
						icon : 5,
						time : 1000
					});
				}

			});
		}

		/*用户-删除*/
		function member_del(id) {
			layer
					.confirm(
							'确认要删除吗？',
							function(index) {
								//发异步删除数据          
								layer.msg('已删除!', {
									icon : 1,
									time : 1000
								});
								setTimeout(
										function() {
											location.href = "${pageContext.request.contextPath}/KaoqinjiluDel?id="
													+ id;
										}, 1000);
							});
		}

		function delAll(argument) {

			var data = tableCheck.getData();

			layer.confirm('确认要删除吗？' + data, function(index) {
				//捉到所有被选中的，发异步进行删除
				layer.msg('删除成功', {
					icon : 1
				});
				$(".layui-form-checked").not('.header').parents('tr').remove();
			});
		}
	</script>

</body>

</html>