$('input.event_title').tagsinput({
    typeahead: {
        source: function(query) {
            console.log("==========tag==========");
            return $.get('/events/in_database');
        }
    }
});
