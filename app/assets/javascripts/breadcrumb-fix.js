$( document ).ready(function() {
    $('.breadcrumb').on('click', 'li a', function(e){
            e.preventDefault();
            var category = $(this).text();
            var current_time_period = $(".btn.time_button.btn-success").text();
            console.log(category);
            create_pie_chart_for(category, current_time_period);
        }
    );
});

