<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<div class="modal fade" tabindex="-1" id="StatisticsAllShop">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header modal-header-purple">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title text-center">
					<i class="fa fa-rss fa-fw"></i> Statistiques de <strong>tous les shops</strong>
				</h4>
			</div>
			<div class="modal-body">
				<div class="row">
					<div class="col-md-12">
						<div id="containerstatisticsAllShops" style="margin: 0 auto;text-align: left;width: 800px;"></div>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<div class="row">
					<div class="col-md-12">
						<button type="button" class="btn btn-primary btn-lg btn-block" data-dismiss="modal">Retour</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	$(function () {
		var meltStatData = new Array();
		<c:forEach items="${statisticsAllShops}" var="statisticsAllShops" varStatus="status">
			meltStatDetails = new Object();
			meltStatDetails.name = '${statisticsAllShops.name}';
			meltStatDetails.y = ${statisticsAllShops.earnAmount};
			meltStatDetails.x = ${statisticsAllShops.usedAmount}; 
			meltStatData.push(meltStatDetails);
		</c:forEach> 
		console.log(meltStatData);
		var id = 'containerstatisticsAllShops';
		console.log(id);
	    Highcharts.chart(id, {
	        chart: {
	            plotBackgroundColor: null,
	            plotBorderWidth: null,
	            plotShadow: false,
	            type: 'pie'
	        },
	        title: {
	            text: 'Argent gagné en fonction des shops'
	        },
	        tooltip: {
	            pointFormat: '{series.name}: <b>{point.x}</b>'
	        },
	        plotOptions: {
	            pie: {
	                allowPointSelect: true,
	                cursor: 'pointer',
	                dataLabels: {
	                    enabled: true,
	                    format: '<b>{point.name}</b>: {point.y} €',
	                    style: {
	                        color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
	                    }
	                }
	            }
	        },
	        series: [{
	            name: 'Melt utilisé',
	            colorByPoint: true,
	            data: meltStatData
	        }]
	    });
	});
</script>