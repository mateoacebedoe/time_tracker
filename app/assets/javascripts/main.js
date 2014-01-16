/*menu handler*/
$(function(){

    //<--tags for logging event-->
    $("#event_category_tokens").tokenInput("/categories.json", {
        crossDomain: false,
        theme: "bootstrap"
    });
    //<--tags-->

    //<--tags for logging new category-->
    $("#category_category_tokens").tokenInput("/categories.json", {
        crossDomain: false,
        theme: "bootstrap",
        tokenLimit: 1
    });
    //<--tags-->



    var url = window.location.pathname;
    var activePage = stripTrailingSlash(url);

    navbar_active_functionality(activePage);

    if(url == "/categories/analyze"){
        render_analytics();
    }
});

/*renders all analytics in the page*/
function render_analytics(){
    render_pie_chart_analytics();
}

/*strips the last slash of a string if present
 * @str: the string to be striped
 */
function stripTrailingSlash(str) {
    if(str.substr(-1) == '/') {
        return str.substr(0, str.length - 1);
    }
    return str;
}

/*adds different styling to the active tab in navbar
 * @activePage: path to the current page
 */
function navbar_active_functionality(activePage){
    $('.navbar-nav li a').each(function(){
        var currentPage = stripTrailingSlash($(this).attr('href'));

        if (activePage == currentPage) {
            $(this).parent().addClass('active');
        }
    });
}