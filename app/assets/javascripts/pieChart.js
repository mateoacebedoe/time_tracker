//note: currently doing the time period ajax stuff, need to concentrate in fixing the poping on the data array and the rendering of the new information


$(function () {
  $("#Month").attr("class", "btn time_button btn-success")

  create_pie_chart_for("Root", "Month");

  $(".time_button").click(function(){
     change_time_period($(this));
  });
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

            render_breadcrumb(category_name, category_general_data["ancestry_titles"]);

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
                    radius:300,
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
    var current_time_period = $(".btn.time_button.btn-success").text();
    console.log("{}{}{}{}{}{}time_period: " + JSON.stringify($(".btn.time_button.btn-success").text()));

    if (!obj)
    return;
    create_pie_chart_for("" +obj.series.label, current_time_period);
}

//this ca
function render_breadcrumb(category_title, category_ancestry){
    console.log("bread_crum function: element: " + JSON.stringify(category_ancestry));
    html = "";
    category_ancestry.forEach(function(ancestor_category_title){
        html += '<li><a class="bread" href="#">' + ancestor_category_title + '</a>&nbsp / &nbsp</li>'
    });

    html += '<li class="active">' + category_title + '</a>&nbsp / &nbsp</li>'

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

function change_time_period(new_time_period_node){
    var current_time_period_node = $(".btn.time_button.btn-success");
    if( current_time_period_node === new_time_period_node){
        return;
    }
    else{
        current_time_period_node.attr("class", "btn time_button");
        new_time_period_node.attr("class", "btn time_button btn-success");
        var time_period = new_time_period_node.text();
        create_pie_chart_for("Root", time_period);
    }
}




