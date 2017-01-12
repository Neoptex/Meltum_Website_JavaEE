<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- Modal for add shop -->
<style>
.rotate-north {
  top: 65px;
  left: .5em;
}
.ol-touch .rotate-north {
  top: 80px;
}

</style>
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
                    <div class="alert alert-danger" id="error-message" hidden="hidden">
					  <strong>Attention!</strong> Votre magasin n'est pas dans la zone que vous avez défini.
					</div>
                    <div id="map${shop.id}" class="map" style="width:100%;height:700px;"></div>
                </div>
                <div class="modal-footer">
                    <div class="row">
                        <div class="col-md-9">
                            <button type="button" onclick="submitPointsList('${shop.id}')" id="validate" data-dismiss="modal" class="btn btn-success btn-lg btn-block">Valider</button>
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
var tab = [];
var featureOverlay = null;
var raster = new ol.layer.Tile({
	source: new ol.source.OSM()
});
var vectorHeatMap = new ol.layer.Heatmap({
    source: new ol.source.Vector({
      url: 'http://185.83.218.101:8095/pro/shop/heatmap/',
      format: new ol.format.GeoJSON({
        extractStyles: false
      })
    }),
    visible : false
  });
  
controlHeatMap = function(opt_options) {

	  var options = opt_options || {};

	  var checkbox = document.createElement('input');
	  checkbox.setAttribute('type','checkbox');
	  checkbox.checked = false;

	  var enableDisableHeatMap = function(e) {
		  if (vectorHeatMap.getVisible() == true) {
	    	 return vectorHeatMap.setVisible(false);
		  }
		  return vectorHeatMap.setVisible(true);
	  };

	  checkbox.addEventListener('click', enableDisableHeatMap, false);

	  var element = document.createElement('div');
	  element.className = 'rotate-north ol-unselectable ol-control';
	  element.appendChild(checkbox);

	  ol.control.Control.call(this, {
	    element: element,
	    target: options.target
	  });

	};
	
	ol.inherits(controlHeatMap, ol.control.Control);
	
$('#DiffusionAreaShop${shop.id}').on('shown.bs.modal', function () {
	if (!tab['${shop.id}']) {
			var map = new ol.Map({
			controls: ol.control.defaults({
			    attributionOptions: ({
			      collapsible: false
			    })
			  }).extend([
			    new controlHeatMap()
			  ]),
			  layers: [raster, vectorHeatMap],
			  target: 'map${shop.id}',
			  view: new ol.View({
			    center: ol.proj.transform([parseFloat('${shop.loc.x}'), parseFloat('${shop.loc.y}')], 'EPSG:4326', 'EPSG:3857'),
			    zoom: 15,
			  })
			});
		
		  var ftrs = fillPathAndMarkers('${shop.id}');
		  featureOverlay = new ol.layer.Vector({
		    source: new ol.source.Vector({features: ftrs}),
		    style: new ol.style.Style({
		      fill: new ol.style.Fill({
		        color: 'rgba(255, 255, 255, 0.2)'
		      }),
		      stroke: new ol.style.Stroke({
		        color: '#00078c',
		        width: 2
		      })
		    })
		  });
		  featureOverlay.setMap(map);
		tab['${shop.id}'] = true;
	}

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
 	$('#validate').prop('disabled', false);
  });
  
  draw.on('drawend', function(evt){
	  var coord = ol.proj.fromLonLat(ol.proj.transform([parseFloat('${shop.loc.x}'), parseFloat('${shop.loc.y}')], 'EPSG:4326', 'EPSG:4326'));
	  var polygon_extent = evt.feature.getGeometry().getExtent();
	  var contains = ol.extent.containsCoordinate(polygon_extent, coord);
	  $('#error-message').hide();
	  if (!contains) {
		  $('#error-message').show();
		  $('#validate').prop('disabled', true);
	  }
  });
  
  function fillPathAndMarkers(id) {
		var features = new ol.Collection();
 		var pts = [];
 		var pol = '${shop.pol}';
		
		<c:forEach var="point" items="${shop.pol}">
			var x = ${point.x};
			var y = ${point.y};
			pts.push(ol.proj.transform([x, y], 'EPSG:4326', 'EPSG:3857'));
       	</c:forEach>
		var featurething = new ol.Feature({
		    name: "Poly",
		    geometry: new ol.geom.Polygon([pts])
		});
		 features.push(featurething);
		return features;
	  }
});

function Point(x, y){
  	this.x = x;
  	this.y = y;
  }

function submitPointsList(id) {
	  var points = [];
	  featureOverlay.getSource().getFeatures().forEach(function(feature) {
		  feature.getGeometry().getCoordinates()[0].forEach(function(currentPoint) {
			  var lonlat = ol.proj.transform(currentPoint, 'EPSG:3857', 'EPSG:4326');
			  var point = new Point(lonlat[0], lonlat[1]);
			  points.push(point);
		  });
		 
	  });
	  $.ajax({
		    url: '/Meltum/ShopsManagement/diffusion/saveZone/' + id,
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