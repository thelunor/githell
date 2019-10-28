
<jsp:include page="Top.jsp"></jsp:include>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link rel="stylesheet" href="personal.css">
<div id="myCarousel" class="carousel slide" data-ride="carousel">
        <!--Indicators-->
        <ol class="carousel-indicators">
            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
            <li data-target="#myCarousel" data-slide-to="1"></li>
            <li data-target="#myCarousel" data-slide-to="2"></li>
        </ol>
        <!--Wrapper for slides-->
        <div class="carousel-inner" role="listbox">
            <div class="item active">
                <img src="images/1.jpg" alt="석림" width="100%" height="auto">
                <div class="carousel-caption">
                </div>
            </div>
            <div class="item">
                <img src="images/2.jpg" alt="운남" width="100%" height="auto">
                <div class="carousel-caption">
                </div>
            </div>
            <div class="item">
                <img src="images/3.jpg" alt="한강" width="100%" height="auto">
                <div class="carousel-caption">
                </div>
            </div>
        </div>
        </div>
        <!--left and right controls-->
        <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
</div>