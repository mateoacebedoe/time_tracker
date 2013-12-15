//note: currently doing the time period ajax stuff, need to concentrate in fixing the poping on the data array and the rendering of the new information


$(function () {
  create_pie_chart_for("Root", "Month");
});

function create_pie_chart_for(category_name, time_period){
    console.log("=========creating new pie chart============")
    console.log("category name: " + category_name);
    console.log("time period: " + time_period);
    var path = "categories/data";
    var data = {};
    data['category_name'] = category_name;
    data['time_period'] = time_period;

    data._method = 'get';

    $.post(path, data)
        .done(function(data) {
            console.log("=====ajax success======");
            console.log("FULL DATA: " + JSON.stringify(data));

            pie_data = data["pie_data"];
            category_general_data = data["category_general_data"];

            console.log("pie_data: " + JSON.stringify(pie_data));
            console.log("category_general_data: " + JSON.stringify(category_general_data));
            console.log("anestry_titles: " + JSON.stringify(category_general_data["ancestry_titles"]));

            render_breadcrumb(category_general_data["ancestry_titles"]);

            if(!jQuery.isEmptyObject(pie_data)) {
                render_pie(pie_data);
            }
            else {
                render_nothing();
            }
            render_time(category_general_data["time"]);
        })
        .fail(function() {
            console.log("ajax fail");
            return "fail";
        })
}

function render_pie(data){
    console.log("#####rendering pie####");
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
    console.log("#####finishing rendering pie####");

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
    create_pie_chart_for("" +obj.series.label, "month");
}

function render_breadcrumb(ancestry){
    console.log("bread_crum function: element: " + JSON.stringify(ancestry));
    html = "";
    ancestry.forEach(function(cateogry_title){
        html += '<li><a class="bread" href="#">' + cateogry_title + '</a>&nbsp / &nbsp</li>'
    });

    console.log("html :" + html);
    $(".breadcrumb").html(html);
}

function render_time(time){
    html = '<h2> Time: ' + time + '</h2>'
    $(".time").html(html);
}

function render_nothing(){
    html = '<h2> DOES NOT HAVE CHILDREN</h2>'
    $("#interactive").html(html);
    console.log("####DID NOT RENDER THE PIE#####");
}





