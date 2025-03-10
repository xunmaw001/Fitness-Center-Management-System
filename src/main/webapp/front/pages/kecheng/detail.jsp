<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="true" %>

<!-- 首页 -->
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>首页</title>
    <link rel="stylesheet" href="../../layui/css/layui.css">
    <link rel="stylesheet" href="../../xznstatic/css/bootstrap.min.css" />
    <!-- 样式 -->
    <link rel="stylesheet" href="../../css/style.css"/>
    <!-- 主题（主要颜色设置） -->
    <link rel="stylesheet" href="../../css/theme.css"/>
    <!-- 通用的css -->
    <link rel="stylesheet" href="../../css/common.css"/>
</head>
<style>
    /*.data-detail .title {
        font-size:35px;
        line-height:100%;
        font-weight:700;
        color:#4b4b46;
        margin-top:-4px;
        margin-bottom:24px;
        border:none;
    }
    .data-detail .detail-item {
        font-size:16px;
        line-height:50px;
        color:#4b4b46;
        background:#f3f3f9;
        border:1px solid rgba(75,75,70,.07);
        border-radius:7px;
        padding:0 35px;
        margin-bottom:15px;
        width: auto;
    }
    div .detail-item span:nth-child(1) {
        font-size:18px;
        font-weight:700;
        width:40%
    }*/</style>
<body>

    <div id="app">
        <div class="data-detail">
            <div class="data-detail-breadcrumb">
                <span class="layui-breadcrumb">
                    <a href="../home/home.jsp">首页</a>
                    <a><cite>{{detail.kechengName}}</cite></a>
                </span>

                <!-- 收藏 -->
                <a v-if='storeupFlag' onclick="addKechengCollection()" href="javascript:void(0)">
                    <i class="layui-icon" style="font-size: 20px;color: red;">&#xe67a;</i>取消收藏
                </a>
                <a v-if='!storeupFlag' onclick="addKechengCollection()" href="javascript:void(0)">
                    <i class="layui-icon" style="font-size: 20px;color: red;">&#xe67b;</i>点我收藏
                </a>

            </div>
            <div class="layui-row">
                <div class="layui-col-md5">
                    <div class="layui-carousel" id="swiper">
                        <div carousel-item id="swiper-item">
                            <div v-for="(item,index) in swiperList" v-bind:key="index">
                                <img class="swiper-item" :src="item.img">
                            </div>
                        </div>
                    </div>

                    <div class="tool-container">
                            <!-- 判断是否有评分 -->
                    </div>
                </div>
                <div class="layui-col-md7" style="padding-left: 20px;">
                        <h1 class="title">{{detail.kechengName}}</h1>

                        <div v-if="detail.kechengUuidNumber" class="detail-item">
                            <span>课程编号：</span>
                            <span class="desc">
                                        {{detail.kechengUuidNumber}}
                            </span>
                        </div>

                        <div v-if="detail.kechengTypes" class="detail-item">
                            <span>课程类型：</span>
                            <span class="desc">
                                {{detail.kechengValue}}
                            </span>
                        </div>

                        <div v-if="detail.kechengKaishiTime" class="detail-item">
                            <span>课程开始时间：</span>
                            <span class="desc">
                                        {{detail.kechengKaishiTime}}
                            </span>
                        </div>

                        <div v-if="detail.kechengJieshuTime" class="detail-item">
                            <span>课程结束时间：</span>
                            <span class="desc">
                                        {{detail.kechengJieshuTime}}
                            </span>
                        </div>

                        <div v-if="detail.kechengNumber" class="detail-item">
                            <span>最大报名人数：</span>
                            <span class="desc">
                                {{detail.kechengNumber}}
                            </span>
                        </div>

                        <div v-if="detail.kechengOldMoney" class="detail-item">
                            <span>课程原价：</span>
                            <span class="desc">
                                        {{detail.kechengOldMoney}}
                            </span>
                        </div>

                        <div v-if="detail.kechengNewMoney" class="detail-item">
                            <span>课程现价：</span>
                            <span class="desc">
                                        {{detail.kechengNewMoney}}
                            </span>
                        </div>

                        <div v-if="detail.kechengClicknum" class="detail-item">
                            <span>课程热度：</span>
                            <span class="desc">
                                {{detail.kechengClicknum}}
                            </span>
                        </div>

                    <div class="detail-item">

                        <!--<button onclick="addKechengqqqqqqqq()" type="button" class="layui-btn layui-btn-warm">
                                添加到购物车
                            </button>-->
                            <%--<div class="num-picker">
                                <button type="button" onclick="reduceBuynumber()" class="layui-btn layui-btn-primary">
                                    -
                                </button>
                                <input type="text" id="buyNumber" name="buyNumber" class="layui-input" disabled="disabled" />
                                <button type="button" onclick="plusBuynumber()" class="layui-btn layui-btn-primary">
                                    +
                                </button>
                            </div>
                            <button onclick="addKechengOrder()" type="button" class="layui-btn btn-submit">
                                立即购买
                            </button>--%>
                            <div style="padding: 20px;border: 0px solid #f2f2f2;margin-top: 20px;display: flex">
                                <div class="num-picker">
                                    <button @click="kechengYuyue()" style="height:auto;" :style='{"padding":"0 10px","boxShadow":"0 0 0px rgba(255,0,0,.3)","margin":"0 5px","borderColor":"rgba(0,0,0,.3)","backgroundColor":"rgba(23, 124, 176, 1)","color":"rgba(255, 255, 255, 1)","borderRadius":"6px","borderWidth":"0","width":"auto","lineHeight":"40px","fontSize":"16px","borderStyle":"solid"}' type="button" class="layui-btn btn-submit">
                                        课程预约
                                    </button>
                                </div>
                            </div>
                    </div>

                    <div class="detail-item" style="text-align: right;">
                    </div>
                </div>
            </div>

            <div class="layui-row">
                <div class="layui-tab layui-tab-card">

                    <ul class="layui-tab-title">
                            <li class="layui-this">课程介绍</li>
                    </ul>

                    <div class="layui-tab-content">
                            <div class="layui-tab-item layui-show">
                                <div v-html="myFilters(detail.kechengContent)"></div>
                            </div>


                    </div>
                </div>
            </div>
        </div>    </div>

<script type="text/javascript" src="../../xznstatic/js/jquery.min.js"></script>
<script src="../../xznstatic/js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
<script src="../../layui/layui.js"></script>
<script src="../../js/vue.js"></script>
<!-- 组件配置信息 -->
<script src="../../js/config.js"></script>
<!-- 扩展插件配置信息 -->
<script src="../../modules/config.js"></script>
<!-- 工具方法 -->
<script src="../../js/utils.js"></script>

<script>
    Vue.prototype.myFilters= function (msg) {
        if(msg != null){
            return msg.replace(/\n/g, "<br>");
        }else{
            return "";
        }
    };
    var vue = new Vue({
        el: '#app',
        data: {
            // 轮播图
            swiperList: [],
            // 数据详情
            detail: {
                id: 0
            },
            // 商品标题
            title: '',

            storeupFlag: 0,//收藏 [0为收藏 1已收藏]
            //系统推荐
            kechengRecommendList: [],
            dataList: [],
            // 加入购物车数量
            buyNumber: 1,
            // 当前详情页表
            detailTable: 'kecheng',
        },
        //  清除定时器
        destroyed: function () {
            // 不知道具体作用
            // window.clearInterval(this.inter);
        },
        methods: {
            jump(url) {
                jump(url)
            }
            //预约
            ,kechengYuyue(){
                let _this = this;
                // localStorage.setItem('kechengId', _this.detail.id);
                // _this.jump("../kechengOrder/add.jsp");

                let data={
                    kechengId:_this.detail.id,
                    huiyuanId:localStorage.getItem("userid"),
                    kechengOrderYesnoTypes:1,
                }
                // 提交数据
                layui.http.requestJson('kechengOrder/add', 'post', data, function (res) {
                    if(res.code == 0) {
                        layui.layer.msg('预约成功', {
                            time: 2000,
                            icon: 6
                        }, function () {
                            _this.jump("../kechengOrder/list.jsp");
                        });
                    }else{
                        layui.layer.msg(res.msg, {
                            time: 5000,
                            icon: 5
                        });
                    }
                });
            },
        }
    });

    layui.use(['layer', 'form', 'element', 'carousel', 'http', 'jquery', 'laypage', 'rate'], function () {
        var layer = layui.layer;
        var element = layui.element;
        var form = layui.form;
        var carousel = layui.carousel;
        var http = layui.http;
        var jquery = layui.jquery;
        var laypage = layui.laypage;
        var rate = layui.rate;//评分

        var limit = 10;

        // 设置数量
        jquery('#buyNumber').val(vue.buyNumber);

        // 数据ID
        var id = http.getParam('id');
        vue.detail.id = id;
        // 当前详情
        http.request(`${vue.detailTable}/detail/` + id, 'get', {}, function (res) {
            // 详情信息
            vue.detail = res.data;
            vue.title = vue.detail.kechengName;
           // 轮播图片
            vue.swiperList = vue.detail.kechengPhoto ? vue.detail.kechengPhoto.split(",") : [];
            var swiperItemHtml = '';
            for (let item of vue.swiperList) {
                swiperItemHtml +=
                        '<div>' +
                        '<img class="swiper-item" src="' + item + '" style="margin-top: 50px;" >' +
                        '</div>';
            }
            jquery('#swiper-item').html(swiperItemHtml);
            // 轮播图
            carousel.render({
                elem: '#swiper',
                width: swiper.width, height: swiper.height,
                arrow: swiper.arrow,
                anim: swiper.anim,
                interval: swiper.interval,
                indicator: swiper.indicator
            });
        });

        // 系统推荐
        http.request(`kecheng/list`, 'get', {
            page: 1,
            limit: 5,
            kechengTypes: vue.detail.kechengTypes,
            kechengDelete: 1,





                shangxiaTypes: vue.detail.shangxiaTypes,

        }, function (res) {
            vue.kechengRecommendList = res.data.list;
        });


        if (localStorage.getItem('userid')) {
            http.request('kechengCollection/list', 'get', {
                page: 1,
                limit: 1,
                kechengId: vue.detail.id,
                huiyuanId: localStorage.getItem('userid'),
            }, function (res) {
                if(res.data.total >0){
                    res.data.list.forEach(element => {
                        if (element.kechengCollectionTypes == 1) {
                            vue.storeupFlag = 1;
                        }
                        if (element.kechengCollectionTypes == 2) {
                            vue.zanFlag = 1;
                        }
                        if (element.kechengCollectionTypes == 3) {
                            vue.caiFlag = 1;
                        }
                    });

                }
            });
        }

    });



    // 收藏
    function addKechengCollection(){
        layui.http.request('kechengCollection/list', 'get', {
            page: 1,
            limit: 1,
            kechengId: vue.detail.id,
            kechengCollectionTypes: 1,
            huiyuanId: localStorage.getItem('userid'),
        }, (res) => {
            if (res.data.list.length == 1) {
                layui.http.requestJson('kechengCollection/delete', 'post', [res.data.list[0].id], function (res) {
                    layui.layer.msg('取消成功', {
                        time: 1000,
                        icon: 5
                    }, function () {
                        window.location.reload();
                    });
                });
                return false;
            }
            layui.http.requestJson('kechengCollection/add', 'post', {
                huiyuanId: localStorage.getItem('userid'),
                kechengId: vue.detail.id,
                kechengCollectionTypes: 1,
            }, function (res) {
                layui.layer.msg('收藏成功', {
                    time: 1000,
                    icon: 6
                }, function () {
                    window.location.reload();
                });
            });
        });
    }

    // 添加数量
    function plusBuynumber() {
        vue.buyNumber++;
        layui.jquery('#buyNumber').val(vue.buyNumber);
    }
    // 减少数量
    function reduceBuynumber() {
        if(vue.buyNumber>1){
            vue.buyNumber--;
        }
        layui.jquery('#buyNumber').val(vue.buyNumber);
    }

    // 立即购买
    function addKechengOrder(){
        localStorage.setItem("kechengId",vue.detail.id);
        localStorage.setItem("buyNumber",vue.buyNumber);
        window.location.href='../kechengOrder/add.jsp';
    }



</script>
</body>
</html>
