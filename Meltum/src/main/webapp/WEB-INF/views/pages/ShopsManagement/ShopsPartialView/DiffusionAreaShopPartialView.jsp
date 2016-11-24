<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- Modal for add shop -->
<div class="modal fade" tabindex="-1" id="DiffusionAreaShop${shop.id}">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header modal-header-info">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title text-center"><i class="fa fa-rss fa-fw"></i> Zone de diffusion de <strong>${shop.name}</strong></h4>
            </div>
                <div class="modal-body">
                    <div id="map${shop.id}" class="map" style="width:100%;height:700px;"></div>
                </div>
                <div class="modal-footer">
                    <div class="row">
                        <div class="col-md-9">
                            <button type="button" onclick="submitPointsList()" class="btn btn-success btn-lg btn-block">Valider</button>
                        </div>
                        <div class="col-md-3">
                            <button type="button" class="btn btn-danger btn-lg btn-block" data-dismiss="modal">Annuler</button>
                        </div>
                    </div>
                </div>
        </div>
    </div>
</div>
<script type="text/javascript">
var raster = new ol.layer.Tile({
    source: new ol.source.OSM()
  });

  var map = new ol.Map({
    layers: [raster],
    target: 'map${shop.id}',
    view: new ol.View({
      center: [-11000000, 4600000],
      zoom: 4
    })
  });

  var ftrs = fillPathAndMarkers('${shop.id}');
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
	  console.log(points);
	  $.ajax({
		    url: '/Meltum/ShopsManagement/diffusion/saveZone/' + '${shop.id}',
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
		var features = new ol.Collection();
		console.log('${shop.pol}');
 		var pts = [];
		
// 		if ('${shop}'.pol.length > 0) {
// 			var pol = shopList[i].pol;
// 			var thing = new ol.geom.Polygon();
// 			for (var i = 0; i < pol.length; i++) {
// 				  pts.push(ol.proj.transform([pol[i].x, pol[i].y], 'EPSG:4326', 'EPSG:3857'));
// 			}
// 		}
// 		var featurething = new ol.Feature({
// 		    name: "Poly",
// 		    geometry: new ol.geom.Polygon([pts])
// 		});
// 		 features.push(featurething);
		return features;
	  }
</script>