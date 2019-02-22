<%--
  Created by IntelliJ IDEA.
  User: WCY
  Date: 2018/11/29
  Time: 13:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="pojo.Movie" %>
<%@ page import="java.util.List" %>
<%@ page import="service.MovieService" %>
<%
    String value = request.getParameter("value");
    List<Movie> movieList = MovieService.getHottestMovies();
    switch (value){
        case "classics":
            movieList = MovieService.getAllTypicalMovies();
            break;
        case "popular":
            movieList = MovieService.getHottestMovies();
            break;
        case "comedy":
        case "love":
        case "action":
        case "disaster":
        case "historical":
        case "record":
        case "horror":
            movieList = MovieService.getMoviesWithType(value);
            break;
        case "oscar":
        case "horse":
        case "palm":
            movieList = MovieService.getMoviesWithPrize(value);
            break;
        case "missing":
        case "loneliness":
        case "relaxation":
        case "pain":
        case "quietness":
            movieList = MovieService.getMoviesWithMood(value);
            break;
    }
    if(movieList.isEmpty()){
        movieList = MovieService.getAllMovies();
    }
%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>详情页面 </title>
    <script type="text/javascript" src="../js/jquery-1.4.2.min.js"></script>
    <link rel="stylesheet" href="../css/style.css" media="screen" type="text/css"/>

    <script>
        //弹出隐藏层
        function ShowDiv(show_div) {
            document.getElementById(show_div).style.display = 'block';
            document.getElementById(show_div).style.top = window.scrollY + 'px';
            $("#vines").fadeOut("slow");
        };

        //关闭弹出层
        function CloseDiv(show_div) {
            document.getElementById(show_div).style.display = 'none';
            $("#vines").fadeIn("normal",document.getElementById('vines').style.display = '-webkit-box');
        };

        function myFunction(x) {
            document.getElementById("front"+x).style.transform = "rotateY(-165deg) translateZ(0)";
            document.getElementById("front"+x).style.zIndex = "0";
            document.getElementById("li1"+x).style.transform = "rotateY(-20deg)";
            document.getElementById("li2"+x).style.transform = "rotateY(-25deg) ";
            document.getElementById("li3"+x).style.transform = "rotateY(-150deg) ";
            document.getElementById("li4"+x).style.transform = "rotateY(-155deg)";
            document.getElementById("li5"+x).style.transform = "rotateY(-160deg) ";

            document.getElementById("li1"+x).style.transitionDuration = "1.5s";
            document.getElementById("li2"+x).style.transitionDuration = "1.8s";
            document.getElementById("li3"+x).style.transitionDuration = "1.6s";
            document.getElementById("li4"+x).style.transitionDuration = "1.4s";
            document.getElementById("li5"+x).style.transitionDuration = "1.2s";
        }
    </script>


</head>

<body onload="show()">
<script type="text/javascript" color="5,204,158" opacity='1' zIndex="-2" count="99" src="../js/canvas-nest.min.js"></script>
<div id="vines" style="display: -webkit-box;height: 700px;">
    <%
        for(int i=0;i<30;i++){
    %>
    <div class="vine">
     <img class="vine-vine" src="../resources/img/vine.png" >\n" +
              <img class="movie" src="../resources/img/poster/<%=movieList.get(i).getMovieImg()%>1.jpg" style="height: 10%" onclick="ShowDiv('bookdiv<%=i%>')">
    </div>
    <%}%>
</div>
<%
    int i=0;
    for(;i<30;i++){
%>

<div class="component" id="bookdiv<%=i%>">
    <ul class="align">
        <li>
            <figure class='book'>

                <!-- Front -->

                <ul class='hardcover_front' id='front<%=i%>' onclick="myFunction(<%=i%>)">
                    <li>
                        <div id="img1<%=i%>"><img src="../resources/img/poster/<%=movieList.get(i).getMovieImg()%>1.jpg" style=" position: absolute;height: 100%;width: 100%;" /></div>
                    </li>
                    <li></li>
                </ul>

                <!-- Pages -->

                <ul class='page'>
                    <li id='li1<%=i%>'></li>
                    <li id='li2<%=i%>'>
                        <div id="intro">
                            <div id="close-button" onclick="CloseDiv('bookdiv<%=i%>')" style="float:right;margin-top:0;">X</div>
                            <input id="name<%=i%>" class="txt" readonly="readonly" value="<%=movieList.get(i).getMovieName()%>">
                            <input id="date<%=i%>" class="txt" readonly="readonly" value="<%=movieList.get(i).getReleaseDate()%>">
                            <input id="actor<%=i%>" class="txt" readonly="readonly" value="<%=movieList.get(i).getLeadActor()%>">
                            <input id="award<%=i%>" class="txt" readonly="readonly" value="<%=movieList.get(i).getMoviePrize()%>">
                            <input id="type<%=i%>" class="txt" readonly="readonly" value="<%=movieList.get(i).getMovieType()%>">
                            <input id="mood<%=i%>" class="txt" readonly="readonly" value="<%=movieList.get(i).getMovieMood()%>">
                            <textarea id="introdction<%=i%>" class="txt" clos="25" rows="6" readonly="readonly"><%=movieList.get(i).getMovieIntro()%></textarea>
                        </div>
                    </li>
                    <li id='li3<%=i%>'>
                        <div id="img2<%=i%>"><img src="../resources/img/poster/<%=movieList.get(i).getMovieImg()%>2.jpg" style=" position: absolute;height: 100%;width: 100%;" /></div>
                    </li>
                    <li id='li4<%=i%>'></li>
                    <li id='li5<%=i%>'></li>
                </ul>

                <!-- Back -->

                <ul class='hardcover_back'>
                    <li></li>
                    <li></li>
                </ul>

                <ul class='book_spine'>
                    <li></li>
                    <li></li>
                </ul>

            </figure>
        </li>
    </ul>
</div>
<%}%>
<div style="text-align:center;clear:both">
    <script src="../js/gg_bd_ad_720x90.js" type="text/javascript"></script>
    <script src="../js/follow.js" type="text/javascript"></script>
</div>
</body>
<style>
    body{
        /*height: 667px;*/
        /*width: 1024px;*/
        /*position: fixed;*/
        /*!*加载背景图*!*/
        background-image:url(../resources/img/true.png);
        /* 背景图垂直、水平均居中 */
        background-position: center 120%;
        /* 背景图不平铺 */
        background-repeat: repeat-x;

        /* 当内容高度大于图片高度时，背景图像的位置相对于viewport固定 */
        /*background-attachment: fixed;*/
        /*//此条属性必须设置否则可能无效/*/
        /* 让背景图基于容器大小伸缩 */
        /*background-size: cover;*/
        /* 设置背景颜色，背景图加载过程中会显示背景色 */
        background-color: #ffffff;
    }
	<%for(int j=0;j<30;j++){%>
	#bookdiv<%=j%>{
	display: none;
	/*position:block;*/
	top:0px;
	left:25%;
	z-index:10000;
}
    <%}%>
    .vine {
        top: -10%;
        position: relative;
        width: 20%;
        height: 85%;

        overflow: hidden;
    }
    .vine .vine-vine
    {
        position: absolute;
        z-index: 20;
        width: 100%;
        height:0%;
        transition: width 2s;
        transition: height 2s;
        -moz-transition: width 2s;
        -moz-transition: heigth 2s;
        /* Firefox 4 */
        -webkit-transition: width 2s;
        -webkit-transition: height 2s;
        /* Safari and Chrome */
        -o-transition: width 2s;
        -o-transition: height 2s;
        transition: all 1.6s;
    }
    .vine .movie
    {
        position: absolute;
        z-index: 20;
        top:50%;
        left: 50%;
        /*transition: top 2s;*/
        /*-moz-transition: top 2s;*/
        /*!* Firefox 4 *!*/
        /*-webkit-transition: top 2s;*/
        /*!* Safari and Chrome *!*/
        /*-o-transition: top 2s;*/
        cursor: pointer;
        transition: all 2s;

    }

    .vine .movie :hover {
        transform: scale(1.5); /* 鼠标放到图片上的时候图片按比例放大1.5倍   */
    }

    .line {
        width: 0.2%;
        height: 0%;
        position: absolute;
        top: 0%;
        background-color: rgb(109, 226, 134);
        transition: width 2s;
        transition: height 2s;
        -moz-transition: width 2s;
        -moz-transition: heigth 2s;
        /* Firefox 4 */
        -webkit-transition: width 2s;
        -webkit-transition: height 2s;
        /* Safari and Chrome */
        -o-transition: width 2s;
        -o-transition: height 2s;
        /* Opera */
    }
</style>

<script type="text/javascript">
    var theAmountsOfFilms = 30;
    $(function () {
        $("#show").html(oneValues());
    });


    //接收一个值
    function oneValues() {
        var result;
        var url = window.location.search; //获取url中"?"符后的字串
        if (url.indexOf("?") != -1) {
            result = url.substr(url.indexOf("=") + 1);
        }
        return result;
    }


    //接收多值
    function manyValues() {
        var url = window.location.search;
        if (url.indexOf("?") != -1) {
            var str = url.substr(1);
            strs = str.split("&");
            var key = new Array(strs.length);
            var value = new Array(strs.length);
            for (i = 0; i < strs.length; i++) {
                key[i] = strs[i].split("=")[0]
                value[i] = unescape(strs[i].split("=")[1]);
                alert(key[i] + "=" + value[i]);
            }
        }
    }

    function show(){
        for(var j = 0; j<theAmountsOfFilms; j++)
        {
            var today = new Date();
            var seed = today.getTime();
            var random = Math.ceil(Math.random()*40+40);
            document.getElementsByClassName("vine")[j].getElementsByTagName("img")[0].style.height = random+"%";
            document.getElementsByClassName("vine")[j].getElementsByTagName("img")[1].style.top = random-6+"%";
            // $("#vines .vine img:eq(3"+j+")").css("height",Math.ceil(Math.random()*100)+"%");
        }
    }

</script>

</html>
