<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Boutique</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

	<link href="<c:url value="/resources/css/mycompany.css" />" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="<c:url value="/resources/bower_components/startbootstrap-sb-admin-2/dist/css/sb-admin-2.css" />" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="<c:url value="/resources/bower_components/font-awesome/css/font-awesome.min.css" />" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
	
	<script src="http://maps.googleapis.com/maps/api/js?key=AIzaSyCHWNArOBPWU4NbT6sMlENXfB5hGSjayfM"></script>

</head>
<body>

<!-- Navigation -->
    <div class="navbar-default sidebar" role="navigation">
        <div class="sidebar-nav navbar-collapse">
            <ul class="nav" id="side-menu">
                <li class="sidebar-search">
                    <div class="input-group custom-search-form">
                        <input type="text" class="form-control" placeholder="Search...">
                        <span class="input-group-btn">
                        <button class="btn btn-default" type="button">
                            <i class="fa fa-search"></i>
                        </button>
                    </span>
                    </div>
                    <!-- /input-group -->
                </li>
               	<li>
                  	<a href="/Meltum/melts/"><i class="fa fa-edit fa-fw"></i> Melts</a>
                  	<a href="/Meltum/melts/diffusion"><i class="fa fa-edit fa-fw"></i> Zones de diffusion</a>
                </li>
            </ul>
        </div>
        <!-- /.sidebar-collapse -->
        </div>
        <!-- /.navbar-static-side -->
        
	<!-- Page Content -->
	<div id="page-wrapper" >
		<div class="row">
			<div class="modal fade" id="squarespaceModal" tabindex="-1" role="dialog" data-backdrop="static" data-keyboard="false" aria-labelledby="modalLabel" aria-hidden="true">
			  <div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h3 class="modal-title" id="lineModalLabel">Choisissez votre magasin</h3>
					</div>
					<div class="modal-body">
						
			            <!-- content goes here -->
						<form>
			              <div class="form-group">
			                <label for="shop">Magasin</label>
			                <select class="form-control" id="shopList">
			                	<c:forEach items="${ shopList }" var="shop">
			                		<option value="${shop.id}">${shop.name}</option>
			                	</c:forEach>
			                </select>
			              </div>
			            </form>
			
					</div>
					<div class="modal-footer">
						<div class="btn-group btn-group-justified" role="group" aria-label="group button">
							<div class="btn-group" role="group">
								<button onclick="initialize()" type="button" id="select" class="btn btn-default btn-hover-green" data-dismiss="modal" role="button">Enregistrer</button>
							</div>
						</div>
					</div>
				</div>
			  </div>
			</div>
		
			<div id="googleMap" style="width:100%;height:900px;"></div>
			<button type="button" onclick="submitPointsList()">Submit</button>
		</div>
	</div>
</body>
<!-- Custom Theme JavaScript -->
<script src="<c:url value="/resources/bower_components/startbootstrap-sb-admin-2/dist/js/sb-admin-2.js" />"></script>
<script type="text/javascript">
	$("#shopList option:first").attr('class','selected');
	$("#squarespaceModal").modal('show');
</script>
	<script type="text/javascript">
	
	  var poly, map;
	  var markers = [];
	  var points = [];
	  var path = new google.maps.MVCArray;
	  var currentShop = new google.maps.LatLng(48.864716, 2.349014);
	  
	  function getCurrentShopCoord(id) {
	  	var json = JSON.stringify('${shopListJson}').replace(/\\/g, "");
		var shopList = $.parseJSON('${shopListJson}');
		
		for (i = 0; i < shopList.length; i++) {
				if (shopList[i].id == id) {
					var location = shopList[i].loc;
					return new google.maps.LatLng(loc.y, loc.x);
				}
			}
	  }
	  
	  function Point(x, y){
		  	this.x = x;
		  	this.y = y;
		  }
		  
	  function fillPathAndMarkers(id) {
			var json = JSON.stringify('${shopListJson}').replace(/\\/g, "");
			var shopList = $.parseJSON('${shopListJson}');
			
			for (i = 0; i < shopList.length; i++) {
					if (shopList[i].id == id) {
						if (shopList[i].pol.length > 0) {
							var pol = shopList[i].pol;
							for (var i = 0; i < pol.length; i++) {
								var myLatLng = new google.maps.LatLng(pol[i].y, pol[i].x);
								addMarker(myLatLng);
							}
						}
					}
				}
		    	return markers;
		  }
		  
		  
	  function initialize() {
		//currentShop = getCurrentShopCoord($("#shopList option:selected").val());
	    map = new google.maps.Map(document.getElementById("googleMap"), {
	      zoom: 11,
	      center: currentShop,
	      mapTypeId: google.maps.MapTypeId.ROADMAP
	    });
	    poly = new google.maps.Polygon({
	      strokeWeight: 3,
	      fillColor: '#5555FF'
	    });
	    poly.setMap(map);
		poly.setPaths(new google.maps.MVCArray([path]));
		markers = fillPathAndMarkers($("#shopList option:selected").val());
	    google.maps.event.addListener(map, 'click', addPoint);
	  }
	
	  function addPoint(event) {
	    addMarker(event.latLng);
	  }
	  
	  function addMarker(latLng) {
			poly.getPath().insertAt(path.length, latLng);
		    var marker = new google.maps.Marker({
			      position: latLng,
			      map: map
			    });
			    var point = new Point(marker.getPosition().lng(), marker.getPosition().lat());
			    points.push(point);
			    markers.push(marker);
			    marker.setTitle("#" + path.length);
			
			    google.maps.event.addListener(marker, 'click', function() {
				      marker.setMap(null);
				      for (var i = 0, I = markers.length; i < I && markers[i] != marker; ++i);
				      markers.splice(i, 1);
				      path.removeAt(i);
				      for (var j = 0, J = points.length; j < J && points[j] != point; ++j);
				      points.splice(j, 1);
			      }
			    );
	  }
	  
	  function submitPointsList() {
		  $.ajax({
			    url: '/Meltum/melts/diffusion/saveZone/' + $('#shopList option:selected').val(),
			    type: 'POST',
			    contentType: 'application/json',
			    dataType : 'json',
			    data: JSON.stringify(points),
			    success: function(result) {
	            },
	            error: function(e){
	                alert('failure');
	            }
			});
	}
	</script>
</html>
