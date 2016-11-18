<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
    
    <link rel="stylesheet" href="https://openlayers.org/en/v3.19.0/css/ol.css" type="text/css">
    <!-- The line below is only needed for old environments like Internet Explorer and Android 4.x -->
    <script src="https://cdn.polyfill.io/v2/polyfill.min.js?features=requestAnimationFrame,Element.prototype.classList,URL"></script>
    <script src="https://openlayers.org/en/v3.19.0/build/ol.js"></script>
	

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
                  	<a href="/Meltum/shops/"><i class="fa fa-edit fa-fw"></i> Shops</a>
                  	<a href="/Meltum/shops/diffusion"><i class="fa fa-edit fa-fw"></i> Zones de diffusion</a>
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
								<button type="button" id="select" class="btn btn-default btn-hover-green" data-dismiss="modal" role="button">Enregistrer</button>
							</div>
						</div>
					</div>
				</div>
			  </div>
			</div>
			
		    <div id="map" class="map" style="width:100%;height:900px;"></div>
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
var raster = new ol.layer.Tile({
    source: new ol.source.OSM()
  });

  var map = new ol.Map({
    layers: [raster],
    target: 'map',
    view: new ol.View({
      center: [-11000000, 4600000],
      zoom: 4
    })
  });

  var ftrs = fillPathAndMarkers($("#shopList option:selected").val());
  var featureOverlay = new ol.layer.Vector({
    source: new ol.source.Vector({features: ftrs}),
    style: new ol.style.Style({
      fill: new ol.style.Fill({
        color: 'rgba(255, 255, 255, 0.2)'
      }),
      stroke: new ol.style.Stroke({
        color: '#6dc066',
        width: 2
      })
    })
  });
  featureOverlay.setMap(map);

  var modify = new ol.interaction.Modify({
    features: ftrs,
    // the SHIFT key must be pressed to delete vertices, so
    // that new vertices can be drawn at the same position
    // of existing vertices
    deleteCondition: function(event) {
      return ol.events.condition.shiftKeyOnly(event) &&
          ol.events.condition.singleClick(event);
    }
  });
  map.addInteraction(modify);

  var draw; // global so we can remove it later
  var typeSelect = document.getElementById('type');

  function addInteraction() {
    draw = new ol.interaction.Draw({
      features: ftrs,
      type: ("Polygon")
    });
    map.addInteraction(draw);
  }

  addInteraction();
  
  draw.on('drawstart', function (e) {
 	ftrs.clear();
  });
  
  function Point(x, y){
	  	this.x = x;
	  	this.y = y;
	  }
  
  function submitPointsList() {
	  var points = [];
	  featureOverlay.getSource().getFeatures().forEach(function(feature) {
		  feature.getGeometry().getCoordinates()[0].forEach(function(currentPoint) {
			  var lonlat = ol.proj.transform(currentPoint, 'EPSG:3857', 'EPSG:4326');
			  var point = new Point(lonlat[0], lonlat[1]);
			  points.push(point);
		  });
		 
	  });
	  $.ajax({
		    url: '/Meltum/shops/diffusion/saveZone/' + $('#shopList option:selected').val(),
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
  
  function fillPathAndMarkers(id) {
		var json = JSON.stringify('${shopListJson}').replace(/\\/g, "");
		var shopList = $.parseJSON('${shopListJson}');
		var features = new ol.Collection();
		var pts = [];
		
		for (i = 0; i < shopList.length; i++) {
				if (shopList[i].id == id && shopList[i].pol != null) {
					if (shopList[i].pol.length > 0) {
						var pol = shopList[i].pol;
						var thing = new ol.geom.Polygon();
						for (var i = 0; i < pol.length; i++) {
							  pts.push(ol.proj.transform([pol[i].x, pol[i].y], 'EPSG:4326', 'EPSG:3857'));
						}
					}
				}
			}
		var featurething = new ol.Feature({
		    name: "Poly",
		    geometry: new ol.geom.Polygon([pts])
		});
		 features.push(featurething);
		return features;
	  }
</script>
</html>
