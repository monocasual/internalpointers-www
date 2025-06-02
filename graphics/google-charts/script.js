google.charts.load('current', {packages: ['corechart', 'bar']});
google.charts.setOnLoadCallback(draw);

function draw() {
	
	var dataTable = new google.visualization.DataTable();
	dataTable.addColumn('string', 'Year');
	dataTable.addColumn('number', 'Gains');
	dataTable.addColumn('number', 'Losses');
	dataTable.addColumn({type: 'number', role: 'annotation'});
	
	data = [
['2000', 62, 89],
['2001', 86, 136],
['2002', 91, 109],
['2003', 109, 145],
['2004', 101, 161],
['2005', 114, 146],
['2006', 118, 140],
['2007', 106, 153],
['2008', 124, 136],
['2009', 118, 141],
['2010', 110, 149],
['2011', 101, 159],
['2012', 98, 162],
['2013', 114, 145],
['2014', 109, 149],
['2015', 113, 146],
	];
	
	data.forEach(function(d) {
		d.push(d[1]/d[2]);  // g/l ratio
		dataTable.addRow(d);
	});

	var options = {
		'title': 'START_HOUR=10am, STOP_LOSS=-0.0007, TAKE_PROFIT=0.0004',
		'width': 800,
		'height': 400,
		'backgroundColor': '#333333',
		'isStacked': true,
		'colors': ['green', 'red'],
		'annotations': {
			'alwaysOutside': true,
			'textStyle': {
				'fontSize': 14,
				'color': '#DCDCDC',
				'auraColor': 'none'
			}
		},
		'legend': { 
			'textStyle': { 
				'color': '#DCDCDC'
			} 
		},
		'titleTextStyle': {
			'color': '#DCDCDC'
		},
		'hAxis': {
			'title': 'Year',
			'slantedText': true,
			'slantedTextAngle': 90,
			'textStyle': {
				'color': '#DCDCDC'
			},
			'titleTextStyle': {
				'color': '#DCDCDC'
			}
		},
		'vAxis': {
			'title': 'Gains/losses ratio',
			'textStyle': {
				'color': '#DCDCDC'
			},
			'titleTextStyle': {
				'color': '#DCDCDC'
			},
			'gridlines': {
				'color': '#666666'
			}
		}
	};
	
	var formatter = new google.visualization.NumberFormat({
		fractionDigits: 1
	});
	formatter.format(dataTable, 3); // apply formatter to 4th column

	var chart = new google.visualization.ColumnChart(document.getElementById('chart_div'));
	chart.draw(dataTable, options);
}
