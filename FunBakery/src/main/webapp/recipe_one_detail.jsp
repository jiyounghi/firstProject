<%@page import="java.util.Enumeration"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.VO.BakeryVO" %>
<%@page import="com.DAO.BakeryDAO" %>
<%@page import="com.Bakery.BakeryCon" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en-US" dir="ltr">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!--  
    Document Title
    =============================================
    -->
    <title>Fun Bakery</title>
    <!--  
    Favicons
    =============================================
    -->
    <link rel="apple-touch-icon" sizes="57x57" href="assets/images/favicons/apple-icon-57x57.png">
    <link rel="apple-touch-icon" sizes="60x60" href="assets/images/favicons/apple-icon-60x60.png">
    <link rel="apple-touch-icon" sizes="72x72" href="assets/images/favicons/apple-icon-72x72.png">
    <link rel="apple-touch-icon" sizes="76x76" href="assets/images/favicons/apple-icon-76x76.png">
    <link rel="apple-touch-icon" sizes="114x114" href="assets/images/favicons/apple-icon-114x114.png">
    <link rel="apple-touch-icon" sizes="120x120" href="assets/images/favicons/apple-icon-120x120.png">
    <link rel="apple-touch-icon" sizes="144x144" href="assets/images/favicons/apple-icon-144x144.png">
    <link rel="apple-touch-icon" sizes="152x152" href="assets/images/favicons/apple-icon-152x152.png">
    <link rel="apple-touch-icon" sizes="180x180" href="assets/images/favicons/apple-icon-180x180.png">
    <link rel="icon" type="image/png" sizes="192x192" href="assets/images/favicons/android-icon-192x192.png">
    <link rel="icon" type="image/png" sizes="32x32" href="assets/images/favicons/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="96x96" href="assets/images/favicons/favicon-96x96.png">
    <link rel="icon" type="image/png" sizes="16x16" href="assets/images/favicons/favicon-16x16.png">
    <link rel="manifest" href="/manifest.json">
    <meta name="msapplication-TileColor" content="#ffffff">
    <meta name="msapplication-TileImage" content="assets/images/favicons/ms-icon-144x144.png">
    <meta name="theme-color" content="#ffffff">
    <!--  
    Stylesheets
    =============================================
    
    -->
    <!-- Default stylesheets-->
    <link href="assets/lib/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Template specific stylesheets-->
    <link href="https://fonts.googleapis.com/css?family=Roboto+Condensed:400,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Volkhov:400i" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800" rel="stylesheet">
    <link href="assets/lib/animate.css/animate.css" rel="stylesheet">
    <link href="assets/lib/components-font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="assets/lib/et-line-font/et-line-font.css" rel="stylesheet">
    <link href="assets/lib/flexslider/flexslider.css" rel="stylesheet">
    <link href="assets/lib/owl.carousel/dist/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="assets/lib/owl.carousel/dist/assets/owl.theme.default.min.css" rel="stylesheet">
    <link href="assets/lib/magnific-popup/dist/magnific-popup.css" rel="stylesheet">
    <link href="assets/lib/simple-text-rotator/simpletextrotator.css" rel="stylesheet">
    <!-- Main stylesheet and color file-->
    <link href="assets/css/style.css" rel="stylesheet">
    <link id="color-scheme" href="assets/css/colors/default.css" rel="stylesheet">

  </head>
  <body data-spy="scroll" data-target=".onpage-navigation" data-offset="60">
    <main>
      <div class="page-loader">
        <div class="loader">Loading...</div>
      </div>
      <nav class="navbar navbar-custom navbar-fixed-top" role="navigation">
      <%@ include file="header.jsp" %>
      </nav>
      <div class="main">
        <section class="module">
        <% 
        BakeryVO breadInfo = (BakeryVO)request.getAttribute("breadInfo"); 
        %>
          <div class="container">
            <div class="row">
              <div class="col-sm-6 mb-sm-40">
                  <%out.print("<img style='width: 500px; height: 500px;' src=" + breadInfo.getB_img() +" alt='Bread image'>");%>
              </div>
              <div class="col-sm-6" id="breadinfo">
                <div class="row" id="breadname-col" style="margin-bottom: 40px">
                  <div class="col-sm-12">
                    <h1 class="product-title" id="breadname"><%=breadInfo.getB_name() %></h1>
                  </div>
                </div>
                <div class="row mb-20" id="breaddesc-col">
                  <div class="col-sm-12">
                    <div class="description" id="breaddesc">
                      <%=breadInfo.getB_desc() %>
                    </div>
                  </div>
                </div>
                
              </div>
            </div>
            <div class="row mt-70">
              <div class="col-sm-12">
                <ul class="nav nav-tabs font-alt" role="tablist">
                  
                  <li class="active"><a id="taste1" href="#description" data-toggle="tab">?????????</a></li>
                  
                  <div class="best_tit_rmn">
                      <button id="btnMeasureModal" type="button" class="btn btn-default" onclick="modalOn()" style="float:right; margin:0 15px 5px 0;">????????? ??????</button>
                  </div>
    <div id="modal" class="modal-overlay">
        <div class="modal-dialog">      
            <div class="modal-content md" style="padding:0;">
                <div class="modal-header md" text-align="center">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="modalOff()"><span aria-hidden="true"><img src="https://recipe1.ezmember.co.kr/img/btn_close.gif" alt="??????" width="18px" height="18px"></span></button>
                    <h4 class="modal-title md"><b>????????? ??????</b></h4>
                </div>
                <div class="modal-body md">
                    <table class="weighing_modal md">
                        <tbody>
                            <tr>
                                <th>1??????(1T, 1Ts)<br>= 1?????????</th>
                                <td>15ml = 3t<br>(??????????????? ?????? ?????? ?????????????????? ???????????? ?????? ????????? 1??????)</td>
                            </tr>
                            <tr>
                                <th>1?????????(1t, 1ts)</th>
                                <td>5ml<br>(?????????????????? 2????????? 1?????????)</td>
                            </tr>
                            <tr>
                                <th>1???(1Cup, 1C)</th>
                                <td>200ml = 16T(??????,??????,??????)<br>(?????? ??? ????????? ?????? 1C??? 240~250ml????????? ????????? ?????? ????????? ??????)</td>
                            </tr>
                            <tr>
                                <th>1?????????</th>
                                <td>180ml</td>
                            </tr>
                            <tr>
                                <th>1oz</th>
                                <td>28.3g</td>
                            </tr>
                            <tr>
                                <th>1?????????(lb)</th>
                                <td>??? 0.453 ????????????(kg)</td>
                            </tr>
                            <tr>
                                <th>1??????(gallon)</th>
                                <td>??? 3.78 ??????(???)</td>
                            </tr>
                            <tr>
                                <th>1??????</th>
                                <td>??? 2g ???????????? '??????'????????? ??????????????? ???</td>
                            </tr>
                            <tr>
                                <th>??????</th>
                                <td>????????? 2~3???</td>
                            </tr>
                            <tr>
                                <th>?????????</th>
                                <td>????????? ?????? ???????????? ???????????? ????????? ??????</td>
                            </tr>
                        </tbody>
                    </table>            
                </div>
                <div class="modal-footer md">
                </div>
            </div>
        </div>
    </div>
                </ul>
                <div class="tab-content">
                	<!-- ??????1 ?????? -->
                <%
                  // ?????? ???????????? ???????????? ???????????? ????????? ????????? js??? ?????????
                        ArrayList<ArrayList<BakeryVO>> taste1 = (ArrayList<ArrayList<BakeryVO>>)request.getAttribute("taste1");
                        int arr_len = taste1.get(1).size();
                        String ingrName_java[] = new String[arr_len];  //???????????? ?????? ??????
                        String ingrWeight_java[] = new String[arr_len]; //???????????? ?????? ?????? 
                        
                        //???????????? ???????????? ????????? ???????????? ?????????
                        for(int i=0; i<taste1.get(1).size(); i++) {
                           ingrName_java[i] = taste1.get(1).get(i).getIngr_name();
                           ingrWeight_java[i] = taste1.get(1).get(i).getIngr_weight();
                        }
                        
                        
                     %>   
                  <div class="tab-pane active" id="description">
                     <!--  ??????1??? ??????!  -->
                     
                     <div class="best_tit">
                     	
                          	<b id="r_index">??????</b>
                          	<!--  ?????? ?????? ????????? + ???????????????   -->
                          	<form class="form_ingr" id="ingr_cal">
                          		<b id="ingr_cal_tit">?????? ?????????</b>
			                    <select class="input_ingr_name" style="height: 25px;">
			                    	<option value='' selected>???????????? ??????????????????.</option>
			                    	<%
			                    		for (int i = 0; i < taste1.get(1).size(); i++) {
			                    			out.print("<option>" + taste1.get(1).get(i).getIngr_name() + "</option>");
			                    		}
			                    	%>
			                    </select>
			                    <input class="input_ingr_weight" type="number" name="weight" placeholder="???????????? ??????????????????." />
			                    <button class="btn btn-g btn-round" id="cal-button" type="submit">??????</button>
			                </form>
                          
                      </div>
                     
                
                     
                     <!-- <hr width='90%'> -->
                     <!--  ?????? ????????? ?????? -->
          

                     
                     <script src="assets/js/recipe_cal.js"></script>
                     
                     <!-- toHtml() ????????? ????????? ??? -->
                     <ul class='ingre_one' id='one_type'></ul>
                     
                     <script>
                        // jsp ????????? ????????? ????????? ?????????????????? ????????? ????????? 
                        let ingrName = new Array();
                        <% for(int i=0; i<arr_len; i++) {%>
                           ingrName.push('<%=ingrName_java[i]%>');
                        <%}%>
                           

                        let ingrWeight = new Array();
                        <% for(int i=0; i<arr_len; i++) {%>
                           ingrWeight.push('<%=ingrWeight_java[i] %>');    
                        <%}%>
                        
                        // ???????????? ???????????? ?????? ???????????? ?????? (key-ingrName, value-ingrWeight)
                        let ingrTable = {};
                        for(var j=0; j<(ingrName.length); j++) {
                           let key = ingrName[j];
                           ingrTable[key] = ingrWeight[j];
                        }
                        
                        console.log(ingrName, ingrWeight);
                        console.log(ingrTable);
                        
                        // ?????? ??????
                        recipeTable = new RecipeTable(ingrTable);
                        console.log(recipeTable);
                        
                        const form = document.querySelector(".form_ingr");
                        const nameInput = document.querySelector(".input_ingr_name");
                        const weightInput = document.querySelector(".input_ingr_weight");
                        

                           
                         
                          let table = document.getElementById('one_type');
                           const getInputValue = (/** @type { Event } */ event) => {
                               event.preventDefault();
                               event.stopPropagation();
                               let nameValue = nameInput.value;
                               let weightValue = weightInput.value;
                               recipeTable.update(nameValue, weightValue)
                               table.innerHTML = recipeTable.toHtml();
                           };
   
                           const init = () => {
                               form.addEventListener("submit", getInputValue);
                               table.innerHTML = recipeTable.toHtml();
                           };
   
                           init();
                        </script> 
                        
                      <hr class="divider-w pt-20">
                      
                      <!-- ????????? -->
                      <div class="view_step">
                      <div class="best_tit">
                          <b id="r_index">????????????</b>
                      </div>
                      <div>
                      <% for(int i=0; i<taste1.get(0).size(); i++) {%>
     
                          <div id="stepDiv" class="view_step_cont">
                              <div id="steporder" class="media-left"><%= i+1 %>
                              </div>
                              <div id="stepdescr" class="media-body"><%= taste1.get(0).get(i).getR_content()  %>
                              </div>
                              <div id="stepimg" class="media-right">
                                  <img width="200px" src="<%=taste1.get(0).get(i).getR_img() %>">
                              </div>
                              
                          </div>
                      <%} %>
                      
                      </div>

                      
                  	  </div></div>
  
                </div>
                </div>
              </div>
        	</section>
          </div>
        
        
      <%@ include file="footer.jsp" %>       
    </main>
    <!--  
    JavaScripts
    =============================================
    -->
    <script src="assets/lib/jquery/dist/jquery.js"></script>
    <script src="assets/lib/bootstrap/dist/js/bootstrap.min.js"></script>
    <script src="assets/lib/wow/dist/wow.js"></script>
    <script src="assets/lib/jquery.mb.ytplayer/dist/jquery.mb.YTPlayer.js"></script>
    <script src="assets/lib/isotope/dist/isotope.pkgd.js"></script>
    <script src="assets/lib/imagesloaded/imagesloaded.pkgd.js"></script>
    <script src="assets/lib/flexslider/jquery.flexslider.js"></script>
    <script src="assets/lib/owl.carousel/dist/owl.carousel.min.js"></script>
    <script src="assets/lib/smoothscroll.js"></script>
    <script src="assets/lib/magnific-popup/dist/jquery.magnific-popup.js"></script>
    <script src="assets/lib/simple-text-rotator/jquery.simple-text-rotator.min.js"></script>
    <script src="assets/js/plugins.js"></script>
    <script src="assets/js/main.js"></script>
    
    <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    <script>

        const modal = document.getElementById("modal")

        function modalOn() {
            modal.style.display = "block"
            $('tbody,tr,th,td').addClass('md');
        }

        function isModalOn() {
            return modal.style.display === "block"
        }

        function modalOff() {
            modal.style.display = "none"
        }

        modal.addEventListener("click", e => {
            const evTarget = e.target
            if(evTarget.classList.contains("modal-content")) {
                modalOff()
            }
        })

        window.addEventListener("keyup", e => {
            if(isModalOn() && e.key === "Escape") {
                modalOff()
            }
        })

        $('#modal').click(function(e){
          if(!$(e.target).hasClass('md')){
            $('#modal').hide();
          }
        });
        
    </script> 
  </body>
</html>