<%@ page contentType="text/html;charset=UTF-8"  pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>传智网上商城</title>
<link href="./css/common.css" rel="stylesheet" type="text/css"/>
<link href="./css/product.css" rel="stylesheet" type="text/css"/>

</head>
<body>
<div class="container header">
	<div class="span5">
		<div class="logo">
			<a href="http://localhost:8080/mango/">
				<img src="./image/nyist.png" alt="传智播客">
			</a>
		</div>
	</div>
	<div class="span9">
<div class="headerAd">
					<img src="./image/header.jpg" width="320" height="50" alt="正品保障" title="正品保障">
</div>	</div>
	<div class="span10 last">
		<div class="topNav clearfix">
			<ul>
				<li id="headerLogin" class="headerLogin" style="display: list-item;">
					<a href="login.jsp">登录</a>|
				</li>
				<li id="headerRegister" class="headerRegister" style="display: list-item;">
					<a href="reg.jsp">注册</a>|
				</li>
				<li id="headerUsername" class="headerUsername"></li>
				<li id="headerLogout" class="headerLogout">
					<a href="./index.htm">[退出]</a>|
				</li>
						<li>
							<a >会员中心</a>
							|
						</li>
						<li>
							<a >购物指南</a>
							|
						</li>
						<li>
							<a >关于我们</a>
							
						</li>
			</ul>
		</div>
		<div class="cart">
			<a href="cart.jsp">购物车</a>
		</div>
			<div class="phone">
				客服热线:
				<strong>18237171261</strong>
			</div>
	</div>
	<div class="span24">
		<ul class="mainNav">
					<li>
						<a href="./index.htm">首页</a>
						|
					</li>
					<li>
						<a href="./product-category.jsp">定制套餐</a>
						|
					</li>
					<li>
						<a >安全频道</a>
						|
					</li>
					<li>
						<a >限时抢购</a>
						|
					</li>
					<li>
						<a>名牌大牌</a>
						|
					</li>
					<li>
						<a >便民服务</a>
						|
					</li>
		</ul>
	</div>
	
</div>	
<div class="container productList">
		<div class="span6">
			<div class="hotProductCategory">
						<dl>
							<dt>
								<a href="./image/蔬菜 - Powered By Mango Team.htm">男装</a>
							</dt>
									<dd>
										<a >精选上装</a>
									</dd>
									<dd>
										<a >优质下装</a>
									</dd>
									<dd>
										<a >流行趋势</a>
									</dd>
									<dd>
										<a >精选大牌</a>
									</dd>
						</dl>
						<dl>
							<dt>
								<a>女装</a>
							</dt>
									<dd>
										<a >当季热卖</a>
									</dd>
									<dd>
										<a >女士上装</a>
									</dd>
                                    <dd>
                                        <a >优质下装</a>
                                    </dd>
                                    <dd>
                                        <a >精品热卖</a>
                                    </dd>
                        </dl>
						<dl>
							<dt>
								<a >男鞋</a>
							</dt>
									<dd>
										<a >精品男鞋</a>
									</dd>
									<dd>
										<a >热卖推荐</a>
									</dd>
									<dd>
										<a >推荐品牌</a>
									</dd>
									<dd>
										<a >春冬上新</a>
									</dd>
						</dl>
						<dl>
							<dt>
								<a >女鞋</a>
							</dt>
									<dd>
										<a >热门推荐</a>
									</dd>
									<dd>
										<a >个性推荐</a>
									</dd>
									<dd>
										<a >大牌推荐</a>
									</dd>
						</dl>
						<dl>
							<dt>
								<a >内衣</a>
							</dt>
									<dd>
										<a >睡衣家居服</a>
									</dd>
									<dd>
										<a >运动背心</a>
									</dd>
									<dd>
										<a >热门推荐</a>
									</dd>
						</dl>
						<dl>
							<dt>
								<a >钟表</a>
							</dt>
									<dd>
										<a >瑞士名表</a>
									</dd>
									<dd>
										<a >大牌国表</a>
									</dd>
									<dd>
										<a >时尚潮表</a>
									</dd>
									<dd>
										<a >热门推荐</a>
									</dd>
						</dl>
						<dl>
							<dt>
								<a >珠宝</a>
							</dt>
							        <dd>
										<a >流行饰品</a>
									</dd>
									<dd>
										<a >黄金珠宝</a>
									</dd>
									<dd>
										<a >礼品乐器</a>
									</dd>
									<dd>
										<a >推荐品牌</a>
									</dd>
						</dl>
						<dl>
							<dt>
								<a >箱包</a>
							</dt>
									<dd>
										<a >男包</a>
									</dd>
									<dd>
										<a >女包</a>
									</dd>
                                    <dd>
                                        <a >拉杆箱</a>
                                    </dd>
						</dl>
						<dl>
							<dt>
								<a >运动装</a>
							</dt>
									<dd>
										<a >运动鞋</a>
									</dd>
									<dd>
										<a >运动服</a>
									</dd>
									<dd>
										<a>户外运动</a>
									</dd>
									<dd>
										<a >运动大牌</a>
									</dd>
						</dl>
						<dl class="last">
							<dt>
								<a >商城卡</a>
							</dt>
									<dd>
										<a >商城卡</a>
									</dd>
						</dl>
			</div>
		</div>
		<div class="span18 last">
			
			<form id="productForm" action="./image/蔬菜 - Powered By Mango Team.htm" method="get">
				<input type="hidden" id="brandId" name="brandId" value="">
				<input type="hidden" id="promotionId" name="promotionId" value="">
				<input type="hidden" id="orderType" name="orderType" value="">
				<input type="hidden" id="pageNumber" name="pageNumber" value="1">
				<input type="hidden" id="pageSize" name="pageSize" value="20">
					
				<div id="result" class="result table clearfix">
						<ul>
						<li>
										<a href="./product-detail.jsp?id=1">
											<img src="./image/m1cover.png" width="170" height="170"  style="display: inline-block;">
											   
											<span style='color:green'>
											 上装男毛衫
											</span>
											 
											<span class="price">
												商城价： ￥478
											</span>
											 
										</a>
									</li>
									<li>
										<a href="./product-detail.jsp?id=2">
											<img src="./image/m2cover.png" width="170" height="170" " style="display: inline-block;">
											<span style='color:green'>
											   男 格子衫
											</span>
											<span class="price">
												商城价： ￥129
											</span>
											 
										</a>
									</li>
									<li>
										<a >
											<img src="./image/m3.png" width="170" height="170"   style="display: inline-block;">
											<span style='color:green'>
											   男 卫衣 校园
											</span>
											<span class="price">
												商城价： ￥233
											</span>
											 
										</a>
									</li>
									<li>
										<a >
											<img src="./image/m4.png" width="170" height="170"   style="display: inline-block;">
											<span style='color:green'>
											   夹克男 青春
											</span>
											<span class="price">
												商城价： ￥158
											</span>
											 
										</a>
									</li>
									<li>
										<a >
											<img src="./image/w4.png" width="170" height="170"  style="display: inline-block;">
											<span style='color:green'>
											   女 连衣裙 夏季
											</span>
											<span class="price">
												商城价： ￥218
											</span>
											 
										</a>
									</li>
									<li>
										<a href="./product-detail.jsp?id=3">
											<img src="./image/w1cover.png" width="170" height="170"  style="display: inline-block;">
											<span style='color:green'>
											   女装 风衣 纯色
											</span>
											<span class="price">
												商城价： ￥698
											</span>
											 
										</a>
									</li>
									<li>
										<a href="./product-detail.jsp?id=4">
											<img src="./image/w2cover.png" width="170" height="170"  style="display: inline-block;">
											<span style='color:green'>
											  女运动装
											</span>
											<span class="price">
												商城价： ￥199
											</span>
											 
										</a>
									</li>
									
									<li>
										<a >
											<img src="./image/w5.jpg" width="170" height="170"  style="display: inline-block;">
											<span style='color:green'>
											   女鞋
											</span>
											<span class="price">
												商城价： ￥348
											</span>
											 
										</a>
									</li>
									<li class="last">
										<a >
											<img src="./image/d1.png" width="170" height="170" >
											<span style='color:green'>
											   黄金天鹅手链
											</span>
											<span class="price">
												商城价： ￥2228
											</span>
											  
										</a>
									</li>
									<li class="last">
										<a >
											<img src="./image/d2.png" width="170" height="170" >
											<span style='color:green'>
											   栀子花胸针女配饰
											</span>
											<span class="price">
												商城价： ￥348
											</span>
											 
										</a>
									</li>
									<li class="last">
										<a >
											<img src="./image/d3.png" width="170" height="170" >
											<span style='color:green'>
											   18k金猪 耳饰品
											</span>
											<span class="price">
												商城价： ￥1375
											</span>
											 
										</a>
									</li>
									<li class="last">
										<a >
											<img src="./image/d4.png" width="170" height="170" >
											<span style='color:green'>
											  潘多拉星星手链
											</span>
											<span class="price">
												商城价： ￥1358
											</span>
											 
										</a>
									</li>
						</ul>
				</div>
	<div class="pagination">
			<span class="firstPage">&nbsp;</span>
			<span class="previousPage">&nbsp;</span>
				<span class="currentPage">1</span>
				<a href="javascript: $.pageSkip(2);">2</a>
			<a class="nextPage" href="javascript: $.pageSkip(2);">&nbsp;</a>
			
			<a class="lastPage" href="javascript: $.pageSkip(2);">&nbsp;</a>
	</div>
			</form>
		</div>
	</div>
<div class="container footer">
	<div class="span24">
		<div class="footerAd">
					<img src="./image/footer.jpg" width="950" height="52" alt="我们的优势" title="我们的优势">
</div>	</div>
	<div class="span24">
		<ul class="bottomNav">
					<li>
						<a >关于我们</a>
						|
					</li>
					<li>
						<a>联系我们</a>
						|
					</li>
					<li>
						<a >诚聘英才</a>
						|
					</li>
					<li>
						<a >法律声明</a>
						|
					</li>
					<li>
						<a>友情链接</a>
						|
					</li>
					<li>
						<a target="_blank">支付方式</a>
						|
					</li>
					<li>
						<a  target="_blank">配送方式</a>
						|
					</li>
					<li>
						<a >官网</a>
						|
					</li>
					<li>
						<a >论坛</a>
						
					</li>
		</ul>
	</div>
	<div class="span24">
		<div class="copyright">Copyright©2005-2015 网上商城 版权所有</div>
	</div>
</div>
</body></html>