



		<!-- layui -->
		<script src="../../layui/layui.js"></script>
		<!-- vue -->
		<script src="../../js/vue.js"></script>
        <!-- 引入element组件库 -->
        <script src="../../xznstatic/js/element.min.js"></script>
        <!-- 引入element样式 -->
        <link rel="stylesheet" href="../../xznstatic/css/element.min.css">
		<!-- 组件配置信息 -->
		<script src="../../js/config.js"></script>
		<!-- 扩展插件配置信息 -->
		<script src="../../modules/config.js"></script>
		<!-- 工具方法 -->
		<script src="../../js/utils.js"></script>
		<!-- 校验格式工具类 -->
		<script src="../../js/validate.js"></script>

		<script>
			var vue = new Vue({
				el: '#app',
				data: {
					// 轮播图
					swiperList: [{
						img: '../../img/banner.jpg'
					}],
					dataList: [],
                    zhekou:1,
					// 当前用户信息
					user: {}
				},
				computed: {
					totalMoney: function() {
						var total = 0;
						for (var item of this.dataList) {
							total += item.kechengNewMoney * item.buyNumber
						}
						return total;
					}
				},
				methods: {
					jump(url) {
						jump(url)
					}
					// 正常下单，生成订单，减少余额，添加积分，减少库存，修改状态已支付
					,payClick() {
						let data={
                            kechengs:localStorage.getItem('kechengs'),
                            huiyuanId: localStorage.getItem('userid'),
						}
                        // 获取商品详情信息
                        layui.http.request(`kechengOrder/order`, 'POST', data, (res) => {
                            // 订单编号
                            var orderId = genTradeNo();
							if(res.code == 0){
                                alert("下单成功，点击确定后跳转 我的订单页面");
                                window.location.href='../kechengOrder/list.jsp';
							}
                       		 window.location.href='../kechengOrder/list.jsp';
					    });
					}
            	}
			});

			layui.use(['layer', 'element', 'carousel', 'http', 'jquery', 'form', 'upload'], function() {
				var layer = layui.layer;
				var element = layui.element;
				var carousel = layui.carousel;
				var http = layui.http;
				var jquery = layui.jquery;
				var form = layui.form;
				var upload = layui.upload;

				// 充值
				jquery('#btn-recharge').click(function(e) {
					layer.open({
						type: 2,
						title: '用户充值',
						area: ['900px', '600px'],
						content: '../recharge/recharge.jsp'
					});
				});

				// 获取轮播图 数据
				http.request('config/list', 'get', {
					page: 1,
					limit: 5
				}, function(res) {
					if (res.data.list.length > 0) {
						var swiperItemHtml = '';
						for (let item of res.data.list) {
							if (item.value && item.value != "" && item.value != null) {
								swiperItemHtml +=
									'<div>' +
									'<img class="swiper-item" src="' + item.value + '">' +
									'</div>';
							}
						}
						jquery('#swiper-item').html(swiperItemHtml);
						// 轮播图
						carousel.render({
							elem: '#swiper',
							width: swiper.width,height:swiper.height,
							arrow: swiper.arrow,
							anim: swiper.anim,
							interval: swiper.interval,
							indicator: "none"
						});
					}
				});

                // 获取课程购买的清单列表
				var kechengs = localStorage.getItem('kechengs');
				// 转换成json类型，localstorage保存的是string数据
				vue.dataList = JSON.parse(kechengs);

				// 用户当前用户信息
				let table = localStorage.getItem("userTable");
                if (!table) {
                    layer.msg('请先登录', {
                        time: 2000,
                        icon: 5
                    }, function () {
                        window.parent.location.href = '../login/login.jsp';
                    });
                }
				http.request(`huiyuan/session`, 'get', {}, function(data) {
					vue.user = data.data;
					// 用户当前用户折扣信息
					http.request('dictionary/page', 'get', {
						dicCode: "huiyuandengji_types",
						dicName: "会员等级类型",
                        codeIndexStart: vue.user.huiyuandengjiTypes,
                        codeIndexEnd: vue.user.huiyuandengjiTypes,
					}, function(res) {
					    if(res.data.list.length >0){
							vue.zhekou = res.data.list[0].beizhu;
                        }
					})
				});
			});
		</script>
	</body>
</html>
