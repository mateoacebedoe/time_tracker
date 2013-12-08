$(function () {
    // data
    /*var data = [
     { label: "Series1",  data: 10},
		{ label: "Series2",  data: 30},
		{ label: "Series3",  data: 90},
		{ label: "Series4",  data: 70},
		{ label: "Series5",  data: 80},
		{ label: "Series6",  data: 110}
];*/
/*var data = [
		{ label: "Series1",  data: [[1,10]]},
		{ label: "Series2",  data: [[1,30]]},
		{ label: "Series3",  data: [[1,90]]},
		{ label: "Series4",  data: [[1,70]]},
		{ label: "Series5",  data: [[1,80]]},
		{ label: "Series6",  data: [[1,0]]}
];*/
//var data = [];
//var series = Math.floor(Math.random()*10)+1;
//for( var i = 0; i<series; i++)
//	{
//        data[i] = { label: "Series"+(i+1), data: Math.floor(Math.random()*100)+1 }
//        console.log(JSON.stringify(data));
//}

create_pie_chart_for("Root");

});

function create_pie_chart_for(category_name){
    console.log(category_name);
    var path = "categories/data";
    var data = {};
    data['category_name'] = category_name;
    data._method = 'get';
    $.post(path, data)
        .done(function(data) {
            console.log("ajax success");
            console.log("data: " + JSON.stringify(data));
            create_pie(data);
        })
        .fail(function() {
            console.log("ajax fail");
            return "fail";
        })
}

function create_pie(data){
    // INTERACTIVE
    $.plot($("#interactive"), data,
        {
            series: {
                pie: {
                    show: true,
                    radius:150,
                    label:{
                        show: true,
                        radius: 1/2,
                        formatter: function(label, series){
                            return '<div style="font-size:8pt;text-align:center;padding:2px;color:white;">'+label+'<br/>'+Math.round(series.percent)+'%</div>';
                        }
                    }
                }
            },
            grid: {
                hoverable: true,
                clickable: true
            }
        });

    $("#interactive").bind("plothover", pieHover);
    $("#interactive").bind("plotclick", pieClick);
}


function pieHover(event, pos, obj)
{
    if (!obj)
    return;
    percent = parseFloat(obj.series.percent).toFixed(2);
    $("#hover").html('<span style="font-weight: bold; color: '+obj.series.color+'">'+obj.series.label+' ('+percent+'%)</span>');
    }

function pieClick(event, pos, obj)
{
    if (!obj)
    return;
    //percent = parseFloat(obj.series.percent).toFixed(2);
    create_pie_chart_for("" +obj.series.label);
    }




