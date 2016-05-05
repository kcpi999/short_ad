(function($){
    $(document).ready(function() {
        initControls();        
    });
    
    function initControls() {
        $('.short-ad-form').on('keyup', function(e) {
            if (isEnter(e)) {
                e.preventDefault();
                submit_form();
            }
        });
        
        $('.short-ad-form').on('click', '.submit', function(e) {
            submit_form();
        });
        
        $('#short-url').on('click', function(){
            selectText('short-url');
        });
    }
    
    function submit_form() {
        var $form = $('.short-ad-form');
        var original_url = $form.find('#original_url').val();
        var $url_controls = $('.url-controls');
        $.post('/ajax/make-short-address', {
                'original_url': original_url
            },
            function(data) {
                if (typeof data.error !== 'undefined' && data.error.length > 0) {
                    var txt = data.error.join('<br>');                    
                    showError(txt);
                    return;
                }
                var short_url = data.short_url;
                showShortUrl(short_url);
            }
        )
    }
    
    function showError(txt) {
        $('#error').html(txt);
        $('.url-controls .result').addClass('none');
    }
    
    function showShortUrl(short_url) {        
        $('.url-controls .result').removeClass('none');
        var $short_url_tag = $('#short-url');
        $short_url_tag.text(short_url);        
        $('#error').html('');
    }
    
    function isEnter(e) {
        var code = e.which;
        return !!(code === 13);
    }
    
    function selectText(element) {
        var doc = document
            , text = doc.getElementById(element)
            , range, selection
        ;    
        if (doc.body.createTextRange) {
            range = document.body.createTextRange();
            range.moveToElementText(text);
            range.select();
        } else if (window.getSelection) {
            selection = window.getSelection(); 
            range = document.createRange();
            range.selectNodeContents(text);
            selection.removeAllRanges();
            selection.addRange(range);
        }        
    }
    
    
})(jQuery)
