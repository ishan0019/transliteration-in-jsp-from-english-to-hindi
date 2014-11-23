<%@ page language="java" import="java.io.*,java.util.*,java.sql.*"%>
<%@ page language="java" import="java.text.*" %>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

<!DOCTYPE html>
<html lang="en">

<script language="JAVASCRIPT">
function callchecker(obj1)
{ 

  //var obj1=document.getElementById("msg1");   
 if((obj1.value.indexOf("@") >=0)||(obj1.value.indexOf(".")>=0)||(obj1.value.indexOf("_")>=0)||(obj1.value.indexOf("*")>=0)||(obj1.value.indexOf("^")>=0)||(obj1.value.indexOf("&")>=0)||(obj1.value.indexOf("\\")>=0)||(obj1.value.indexOf("\"")>=0)||(obj1.value.indexOf("\/")>=0)||(obj1.value.indexOf("~")>=0)||(obj1.value.indexOf("|")>=0)||(obj1.value.indexOf("!")>=0)||(obj1.value.indexOf("#")>=0)||(obj1.value.indexOf('$')>=0)||(obj1.value.indexOf('(')>=0)||(obj1.value.indexOf(')')>=0)||(obj1.value.indexOf('}')>=0)||(obj1.value.indexOf('{')>=0)||(obj1.value.indexOf('[')>=0)||(obj1.value.indexOf(']')>=0)||(obj1.value.indexOf('+')>=0)||(obj1.value.indexOf('%')>=0)||(obj1.value.indexOf('<')>=0)||(obj1.value.indexOf('>')>=0))
         { 
               obj1.value=obj1.value.replace(/[%@.!)\\><_*#$&^}+|"~\/{(]/gi,"");
		      input.innerHTML=obj1.value;
			  
		 }
   
}
 
 function input(e) {

            // Get the TextBox object.

            var tbInput = document.getElementById("msg1");



            // As e is the button, its value is the text on it.

            // Add the value to the TextBox.

            tbInput.value = tbInput.value + e.value;
            
        }

        function h()
        {
        	window.alert("nnnn");
        }

        function del() {

            // Get the TextBox object.

            var tbInput = document.getElementById("msg1");



            // Remove the last char in the TextBox.

            tbInput.value = tbInput.value.substr(0, tbInput.value.length - 1);

        }

			
	$(document).ready(function(){
  $(togl).click(function(){
    $("#keyboard").fadeToggle(800);
  });
});	



</script>

<style >
#keyboard
{
display:none;
border:gray;
border-radius:20px;
background:black; 
border-collapse: collapse; 
z-index:100;
opacity:0.7;
width:310px;
padding:5px 20px 5px 20px;
}
</style>


<% 
//int i=0,j=0;
String [][]ar={
      {"&#2325;","&#2326;","&#2327;","&#2328;","&#2329;","&#2330;","&#2331;","&#2332;","&#2333;"},
      {"&#2334;","&#2335;","&#2336;","&#2337;","&#2338;","&#2339;","&#2340;","&#2341;","&#2342;"},
      {"&#2343;","&#2344;","&#2346;","&#2347;","&#2348;","&#2349;","&#2350;","&#2351;","&#2352;"},
      {"&#2354;","&#2355;","&#2357;","&#2358;","&#2359;","&#2360;","&#2361;","&#2325;&#2381;&#2359","&#2315;"},
      
      {"&#2332;&#2381;&#2334;","&#2309;","&#2310;","&#2311;","&#2312;","&#2313;","&#2314;","&#2314;","&#2319;"},
      {"&#2320;","&#2323;","&#2324;","&#2366","&#2367;","&#2375;","&#2371;","&#2376;","&#2379;"},
	  {"&#2369;","&#2370;","&#2368;","&#2381;","&#2380;","&#2371;","&#2306;"},
        };
%>



<body>

<form action='search.jsp?' method='get' >
<input id="msg1" type="text" name="t1" placeholder="input here" onkeyup="callchecker(this)"/>
<input type="submit" />
</form>

<button id="togl" >&#2361;&#2367;&#2344;&#2381;&#2342;&#2368; &#2325;&#2368;&#2348;&#2379;&#2352;&#2381;&#2337;</button>
     
<nav  id="keyboard"  >
	 
        
  <%  
for(int i=0;i<ar.length;i++)
{
 for( int j=0;j<ar[i].length;j++)
 {
	 if(ar[i][j]!=""||ar[i][j]!=null)
	 %>

            <input  type="button" value="<%=ar[i][j]%>" onclick="input(this); "  />
            
            <% 
}
 out.println("<br>");
}
%>

 
 <input type="button" value="Backspace" onclick="del();" />&nbsp;
 <button value="&#32;"  onclick="input(this);" > spacebar </button>

</nav>

</body>
</html>
