$(document).on('turbolinks:load', function(){
    var pets = new Bloodhount({
        datumTokenizer: Bloodhound.tokenizers.whitespace, 
        queryTokenizer: Bloodhound.tokenizers.whitespace, 
        remote: {
            url: '/pets/autocomplete?query=%QUERY',
            wildcard: '%QUERY'
        }
    });
    $('#pets_search').typeahead(null, {
        source: movies
    });
})