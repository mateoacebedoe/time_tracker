$( document ).ready(function() {
    $('.breadcrumb').on('click', 'li a', function(e){
            e.preventDefault();
            var category = $(this).text();
            console.log(category);
            create_pie_chart_for(category);
        }
    );
});

