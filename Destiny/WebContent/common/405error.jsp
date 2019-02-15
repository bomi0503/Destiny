<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>


<!DOCTYPE html>
<html lang="en" >

<head>

  <meta charset="UTF-8">
  <link rel="shortcut icon" type="image/x-icon" href="https://static.codepen.io/assets/favicon/favicon-8ea04875e70c4b0bb41da869e81236e54394d63638a1ef12fa558a4a835f1164.ico" />
  <link rel="mask-icon" type="" href="https://static.codepen.io/assets/favicon/logo-pin-f2d2b6d2c61838f7e76325261b7195c27224080bc099486ddd6dccb469b8e8e6.svg" color="#111" />
  <title>CodePen - 405error</title>
  
  
  
  
      <style>
      body{
    margin: 0;
    padding: 20px;
    background-color:rgba(234, 156, 221, 0.29);
    font-family: arial;
  height: 700px
}

.info{
  position: absolute;
  top:0;
  left:0;
  padding: 10px 0;
  font-size: 110%;
  text-transform: capitalize;
  color:#FFC900;
  font-weight: 700;
  background-color:#fff;
  width:100%;
  text-align:center
}

.info a{
  text-decoration: none;
  color:#333
}
.info a:after{
  content:" | ";
  color:#FFC900
}

.info a:last-of-type:after{content:""}

.box{
    text-align: center;
    position: relative;
    
}

.box div{
    width: 250px;
    height: 80px;
    line-height: 80px;
    color:rgba(0, 126, 255, 0.46);
    background-color: #fff;
    font-size: 280%;
    position: absolute;
    top:490px;
    left:40%;
    text-transform: capitalize;
    animation: moving 8s linear infinite;
  -webkit-animation: moving 8s linear infinite;
  -moz-animation: moving 8s linear infinite;
  -o-animation: moving 8s linear infinite;
  
    transform-origin: 50% -400%;
  -webkittransform-origin: 50% -400%;
  -moz-transform-origin: 50% -400%;
  -o-transform-origin: 50% -400%;
}

.box div:before{
    content: "";
    width: 25px;
    height: 25px;
    background-color:#fff;
    border-radius: 50%;
    display: block;
    position: absolute;
    left:45%;
    top:-350px;
}

.box div:after{
    content: "";
    width: 3px;
    height: 335px;
    background-color: #fff;
    display: block;
    position: absolute;
    left: 50%;
    top: -330px;
}

.box p{
    position: absolute;
    top:560px;
    left:39%;
    font-weight: 700;
    text-transform: uppercase;
  color:#fff;
  width: 300px
}

.box p span{
  display: block;
  font-size:300%
}

@keyframes moving{
    0%,100%{
        transform: rotate(0)
    }
    25%{
        transform: rotate(3deg);
    }
    50%{
        transform: rotate(-3deg)
    }
}

@-webkit-keyframes moving{
    0%,100%{
        transform: rotate(0)
    }
    25%{
        transform: rotate(3deg);
    }
    50%{
        transform: rotate(-3deg)
    }
}

@-moz-keyframes moving{
    0%,100%{
        transform: rotate(0)
    }
    25%{
        transform: rotate(3deg);
    }
    50%{
        transform: rotate(-3deg)
    }
}

@-o-keyframes moving{
    0%,100%{
        transform: rotate(0)
    }
    25%{
        transform: rotate(3deg);
    }
    50%{
        transform: rotate(-3deg)
    }
}
    </style>

  <script>
  window.console = window.console || function(t) {};
</script>

  
  
  <script>
  if (document.location.search.match(/type=embed/gi)) {
    window.parent.postMessage("resize", "*");
  }
</script>


</head>

<body translate="no" >

  <!-- <div class="info">
  follow me : 
  <a href="https://codepen.io/mo7hamed/pens/public/#" target="_blank">codepen</a>
  
  <a href="https://plus.google.com/u/0/115875826373261470610" target="_blank">gmail</a>
</div> -->

<div class="box">
            <div>
                close !
            </div>
            <p><span>405error !</span> sorry page isn't found for one of the reformes </p>
        </div>
  
  
  
  
  

  <script src="https://static.codepen.io/assets/editor/live/css_reload-5619dc0905a68b2e6298901de54f73cefe4e079f65a75406858d92924b4938bf.js"></script>
</body>

</html>
 

 