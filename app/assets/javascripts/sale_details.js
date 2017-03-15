$(document).ready(function(){

    $(document).on("shown.bs.modal", "#new-detail-modal", function() {


    	var items_suggested = new Bloodhound({
    	  datumTokenizer: Bloodhound.tokenizers.obj.whitespace("descripcion"),
    	  queryTokenizer: Bloodhound.tokenizers.whitespace,
          prefetch: window.location.origin + '/items_suggestion',
    	  remote: {
            url: window.location.origin + '/items_suggestion?query=%QUERY',
        	wildcard: '%QUERY'
    	  }
    	});

    	$('#sale_details_item').typeahead({
    		  hint: true,
    		  highlight: true,
    		  minLength: 1
    	},
    	{
    	  displayKey: 'descripcion',
    	  source: items_suggested,
          templates: {
            suggestion: function (item) {
                return '<p>' + item.descripcion + '</p>';
            }
          }
    	});

        $('#sale_details_item').focus();

    	$('#sale_details_item').typeahead('val', $('#sale_details_item_descripcion').val() );

    	$('#sale_details_item').on('typeahead:select', function(object, datum){
            $('#sale_details_item').val(datum.id);
            $('#sale_details_qty').focus();
            subtotal();
        });

        $('#sale_details_item').on('typeahead:change', function(event, data){
            $('#sale_details_item').val(data);
        });

        $('#sale_details_item').on('blur', function() {
        	data = $('#sale_details_item').val();
        	url = '/validate_suggested_item';
        	$.ajax({
        		url: url,
        		data: { item_descripcion: data },
        		success: function(res){
        			if (res["0"].valid == false){
        				// Item no válido
        				$('#sale_details_item').css('border-color', 'red');
        			}else{
        				// Item correcto
                        $('#sale_details_item_id').val(res["0"].id.toString());
                        $('#sale_details_precio').val(res["0"].precio.toString());
        				$('#sale_details_item').css('border-color', '#ccc');
                        subtotal();
        			}
        		}
        	});
        });

        function subtotal() {
            $('#sale_details_subtotal').val($('#sale_details_qty').val() * $('#sale_details_precio').val());
        };

        $('#sale_details_qty').blur(function(){
             subtotal();
        });

        $('#sale_details_precio').blur(function(){
             subtotal();
        });

    });
});